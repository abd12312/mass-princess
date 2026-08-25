import Link from "next/link";
import { getDict, isLocale, defaultLocale, type Locale } from "@/lib/i18n";
import { createClient } from "@/lib/supabase/server";

export default async function OrderSuccessPage({
  params,
}: {
  params: { locale: string; id: string };
}) {
  const locale: Locale = isLocale(params.locale) ? params.locale : defaultLocale;
  const t = getDict(locale);
  // Anonymous users can't read orders back (RLS) — that's fine, we just show the confirmation.
  createClient();

  return (
    <div className="mx-auto max-w-2xl px-4 py-20 text-center">
      <div className="mx-auto flex h-20 w-20 items-center justify-center rounded-full bg-green-100 text-4xl">
        ✓
      </div>
      <h1 className="mt-6 text-3xl font-bold">{t.orderSuccess}</h1>
      <p className="mt-2 text-gray-600">{t.orderSuccessDesc}</p>
      <Link href={`/${locale}/products`} className="btn-primary mt-8">
        {t.continueShopping}
      </Link>
    </div>
  );
}
