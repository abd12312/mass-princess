"use client";
import Link from "next/link";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Product } from "@/lib/types";

export default function AdminProducts() {
  const supabase = createClient();
  const [products, setProducts] = useState<Product[]>([]);
  const [q, setQ] = useState("");
  const [loading, setLoading] = useState(true);

  async function load() {
    setLoading(true);
    const { data } = await supabase
      .from("products")
      .select("*, categories(name_ar)")
      .order("created_at", { ascending: false });
    setProducts((data ?? []) as Product[]);
    setLoading(false);
  }
  useEffect(() => {
    load();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function toggleActive(p: Product) {
    await supabase.from("products").update({ is_active: !p.is_active }).eq("id", p.id);
    load();
  }
  async function del(p: Product) {
    if (!confirm(`حذف "${p.name_ar}"؟`)) return;
    await supabase.from("products").delete().eq("id", p.id);
    load();
  }

  const filtered = products.filter(
    (p) => p.name_ar.includes(q) || p.name_en.toLowerCase().includes(q.toLowerCase())
  );

  return (
    <div>
      <div className="mb-5 flex flex-wrap items-center justify-between gap-3">
        <h1 className="text-2xl font-bold">المنتجات ({products.length})</h1>
        <Link href="/admin/products/new" className="btn-primary !py-2">
          + منتج جديد
        </Link>
      </div>
      <input
        className="input mb-4 max-w-sm"
        placeholder="بحث..."
        value={q}
        onChange={(e) => setQ(e.target.value)}
      />
      <div className="card overflow-x-auto">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b bg-gray-50">
              <th className="p-3 text-start">المنتج</th>
              <th className="p-3 text-start">السعر</th>
              <th className="p-3 text-start">المخزون</th>
              <th className="p-3 text-start">الحالة</th>
              <th className="p-3 text-start"></th>
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr><td colSpan={5} className="p-6 text-center text-gray-400">جاري التحميل...</td></tr>
            ) : (
              filtered.map((p) => (
                <tr key={p.id} className="border-b last:border-0 hover:bg-brand-50/40">
                  <td className="p-3">
                    <div className="flex items-center gap-3">
                      <div className="h-11 w-11 shrink-0 overflow-hidden rounded-lg bg-brand-50">
                        {p.images[0] && (
                          // eslint-disable-next-line @next/next/no-img-element
                          <img src={p.images[0]} alt="" className="h-full w-full object-cover" />
                        )}
                      </div>
                      <div>
                        <Link href={`/admin/products/${p.id}`} className="font-semibold text-brand-700 hover:underline">
                          {p.name_ar}
                        </Link>
                        <p className="text-xs text-gray-400">{p.name_en}</p>
                      </div>
                    </div>
                  </td>
                  <td className="p-3">{Number(p.price).toFixed(2)} د.أ</td>
                  <td className="p-3">
                    <span className={p.stock <= 0 ? "font-bold text-red-500" : ""}>{p.stock}</span>
                  </td>
                  <td className="p-3">
                    <button
                      onClick={() => toggleActive(p)}
                      className={`rounded-full px-2.5 py-1 text-xs font-semibold ${
                        p.is_active ? "bg-green-100 text-green-700" : "bg-gray-200 text-gray-600"
                      }`}
                    >
                      {p.is_active ? "منشور" : "مخفي"}
                    </button>
                  </td>
                  <td className="p-3">
                    <button onClick={() => del(p)} className="text-xs text-red-500 hover:underline">
                      حذف
                    </button>
                  </td>
                </tr>
              ))
            )}
            {!loading && filtered.length === 0 && (
              <tr><td colSpan={5} className="p-6 text-center text-gray-400">لا توجد منتجات</td></tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
