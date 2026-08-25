import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { getDict, isLocale, defaultLocale, type Locale } from "@/lib/i18n";
import type { Product } from "@/lib/types";
import ProductCard from "@/components/product-card";

export const revalidate = 60;

export default async function CategoryPage({
  params,
}: {
  params: { locale: string; slug: string };
}) {
  const locale: Locale = isLocale(params.locale) ? params.locale : defaultLocale;
  const t = getDict(locale);
  const supabase = createClient();

  const { data: category } = await supabase
    .from("categories")
    .select("*")
    .eq("slug", params.slug)
    .single();
  if (!category) notFound();

  const { data: products } = await supabase
    .from("products")
    .select("*")
    .eq("is_active", true)
    .eq("category_id", category.id)
    .order("created_at", { ascending: false });

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      <h1 className="mb-6 text-3xl font-bold">
        {locale === "ar" ? category.name_ar : category.name_en}
      </h1>
      {(products ?? []).length === 0 ? (
        <p className="py-16 text-center text-gray-500">{t.noProducts}</p>
      ) : (
        <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
          {(products as Product[]).map((p) => (
            <ProductCard key={p.id} product={p} locale={locale} t={t} />
          ))}
        </div>
      )}
    </div>
  );
}
