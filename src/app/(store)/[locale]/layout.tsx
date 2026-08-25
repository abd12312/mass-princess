import type { Metadata } from "next";
import "../../globals.css";
import { isLocale, defaultLocale, getDict, type Locale } from "@/lib/i18n";
import { CartProvider } from "@/components/cart-context";
import Header from "@/components/header";
import Footer from "@/components/footer";
import { createClient } from "@/lib/supabase/server";
import { DEFAULT_SETTINGS, type Category, type StoreSettings } from "@/lib/types";

export const metadata: Metadata = {
  title: "Mass Princess | ماس برنسيس",
  description: "Mass Princess online store — متجر ماس برنسيس",
};

export default async function StoreLayout({
  children,
  params,
}: {
  children: React.ReactNode;
  params: { locale: string };
}) {
  const locale: Locale = isLocale(params.locale) ? params.locale : defaultLocale;
  const t = getDict(locale);
  const supabase = createClient();
  const [{ data: cats }, { data: settingsRow }] = await Promise.all([
    supabase.from("categories").select("*").order("sort"),
    supabase.from("settings").select("value").eq("key", "store").single(),
  ]);
  const settings: StoreSettings = { ...DEFAULT_SETTINGS, ...(settingsRow?.value ?? {}) };

  return (
    <html lang={locale} dir={locale === "ar" ? "rtl" : "ltr"}>
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="" />
        <link
          href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700;800&display=swap"
          rel="stylesheet"
        />
      </head>
      <body className="font-sans">
        <CartProvider>
          <Header locale={locale} t={t} categories={(cats ?? []) as Category[]} />
          <main className="min-h-[60vh]">{children}</main>
          <Footer locale={locale} t={t} settings={settings} />
        </CartProvider>
      </body>
    </html>
  );
}
