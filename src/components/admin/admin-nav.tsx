"use client";
import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

const links = [
  { href: "/admin", label: "الرئيسية" },
  { href: "/admin/products", label: "المنتجات" },
  { href: "/admin/categories", label: "التصنيفات" },
  { href: "/admin/orders", label: "الطلبات" },
  { href: "/admin/settings", label: "الإعدادات" },
];

export default function AdminNav() {
  const pathname = usePathname();
  const router = useRouter();
  if (pathname === "/admin/login") return null;

  async function logout() {
    await createClient().auth.signOut();
    router.push("/admin/login");
    router.refresh();
  }

  return (
    <header className="sticky top-0 z-40 border-b bg-white">
      <div className="mx-auto flex max-w-6xl items-center justify-between gap-4 overflow-x-auto px-4 py-3">
        <div className="flex items-center gap-1">
          <span className="me-3 whitespace-nowrap font-extrabold text-brand-700">ماس برنسيس ✦</span>
          {links.map((l) => {
            const active = l.href === "/admin" ? pathname === "/admin" : pathname.startsWith(l.href);
            return (
              <Link
                key={l.href}
                href={l.href}
                className={`whitespace-nowrap rounded-full px-3 py-1.5 text-sm font-medium ${
                  active ? "bg-brand-600 text-white" : "text-gray-600 hover:bg-brand-50"
                }`}
              >
                {l.label}
              </Link>
            );
          })}
        </div>
        <div className="flex items-center gap-2">
          <Link href="/ar" target="_blank" className="whitespace-nowrap text-sm text-gray-500 hover:text-brand-600">
            عرض المتجر ↗
          </Link>
          <button onClick={logout} className="whitespace-nowrap text-sm text-red-500 hover:underline">
            خروج
          </button>
        </div>
      </div>
    </header>
  );
}
