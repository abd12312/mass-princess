"use client";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Category } from "@/lib/types";

function slugify(s: string) {
  return (
    s.toLowerCase().trim().replace(/[^a-z0-9؀-ۿ]+/g, "-").replace(/^-+|-+$/g, "") ||
    `c-${Math.random().toString(36).slice(2, 8)}`
  );
}

export default function AdminCategories() {
  const supabase = createClient();
  const [cats, setCats] = useState<Category[]>([]);
  const [nameAr, setNameAr] = useState("");
  const [nameEn, setNameEn] = useState("");
  const [error, setError] = useState("");

  async function load() {
    const { data } = await supabase.from("categories").select("*").order("sort");
    setCats((data ?? []) as Category[]);
  }
  useEffect(() => {
    load();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function add(e: React.FormEvent) {
    e.preventDefault();
    setError("");
    const { error } = await supabase.from("categories").insert({
      name_ar: nameAr.trim(),
      name_en: nameEn.trim() || nameAr.trim(),
      slug: slugify(nameEn || nameAr),
      sort: cats.length,
    });
    if (error) {
      setError(error.message);
      return;
    }
    setNameAr("");
    setNameEn("");
    load();
  }

  async function del(c: Category) {
    if (!confirm(`حذف تصنيف "${c.name_ar}"؟ المنتجات المرتبطة به لن تُحذف.`)) return;
    await supabase.from("categories").delete().eq("id", c.id);
    load();
  }

  async function rename(c: Category) {
    const name = prompt("الاسم الجديد بالعربي:", c.name_ar);
    if (!name) return;
    await supabase.from("categories").update({ name_ar: name }).eq("id", c.id);
    load();
  }

  return (
    <div className="max-w-2xl">
      <h1 className="mb-6 text-2xl font-bold">التصنيفات</h1>
      <form onSubmit={add} className="card mb-6 flex flex-wrap items-end gap-3 p-4">
        <div className="flex-1">
          <label className="label">الاسم بالعربي</label>
          <input className="input" required value={nameAr} onChange={(e) => setNameAr(e.target.value)} />
        </div>
        <div className="flex-1">
          <label className="label">الاسم بالإنجليزي</label>
          <input className="input" dir="ltr" value={nameEn} onChange={(e) => setNameEn(e.target.value)} />
        </div>
        <button className="btn-primary !py-2.5">إضافة</button>
      </form>
      {error && <p className="mb-4 text-sm text-red-500">{error}</p>}
      <div className="card divide-y">
        {cats.map((c) => (
          <div key={c.id} className="flex items-center justify-between p-3">
            <div>
              <p className="font-semibold">{c.name_ar}</p>
              <p className="text-xs text-gray-400">{c.name_en} — /{c.slug}</p>
            </div>
            <div className="flex gap-3 text-sm">
              <button onClick={() => rename(c)} className="text-brand-600 hover:underline">تعديل</button>
              <button onClick={() => del(c)} className="text-red-500 hover:underline">حذف</button>
            </div>
          </div>
        ))}
        {cats.length === 0 && <p className="p-6 text-center text-gray-400">لا توجد تصنيفات</p>}
      </div>
    </div>
  );
}
