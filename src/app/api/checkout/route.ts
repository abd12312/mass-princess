import { NextResponse } from "next/server";
import { createClient as createSb } from "@supabase/supabase-js";
import { DEFAULT_SETTINGS, type CartItem, type StoreSettings } from "@/lib/types";

export async function POST(req: Request) {
  try {
    const body = await req.json();
    const {
      customer_name,
      phone,
      city,
      address,
      notes,
      payment_method,
      items,
    }: {
      customer_name: string;
      phone: string;
      city: string;
      address: string;
      notes?: string;
      payment_method: "cod" | "card" | "whatsapp";
      items: CartItem[];
    } = body;

    if (!customer_name?.trim() || !phone?.trim() || !city?.trim() || !address?.trim())
      return NextResponse.json({ error: "missing_fields" }, { status: 400 });
    if (!Array.isArray(items) || items.length === 0)
      return NextResponse.json({ error: "empty_cart" }, { status: 400 });

    const supabase = createSb(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
    );

    // Re-price server-side from DB (never trust client prices)
    const ids = items.map((i) => i.productId);
    const { data: products, error: pErr } = await supabase
      .from("products")
      .select("id, price, stock, name_ar, name_en, images")
      .in("id", ids);
    if (pErr || !products) return NextResponse.json({ error: "products_fetch" }, { status: 500 });

    const map = new Map(products.map((p) => [p.id, p]));
    let subtotal = 0;
    const orderItems: {
      product_id: string;
      name_ar: string;
      name_en: string;
      price: number;
      qty: number;
      image: string | null;
    }[] = [];
    for (const i of items) {
      const p = map.get(i.productId);
      if (!p) continue;
      const qty = Math.max(1, Math.min(Number(i.qty) || 1, 99));
      const shade =
        typeof i.shade === "string" && i.shade.trim() ? i.shade.trim().slice(0, 60) : null;
      subtotal += Number(p.price) * qty;
      orderItems.push({
        product_id: p.id,
        name_ar: shade ? `${p.name_ar} — درجة ${shade}` : p.name_ar,
        name_en: shade ? `${p.name_en} — Shade ${shade}` : p.name_en,
        price: Number(p.price),
        qty,
        image: (p.images as string[])[0] ?? null,
      });
    }
    if (orderItems.length === 0)
      return NextResponse.json({ error: "empty_cart" }, { status: 400 });

    const { data: sRow } = await supabase.from("settings").select("value").eq("key", "store").single();
    const settings: StoreSettings = { ...DEFAULT_SETTINGS, ...(sRow?.value ?? {}) };
    const shipping =
      settings.free_shipping_over != null && subtotal >= settings.free_shipping_over
        ? 0
        : Number(settings.shipping_fee) || 0;

    const { data: order, error: oErr } = await supabase
      .from("orders")
      .insert({
        customer_name: customer_name.trim(),
        phone: phone.trim(),
        city: city.trim(),
        address: address.trim(),
        notes: notes?.trim() || null,
        payment_method,
        subtotal,
        shipping,
        total: subtotal + shipping,
      })
      .select("id, order_number, total")
      .single();
    if (oErr || !order) return NextResponse.json({ error: "order_insert" }, { status: 500 });

    const { error: iErr } = await supabase
      .from("order_items")
      .insert(orderItems.map((oi) => ({ ...oi, order_id: order.id })));
    if (iErr) return NextResponse.json({ error: "items_insert" }, { status: 500 });

    // Decrement stock (best-effort)
    await Promise.all(
      orderItems.map((oi) => supabase.rpc("decrement_stock", { p_id: oi.product_id, p_qty: oi.qty }))
    );

    return NextResponse.json({
      ok: true,
      order_id: order.id,
      order_number: order.order_number,
      total: order.total,
      whatsapp_number: settings.whatsapp_number,
    });
  } catch {
    return NextResponse.json({ error: "server_error" }, { status: 500 });
  }
}
