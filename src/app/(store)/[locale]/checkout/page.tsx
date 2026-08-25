import { getDict, isLocale, defaultLocale, type Locale } from "@/lib/i18n";
import { createClient } from "@/lib/supabase/server";
import { DEFAULT_SETTINGS, type StoreSettings } from "@/lib/types";
import CheckoutForm from "@/components/checkout-form";

export default async function CheckoutPage({ params }: { params: { locale: string } }) {
  const locale: Locale = isLocale(params.locale) ? params.locale : defaultLocale;
  const t = getDict(locale);
  const supabase = createClient();
  const { data } = await supabase.from("settings").select("value").eq("key", "store").single();
  const settings: StoreSettings = { ...DEFAULT_SETTINGS, ...(data?.value ?? {}) };
  return <CheckoutForm locale={locale} t={t} settings={settings} />;
}
