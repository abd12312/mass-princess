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
  shades = [],
}: {
  product: Product;
  locale: Locale;
  t: Dict;
  shades?: string[];
}) {
  const { add } = useCart();
  const router = useRouter();
  const [qty, setQty] = useState(1);
  const [added, setAdded] = useState(false);
  const [shade, setShade] = useState<string | null>(null);

  if (product.stock <= 0) {
    return <p className="rounded-xl bg-gray-100 px-4 py-3 font-semibold text-gray-500">{t.outOfStock}</p>;
  }

  const needsShade = shades.length > 0 && !shade;

  return (
    <div className="space-y-4">
      {shades.length > 0 && (
        <div>
          <p className="mb-2 font-semibold">
            {t.shade}: {shade ? <span className="text-brand-700">{shade}</span> : <span className="text-sm font-normal text-gray-400">{t.chooseShade}</span>}
          </p>
          <div className="flex flex-wrap gap-2">
            {shades.map((s) => (
              <button
                key={s}
                type="button"
                onClick={() => setShade(s)}
                className={`min-w-10 rounded-full border px-3 py-1.5 text-sm font-semibold transition ${
                  shade === s
                    ? "border-brand-500 bg-brand-500 text-white"
                    : "border-gray-300 bg-white text-gray-700 hover:border-brand-400"
                }`}
              >
                {s}
              </button>
            ))}
          </div>
        </div>
      )}

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
          className={`btn-primary ${needsShade ? "cursor-not-allowed opacity-50" : ""}`}
          disabled={needsShade}
          title={needsShade ? t.chooseShade : undefined}
          onClick={() => {
            if (needsShade) return;
            add({
              productId: product.id,
              slug: product.slug,
              name_ar: product.name_ar,
              name_en: product.name_en,
              price: Number(product.price),
              image: product.images[0] ?? null,
              qty,
              stock: product.stock,
              shade,
            });
            setAdded(true);
            setTimeout(() => router.push(`/${locale}/cart`), 400);
          }}
        >
          {added ? "✓" : needsShade ? t.chooseShade : t.addToCart}
        </button>
      </div>
    </div>
  );
}
