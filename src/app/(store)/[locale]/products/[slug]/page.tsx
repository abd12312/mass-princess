import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { getDict, isLocale, defaultLocale, type Locale } from "@/lib/i18n";
import type { Product } from "@/lib/types";
import ProductCard, { formatPrice } from "@/components/product-card";
import ProductView from "@/components/product-view";
import { parseShades, stripShadesLine } from "@/lib/shades";

export const revalidate = 60;

export default async function ProductPage({
  params,
}: {
  params: { locale: string; slug: string };
}) {
  const locale: Locale = isLocale(params.locale) ? params.locale : defaultLocale;
  const t = getDict(locale);
  const supabase = createClient();

  const { data: product } = await supabase
    .from("products")
    .select("*")
    .eq("slug", params.slug)
    .eq("is_active", true)
    .single<Product>();
  if (!product) notFound();

  const { data: related } = await supabase
    .from("products")
    .select("*")
    .eq("is_active", true)
    .eq("category_id", product.category_id ?? "")
    .neq("id", product.id)
    .limit(4);

  const name = locale === "ar" ? product.name_ar : product.name_en;
  const rawDesc = locale === "ar" ? product.description_ar : product.description_en;
  const primaryShades = parseShades(rawDesc);
  const shades = primaryShades.length > 0
    ? primaryShades
    : parseShades(locale === "ar" ? product.description_en : product.description_ar);
  const desc = stripShadesLine(rawDesc);
  const onSale =
    product.compare_at_price != null && Number(product.compare_at_price) > Number(product.price);

  const priceLine = (
    <div className="mt-3 flex items-center gap-3">
      <span className="text-2xl font-extrabold text-brand-700">
        {formatPrice(product.price, t)}
      </span>
      {onSale && (
        <span className="text-lg text-gray-400 line-through">
          {formatPrice(product.compare_at_price!, t)}
        </span>
      )}
    </div>
  );

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      <ProductView
        product={product}
        locale={locale}
        t={t}
        shades={shades}
        name={name}
        priceLine={priceLine}
        desc={desc}
      />

      {(related ?? []).length > 0 && (
        <section className="mt-14">
          <h2 className="mb-5 text-2xl font-bold">{t.relatedProducts}</h2>
          <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
            {(related as Product[]).map((p) => (
              <ProductCard key={p.id} product={p} locale={locale} t={t} />
            ))}
          </div>
        </section>
      )}
    </div>
  );
}
