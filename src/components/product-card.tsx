import Link from "next/link";
import type { Dict, Locale } from "@/lib/i18n";
import type { Product } from "@/lib/types";

export function formatPrice(n: number, t: Dict) {
  return `${Number(n).toFixed(2)} ${t.jod}`;
}

export default function ProductCard({
  product,
  locale,
  t,
}: {
  product: Product;
  locale: Locale;
  t: Dict;
}) {
  const name = locale === "ar" ? product.name_ar : product.name_en;
  const onSale =
    product.compare_at_price != null && Number(product.compare_at_price) > Number(product.price);
  return (
    <Link href={`/${locale}/products/${product.slug}`} className="card group overflow-hidden">
      <div className="relative aspect-square overflow-hidden bg-white">
        {product.images[0] ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={product.images[0]}
            alt={name}
            className="h-full w-full object-cover transition duration-300 group-hover:scale-105"
            loading="lazy"
          />
        ) : (
          <div className="flex h-full items-center justify-center text-4xl text-brand-200">✦</div>
        )}
        {onSale && (
          <span className="absolute top-2 start-2 rounded-full bg-brand-600 px-2.5 py-1 text-xs font-bold text-white">
            {t.sale}
          </span>
        )}
        {product.stock <= 0 && (
          <span className="absolute top-2 end-2 rounded-full bg-gray-800/80 px-2.5 py-1 text-xs font-bold text-white">
            {t.outOfStock}
          </span>
        )}
      </div>
      <div className="p-3">
        <p className="line-clamp-2 text-sm font-semibold">{name}</p>
        <div className="mt-1 flex items-center gap-2">
          <span className="font-bold text-brand-700">{formatPrice(product.price, t)}</span>
          {onSale && (
            <span className="text-xs text-gray-400 line-through">
              {formatPrice(product.compare_at_price!, t)}
            </span>
          )}
        </div>
      </div>
    </Link>
  );
}
