"use client";
import { useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import type { Dict, Locale } from "@/lib/i18n";
import type { PaymentMethod, StoreSettings } from "@/lib/types";
import { useCart } from "./cart-context";
import { shippingFor } from "./cart-view";

export default function CheckoutForm({
  locale,
  t,
  settings,
}: {
  locale: Locale;
  t: Dict;
  settings: StoreSettings;
}) {
  const { items, subtotal, clear } = useCart();
  const router = useRouter();
  const [form, setForm] = useState({ customer_name: "", phone: "", city: "", address: "", notes: "" });
  const [method, setMethod] = useState<PaymentMethod>("cod");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const shipping = shippingFor(subtotal, settings);
  const total = subtotal + shipping;
  const fmt = (n: number) => `${n.toFixed(2)} ${t.jod}`;

  if (items.length === 0) {
    return (
      <div className="mx-auto max-w-3xl px-4 py-20 text-center">
        <p className="text-xl font-semibold text-gray-600">{t.cartEmpty}</p>
        <Link href={`/${locale}/products`} className="btn-primary mt-6">
          {t.continueShopping}
        </Link>
      </div>
    );
  }

  const set = (k: keyof typeof form) => (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) =>
    setForm((f) => ({ ...f, [k]: e.target.value }));

  async function submit(e: React.FormEvent) {
    e.preventDefault();
    setError("");
    setLoading(true);
    try {
      const res = await fetch("/api/checkout", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ...form, payment_method: method, items }),
      });
      const data = await res.json();
      if (!res.ok || !data.ok) throw new Error(data.error || "error");

      if (method === "whatsapp" && data.whatsapp_number) {
        const lines = items
          .map((i) => `• ${locale === "ar" ? i.name_ar : i.name_en} × ${i.qty} — ${fmt(i.price * i.qty)}`)
          .join("\n");
        const msg =
          locale === "ar"
            ? `مرحبا، بدي أأكد طلبي رقم #${data.order_number}:\n${lines}\n${t.total}: ${fmt(total)}\nالاسم: ${form.customer_name}\nالمدينة: ${form.city}`
            : `Hello, I'd like to confirm my order #${data.order_number}:\n${lines}\n${t.total}: ${fmt(total)}\nName: ${form.customer_name}\nCity: ${form.city}`;
        window.open(
          `https://wa.me/${data.whatsapp_number.replace(/[^0-9]/g, "")}?text=${encodeURIComponent(msg)}`,
          "_blank"
        );
      }
      clear();
      router.push(`/${locale}/order/${data.order_id}`);
    } catch {
      setError(locale === "ar" ? "حدث خطأ، حاولي مرة أخرى" : "Something went wrong, please try again");
      setLoading(false);
    }
  }

  const methods: { key: PaymentMethod; title: string; desc: string }[] = [
    { key: "cod", title: t.cod, desc: t.codDesc },
    { key: "card", title: t.card, desc: t.cardDesc },
    ...(settings.whatsapp_number ? [{ key: "whatsapp" as PaymentMethod, title: t.whatsapp, desc: t.whatsappDesc }] : []),
  ];

  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <h1 className="mb-6 text-3xl font-bold">{t.checkoutTitle}</h1>
      <form onSubmit={submit} className="grid gap-8 md:grid-cols-5">
        <div className="space-y-4 md:col-span-3">
          <div>
            <label className="label">{t.fullName} *</label>
            <input className="input" required value={form.customer_name} onChange={set("customer_name")} />
          </div>
          <div>
            <label className="label">{t.phone} *</label>
            <input className="input" required dir="ltr" inputMode="tel" value={form.phone} onChange={set("phone")} />
          </div>
          <div>
            <label className="label">{t.city} *</label>
            <input className="input" required value={form.city} onChange={set("city")} />
          </div>
          <div>
            <label className="label">{t.address} *</label>
            <textarea className="input" required rows={2} value={form.address} onChange={set("address")} />
          </div>
          <div>
            <label className="label">{t.notes}</label>
            <textarea className="input" rows={2} value={form.notes} onChange={set("notes")} />
          </div>

          <div>
            <p className="label">{t.paymentMethod}</p>
            <div className="space-y-2">
              {methods.map((m) => (
                <label
                  key={m.key}
                  className={`flex cursor-pointer items-start gap-3 rounded-xl border p-3 transition ${
                    method === m.key ? "border-brand-500 bg-brand-50" : "border-gray-200"
                  }`}
                >
                  <input
                    type="radio"
                    name="method"
                    className="mt-1"
                    checked={method === m.key}
                    onChange={() => setMethod(m.key)}
                  />
                  <span>
                    <span className="block font-semibold">{m.title}</span>
                    <span className="block text-sm text-gray-500">{m.desc}</span>
                    {m.key === "card" && method === "card" && (
                      <span className="mt-1 block text-xs text-amber-600">{t.cardComingSoon}</span>
                    )}
                  </span>
                </label>
              ))}
            </div>
          </div>
        </div>

        <div className="md:col-span-2">
          <div className="card sticky top-20 space-y-2 p-5">
            {items.map((i) => (
              <div key={i.productId} className="flex justify-between text-sm">
                <span className="truncate pe-2">
                  {locale === "ar" ? i.name_ar : i.name_en} × {i.qty}
                </span>
                <span className="shrink-0">{fmt(i.price * i.qty)}</span>
              </div>
            ))}
            <div className="flex justify-between border-t pt-2 text-sm">
              <span>{t.shipping}</span>
              <span>{shipping === 0 ? t.freeShipping : fmt(shipping)}</span>
            </div>
            <div className="flex justify-between text-lg font-bold">
              <span>{t.total}</span>
              <span className="text-brand-700">{fmt(total)}</span>
            </div>
            {error && <p className="text-sm text-red-500">{error}</p>}
            <button type="submit" disabled={loading} className="btn-primary w-full">
              {loading ? "..." : t.placeOrder}
            </button>
          </div>
        </div>
      </form>
    </div>
  );
}
