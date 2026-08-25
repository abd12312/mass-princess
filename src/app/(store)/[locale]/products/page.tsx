import { createClient } from "@/lib/supabase/server";
import { getDict, isLocale, defaultLocale, type Locale } from "@/lib/i18n";
import type { Product } from "@/lib/types";
import ProductCard from "@/components/product-card";

export const revalidate = 60;

export default async function ProductsPage({
  params,
  searchParams,
}: {
  params: { locale: string };
  searchParams: { q?: string };
}) {
  const locale: Locale = isLocale(params.locale) ? params.locale : defaultLocale;
  const t = getDict(locale);
  const supabase = createClient();

  let query = supabase
    .from("products")
    .select("*")
    .eq("is_active", true)
    .order("created_at", { ascending: false });

  const q = searchParams.q?.trim();
  if (q) query = query.or(`name_ar.ilike.%${q}%,name_en.ilike.%${q}%`);

  const { data: products } = await query;

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      <h1 className="mb-6 text-3xl font-bold">{t.allProducts}</h1>
      <form className="mb-6 max-w-md">
        <input name="q" defaultValue={q ?? ""} placeholder={t.search} className="input" />
      </form>
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
