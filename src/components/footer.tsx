import Link from "next/link";
import type { Dict, Locale } from "@/lib/i18n";
import type { StoreSettings } from "@/lib/types";

export default function Footer({
  locale,
  t,
  settings,
}: {
  locale: Locale;
  t: Dict;
  settings: StoreSettings;
}) {
  return (
    <footer className="mt-16 border-t border-brand-100 bg-brand-50/50">
      <div className="mx-auto grid max-w-6xl gap-8 px-4 py-10 sm:grid-cols-3">
        <div>
          <p className="text-lg font-extrabold text-brand-700">{t.storeName}</p>
          <p className="mt-1 text-sm text-gray-600">{t.tagline}</p>
        </div>
        <div className="text-sm">
          <p className="mb-2 font-semibold">{t.products}</p>
          <Link href={`/${locale}/products`} className="block py-1 text-gray-600 hover:text-brand-600">
            {t.allProducts}
          </Link>
          <Link href={`/${locale}/cart`} className="block py-1 text-gray-600 hover:text-brand-600">
            {t.cart}
          </Link>
        </div>
        <div className="text-sm">
          <p className="mb-2 font-semibold">{t.followUs}</p>
          <div className="flex gap-3">
            {settings.instagram && (
              <a href={settings.instagram} target="_blank" rel="noreferrer" className="text-gray-600 hover:text-brand-600">
                Instagram
              </a>
            )}
            {settings.facebook && (
              <a href={settings.facebook} target="_blank" rel="noreferrer" className="text-gray-600 hover:text-brand-600">
                Facebook
              </a>
            )}
            {settings.whatsapp_number && (
              <a
                href={`https://wa.me/${settings.whatsapp_number.replace(/[^0-9]/g, "")}`}
                target="_blank"
                rel="noreferrer"
                className="text-gray-600 hover:text-brand-600"
              >
                WhatsApp
              </a>
            )}
          </div>
        </div>
      </div>
      <div className="border-t border-brand-100 py-4 text-center text-xs text-gray-500">
        © {new Date().getFullYear()} {t.storeName} — {t.allRights}
      </div>
    </footer>
  );
}
