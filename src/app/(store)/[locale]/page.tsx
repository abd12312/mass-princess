import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { getDict, isLocale, defaultLocale, type Locale } from "@/lib/i18n";
import type { Category, Product } from "@/lib/types";
import ProductCard from "@/components/product-card";

export const revalidate = 60;

export default async function HomePage({ params }: { params: { locale: string } }) {
  const locale: Locale = isLocale(params.locale) ? params.locale : defaultLocale;
  const t = getDict(locale);
  const supabase = createClient();

  const [{ data: featured }, { data: latest }, { data: cats }] = await Promise.all([
    supabase.from("products").select("*").eq("is_active", true).eq("is_featured", true).limit(8),
    supabase
      .from("products")
      .select("*")
      .eq("is_active", true)
      .order("created_at", { ascending: false })
      .limit(8),
    supabase.from("categories").select("*").order("sort"),
  ]);

  return (
    <div>
      {/* Hero */}
      <section className="bg-gradient-to-b from-brand-50 to-white">
        <div className="mx-auto flex max-w-6xl flex-col items-center px-4 py-16 text-center">
          <span className="mb-3 text-3xl text-gold">✦</span>
          <h1 className="text-4xl font-extrabold text-brand-800 sm:text-5xl">{t.storeName}</h1>
          <p className="mt-3 max-w-md text-lg text-gray-600">{t.tagline}</p>
          <Link href={`/${locale}/products`} className="btn-primary mt-6">
            {t.shopNow}
          </Link>
        </div>
      </section>

      {/* Categories */}
      {(cats ?? []).length > 0 && (
        <section className="mx-auto max-w-6xl px-4 py-10">
          <h2 className="mb-5 text-2xl font-bold">{t.categories}</h2>
          <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 md:grid-cols-4">
            {(cats as Category[]).map((c) => (
              <Link
                key={c.id}
                href={`/${locale}/category/${c.slug}`}
                className="card group overflow-hidden"
              >
                <div className="aspect-[4/3] overflow-hidden bg-brand-50">
                  {c.image ? (
                    // eslint-disable-next-line @next/next/no-img-element
                    <img
                      src={c.image}
                      alt={locale === "ar" ? c.name_ar : c.name_en}
                      className="h-full w-full object-cover transition group-hover:scale-105"
                      loading="lazy"
                    />
                  ) : (
                    <div className="flex h-full items-center justify-center text-3xl text-brand-200">✦</div>
                  )}
                </div>
                <p className="p-3 text-center font-semibold">
                  {locale === "ar" ? c.name_ar : c.name_en}
                </p>
              </Link>
            ))}
          </div>
        </section>
      )}

      {/* Featured */}
      {(featured ?? []).length > 0 && (
        <section className="mx-auto max-w-6xl px-4 py-10">
          <div className="mb-5 flex items-center justify-between">
            <h2 className="text-2xl font-bold">{t.featured}</h2>
            <Link href={`/${locale}/products`} className="text-sm font-semibold text-brand-600">
              {t.viewAll} ←
            </Link>
          </div>
          <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
            {(featured as Product[]).map((p) => (
              <ProductCard key={p.id} product={p} locale={locale} t={t} />
            ))}
          </div>
        </section>
      )}

      {/* New arrivals */}
      <section className="mx-auto max-w-6xl px-4 py-10">
        <div className="mb-5 flex items-center justify-between">
          <h2 className="text-2xl font-bold">{t.newArrivals}</h2>
          <Link href={`/${locale}/products`} className="text-sm font-semibold text-brand-600">
            {t.viewAll} ←
          </Link>
        </div>
        {(latest ?? []).length === 0 ? (
          <p className="py-10 text-center text-gray-500">{t.noProducts}</p>
        ) : (
          <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
            {(latest as Product[]).map((p) => (
              <ProductCard key={p.id} product={p} locale={locale} t={t} />
            ))}
          </div>
        )}
      </section>
    </div>
  );
}
