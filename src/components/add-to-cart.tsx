"use client";
import { useState } from "react";
import { useRouter } from "next/navigation";
import type { Dict, Locale } from "@/lib/i18n";
import type { Product } from "@/lib/types";
import { useCart } from "./cart-context";

export default function AddToCart({
  product,
  locale,
  t,
}: {
  product: Product;
  locale: Locale;
  t: Dict;
}) {
  const { add } = useCart();
  const router = useRouter();
  const [qty, setQty] = useState(1);
  const [added, setAdded] = useState(false);

  if (product.stock <= 0) {
    return <p className="rounded-xl bg-gray-100 px-4 py-3 font-semibold text-gray-500">{t.outOfStock}</p>;
  }

  return (
    <div className="flex flex-wrap items-center gap-3">
      <div className="flex items-center rounded-full border border-gray-300">
        <button
          className="px-4 py-2 text-lg font-bold"
          onClick={() => setQty((q) => Math.max(1, q - 1))}
        >
          −
        </button>
        <span className="w-8 text-center font-semibold">{qty}</span>
        <button
          className="px-4 py-2 text-lg font-bold"
          onClick={() => setQty((q) => Math.min(product.stock, q + 1))}
        >
          +
        </button>
      </div>
      <button
        className="btn-primary"
        onClick={() => {
          add({
            productId: product.id,
            slug: product.slug,
            name_ar: product.name_ar,
            name_en: product.name_en,
            price: Number(product.price),
            image: product.images[0] ?? null,
            qty,
            stock: product.stock,
          });
          setAdded(true);
          setTimeout(() => router.push(`/${locale}/cart`), 400);
        }}
      >
        {added ? "✓" : t.addToCart}
      </button>
    </div>
  );
}
