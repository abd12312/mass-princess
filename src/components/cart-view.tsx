"use client";
import Link from "next/link";
import type { Dict, Locale } from "@/lib/i18n";
import { cartKey, type StoreSettings } from "@/lib/types";
import { useCart } from "./cart-context";

export function shippingFor(subtotal: number, s: StoreSettings) {
  if (s.free_shipping_over != null && subtotal >= s.free_shipping_over) return 0;
  return Number(s.shipping_fee) || 0;
}

export default function CartView({
  locale,
  t,
  settings,
}: {
  locale: Locale;
  t: Dict;
  settings: StoreSettings;
}) {
  const { items, remove, setQty, subtotal } = useCart();
  const shipping = shippingFor(subtotal, settings);
  const fmt = (n: number) => `${n.toFixed(2)} ${t.jod}`;

  if (items.length === 0) {
    return (
      <div className="mx-auto max-w-3xl px-4 py-20 text-center">
        <p className="text-4xl">🛒</p>
        <p className="mt-4 text-xl font-semibold text-gray-600">{t.cartEmpty}</p>
        <Link href={`/${locale}/products`} className="btn-primary mt-6">
          {t.continueShopping}
        </Link>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <h1 className="mb-6 text-3xl font-bold">{t.cart}</h1>
      <div className="space-y-4">
        {items.map((i) => (
          <div key={cartKey(i.productId, i.shade)} className="card flex items-center gap-4 p-3">
            <Link href={`/${locale}/products/${i.slug}`} className="h-20 w-20 shrink-0 overflow-hidden rounded-xl bg-white">
              {i.image ? (
                // eslint-disable-next-line @next/next/no-img-element
                <img src={i.image} alt="" className="h-full w-full object-cover" />
              ) : (
                <div className="flex h-full items-center justify-center text-brand-200">✦</div>
              )}
            </Link>
            <div className="min-w-0 flex-1">
              <p className="truncate font-semibold">{locale === "ar" ? i.name_ar : i.name_en}</p>
              {i.shade && (
                <p className="text-xs text-gray-500">
                  {t.shade}: <span className="font-semibold text-gray-700">{i.shade}</span>
                </p>
              )}
              <p className="text-sm text-brand-700">{fmt(i.price)}</p>
              <button onClick={() => remove(cartKey(i.productId, i.shade))} className="mt-1 text-xs text-red-500 hover:underline">
                {t.remove}
              </button>
            </div>
            <div className="flex items-center rounded-full border border-gray-300">
              <button className="px-3 py-1.5 font-bold" onClick={() => setQty(cartKey(i.productId, i.shade), i.qty - 1)}>−</button>
              <span className="w-7 text-center text-sm font-semibold">{i.qty}</span>
              <button className="px-3 py-1.5 font-bold" onClick={() => setQty(cartKey(i.productId, i.shade), i.qty + 1)}>+</button>
            </div>
            <p className="w-20 text-end font-bold">{fmt(i.price * i.qty)}</p>
          </div>
        ))}
      </div>

      <div className="card mt-6 space-y-2 p-5">
        <div className="flex justify-between text-sm">
          <span>{t.subtotal}</span>
          <span>{fmt(subtotal)}</span>
        </div>
        <div className="flex justify-between text-sm">
          <span>{t.shipping}</span>
          <span>{shipping === 0 ? t.freeShipping : fmt(shipping)}</span>
        </div>
        <div className="flex justify-between border-t pt-2 text-lg font-bold">
          <span>{t.total}</span>
          <span className="text-brand-700">{fmt(subtotal + shipping)}</span>
        </div>
        <Link href={`/${locale}/checkout`} className="btn-primary mt-3 w-full">
          {t.checkout}
        </Link>
      </div>
    </div>
  );
}
