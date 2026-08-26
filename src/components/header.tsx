"use client";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { useState } from "react";
import type { Dict, Locale } from "@/lib/i18n";
import type { Category } from "@/lib/types";
import { useCart } from "./cart-context";

export default function Header({
  locale,
  t,
  categories,
}: {
  locale: Locale;
  t: Dict;
  categories: Category[];
}) {
  const { count } = useCart();
  const pathname = usePathname();
  const [open, setOpen] = useState(false);
  const otherLocale = locale === "ar" ? "en" : "ar";
  const switched = pathname.replace(`/${locale}`, `/${otherLocale}`);

  return (
    <header className="sticky top-0 z-40 border-b border-brand-100 bg-white/90 backdrop-blur">
      <div className="mx-auto flex max-w-6xl items-center justify-between gap-4 px-4 py-3">
        <div className="flex items-center gap-3">
          <button
            className="rounded-lg p-2 hover:bg-brand-50 md:hidden"
            onClick={() => setOpen(!open)}
            aria-label="menu"
          >
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M4 6h16M4 12h16M4 18h16" strokeLinecap="round" />
            </svg>
          </button>
          <Link href={`/${locale}`} className="flex items-center gap-2">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/logo.svg" alt={t.storeName} className="h-9 w-auto" />
          </Link>
        </div>

        <nav className="hidden items-center gap-6 md:flex">
          <Link href={`/${locale}`} className="text-sm font-medium hover:text-brand-600">
            {t.home}
          </Link>
          <Link href={`/${locale}/products`} className="text-sm font-medium hover:text-brand-600">
            {t.products}
          </Link>
          {categories.slice(0, 4).map((c) => (
            <Link
              key={c.id}
              href={`/${locale}/category/${c.slug}`}
              className="text-sm font-medium hover:text-brand-600"
            >
              {locale === "ar" ? c.name_ar : c.name_en}
            </Link>
          ))}
        </nav>

        <div className="flex items-center gap-2">
          <Link
            href={switched}
            className="rounded-full border border-gray-200 px-3 py-1.5 text-xs font-semibold hover:border-brand-400"
          >
            {otherLocale === "ar" ? "عربي" : "EN"}
          </Link>
          <Link
            href={`/${locale}/cart`}
            className="relative rounded-full p-2 hover:bg-brand-50"
            aria-label={t.cart}
          >
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M6 6h15l-1.5 9h-12L5 3H2" strokeLinecap="round" strokeLinejoin="round" />
              <circle cx="9" cy="20" r="1.5" />
              <circle cx="18" cy="20" r="1.5" />
            </svg>
            {count > 0 && (
              <span className="absolute -top-0.5 -end-0.5 flex h-5 w-5 items-center justify-center rounded-full bg-brand-600 text-[10px] font-bold text-white">
                {count}
              </span>
            )}
          </Link>
        </div>
      </div>

      {open && (
        <nav className="border-t border-gray-100 bg-white px-4 py-3 md:hidden">
          <Link href={`/${locale}`} className="block py-2 font-medium" onClick={() => setOpen(false)}>
            {t.home}
          </Link>
          <Link href={`/${locale}/products`} className="block py-2 font-medium" onClick={() => setOpen(false)}>
            {t.products}
          </Link>
          {categories.map((c) => (
            <Link
              key={c.id}
              href={`/${locale}/category/${c.slug}`}
              className="block py-2 font-medium"
              onClick={() => setOpen(false)}
            >
              {locale === "ar" ? c.name_ar : c.name_en}
            </Link>
          ))}
        </nav>
      )}
    </header>
  );
}
