"use client";
import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import type { Dict, Locale } from "@/lib/i18n";
import type { Product } from "@/lib/types";
import { useCart } from "./cart-context";

export default function ProductView({
  product,
  locale,
  t,
  shades,
  name,
  priceLine,
  desc,
}: {
  product: Product;
  locale: Locale;
  t: Dict;
  shades: string[];
  name: string;
  priceLine: React.ReactNode;
  desc: string | null;
}) {
  const { add } = useCart();
  const router = useRouter();
  const [qty, setQty] = useState(1);
  const [added, setAdded] = useState(false);
  const [shade, setShade] = useState<string | null>(null);
  const [manualImage, setManualImage] = useState<string | null>(null);

  const shadeImages: Record<string, string> = useMemo(
    () => product.shade_images ?? {},
    [product.shade_images]
  );

  const shadeImage = shade ? shadeImages[shade] ?? null : null;
  const mainImage = manualImage ?? shadeImage ?? product.images[0] ?? null;
  const needsShade = shades.length > 0 && !shade;
  const inStock = product.stock > 0;

  return (
    <div className="grid gap-8 md:grid-cols-2">
      {/* Gallery */}
      <div>
        <div className="card aspect-square overflow-hidden">
          {mainImage ? (
            // eslint-disable-next-line @next/next/no-img-element
            <img src={mainImage} alt={name} className="h-full w-full object-cover" />
          ) : (
            <div className="flex h-full items-center justify-center bg-brand-50 text-5xl text-brand-200">
              ✦
            </div>
          )}
        </div>
        {product.images.length > 1 && (
          <div className="mt-3 grid grid-cols-4 gap-3">
            {product.images.slice(0, 4).map((img, i) => (
              <button
                key={i}
                type="button"
                onClick={() => setManualImage(img)}
                className={`card aspect-square overflow-hidden ${
                  mainImage === img ? "ring-2 ring-brand-500" : ""
                }`}
              >
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img src={img} alt={`${name} ${i + 1}`} className="h-full w-full object-cover" loading="lazy" />
              </button>
            ))}
          </div>
        )}
      </div>

      {/* Info */}
      <div>
        <h1 className="text-3xl font-bold">{name}</h1>
        {priceLine}
        {desc && <p className="mt-4 whitespace-pre-line leading-relaxed text-gray-600">{desc}</p>}

        <div className="mt-6 space-y-4">
          {shades.length > 0 && (
            <div>
              <p className="mb-2 font-semibold">
                {t.shade}:{" "}
                {shade ? (
                  <span className="text-brand-700">{shade}</span>
                ) : (
                  <span className="text-sm font-normal text-gray-400">{t.chooseShade}</span>
                )}
              </p>
              <div className="flex flex-wrap gap-2">
                {shades.map((s) => {
                  const img = shadeImages[s];
                  const selected = shade === s;
                  return img ? (
                    <button
                      key={s}
                      type="button"
                      onClick={() => {
                        setShade(s);
                        setManualImage(null);
                      }}
                      title={s}
                      className={`relative h-16 w-16 overflow-hidden rounded-xl border-2 transition ${
                        selected ? "border-brand-500 ring-2 ring-brand-200" : "border-gray-200 hover:border-brand-300"
                      }`}
                    >
                      {/* eslint-disable-next-line @next/next/no-img-element */}
                      <img src={img} alt={s} className="h-full w-full object-cover" loading="lazy" />
                      <span
                        className={`absolute bottom-0 start-0 end-0 truncate px-1 text-center text-[10px] font-bold ${
                          selected ? "bg-brand-500 text-white" : "bg-white/80 text-gray-700"
                        }`}
                      >
                        {s}
                      </span>
                    </button>
                  ) : (
                    <button
                      key={s}
                      type="button"
                      onClick={() => {
                        setShade(s);
                        setManualImage(null);
                      }}
                      className={`min-w-10 rounded-full border px-3 py-1.5 text-sm font-semibold transition ${
                        selected
                          ? "border-brand-500 bg-brand-500 text-white"
                          : "border-gray-300 bg-white text-gray-700 hover:border-brand-400"
                      }`}
                    >
                      {s}
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {!inStock ? (
            <p className="rounded-xl bg-gray-100 px-4 py-3 font-semibold text-gray-500">{t.outOfStock}</p>
          ) : (
            <div className="flex flex-wrap items-center gap-3">
              <div className="flex items-center rounded-full border border-gray-300">
                <button className="px-4 py-2 text-lg font-bold" onClick={() => setQty((q) => Math.max(1, q - 1))}>
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
                    image: shadeImage ?? product.images[0] ?? null,
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
          )}
        </div>
      </div>
    </div>
  );
}
