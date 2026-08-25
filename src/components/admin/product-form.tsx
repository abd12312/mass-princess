"use client";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { Category, Product } from "@/lib/types";

function slugify(s: string) {
  return (
    s
      .toLowerCase()
      .trim()
      .replace(/[^a-z0-9؀-ۿ]+/g, "-")
      .replace(/^-+|-+$/g, "") || `p-${Math.random().toString(36).slice(2, 8)}`
  );
}

export default function ProductForm({ productId }: { productId?: string }) {
  const supabase = createClient();
  const router = useRouter();
  const [cats, setCats] = useState<Category[]>([]);
  const [form, setForm] = useState({
    name_ar: "",
    name_en: "",
    slug: "",
    description_ar: "",
    description_en: "",
    price: "",
    compare_at_price: "",
    category_id: "",
    stock: "0",
    is_featured: false,
    is_active: true,
  });
  const [images, setImages] = useState<string[]>([]);
  const [uploading, setUploading] = useState(false);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    supabase.from("categories").select("*").order("sort").then(({ data }) => setCats((data ?? []) as Category[]));
    if (productId) {
      supabase.from("products").select("*").eq("id", productId).single().then(({ data }) => {
        if (!data) return;
        const p = data as Product;
        setForm({
          name_ar: p.name_ar,
          name_en: p.name_en,
          slug: p.slug,
          description_ar: p.description_ar ?? "",
          description_en: p.description_en ?? "",
          price: String(p.price),
          compare_at_price: p.compare_at_price != null ? String(p.compare_at_price) : "",
          category_id: p.category_id ?? "",
          stock: String(p.stock),
          is_featured: p.is_featured,
          is_active: p.is_active,
        });
        setImages(p.images);
      });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [productId]);

  async function uploadFiles(files: FileList) {
    setUploading(true);
    setError("");
    const urls: string[] = [];
    for (const file of Array.from(files)) {
      const ext = file.name.split(".").pop();
      const path = `${Date.now()}-${Math.random().toString(36).slice(2, 8)}.${ext}`;
      const { error } = await supabase.storage.from("products").upload(path, file);
      if (error) {
        setError(`فشل رفع الصورة: ${error.message}`);
        continue;
      }
      const { data } = supabase.storage.from("products").getPublicUrl(path);
      urls.push(data.publicUrl);
    }
    setImages((prev) => [...prev, ...urls]);
    setUploading(false);
  }

  async function save(e: React.FormEvent) {
    e.preventDefault();
    setSaving(true);
    setError("");
    const payload = {
      name_ar: form.name_ar.trim(),
      name_en: form.name_en.trim() || form.name_ar.trim(),
      slug: form.slug.trim() || slugify(form.name_en || form.name_ar),
      description_ar: form.description_ar.trim() || null,
      description_en: form.description_en.trim() || null,
      price: Number(form.price) || 0,
      compare_at_price: form.compare_at_price ? Number(form.compare_at_price) : null,
      category_id: form.category_id || null,
      stock: parseInt(form.stock) || 0,
      is_featured: form.is_featured,
      is_active: form.is_active,
      images,
    };
    const res = productId
      ? await supabase.from("products").update(payload).eq("id", productId)
      : await supabase.from("products").insert(payload);
    if (res.error) {
      setError(res.error.message.includes("duplicate") ? "الرابط (slug) مستخدم مسبقًا" : res.error.message);
      setSaving(false);
      return;
    }
    router.push("/admin/products");
  }

  const set = (k: keyof typeof form) => (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) =>
    setForm((f) => ({ ...f, [k]: e.target.value }));

  return (
    <form onSubmit={save} className="max-w-3xl space-y-5">
      <div className="grid gap-4 sm:grid-cols-2">
        <div>
          <label className="label">الاسم بالعربي *</label>
          <input className="input" required value={form.name_ar} onChange={set("name_ar")} />
        </div>
        <div>
          <label className="label">الاسم بالإنجليزي</label>
          <input className="input" dir="ltr" value={form.name_en} onChange={set("name_en")} />
        </div>
      </div>
      <div>
        <label className="label">الرابط (slug) — اتركيه فارغ لتوليده تلقائيًا</label>
        <input className="input" dir="ltr" value={form.slug} onChange={set("slug")} />
      </div>
      <div className="grid gap-4 sm:grid-cols-2">
        <div>
          <label className="label">الوصف بالعربي</label>
          <textarea className="input" rows={4} value={form.description_ar} onChange={set("description_ar")} />
        </div>
        <div>
          <label className="label">الوصف بالإنجليزي</label>
          <textarea className="input" dir="ltr" rows={4} value={form.description_en} onChange={set("description_en")} />
        </div>
      </div>
      <div className="grid gap-4 sm:grid-cols-4">
        <div>
          <label className="label">السعر (د.أ) *</label>
          <input className="input" dir="ltr" type="number" step="0.01" min="0" required value={form.price} onChange={set("price")} />
        </div>
        <div>
          <label className="label">السعر قبل الخصم</label>
          <input className="input" dir="ltr" type="number" step="0.01" min="0" value={form.compare_at_price} onChange={set("compare_at_price")} />
        </div>
        <div>
          <label className="label">المخزون</label>
          <input className="input" dir="ltr" type="number" min="0" value={form.stock} onChange={set("stock")} />
        </div>
        <div>
          <label className="label">التصنيف</label>
          <select className="input" value={form.category_id} onChange={set("category_id")}>
            <option value="">— بدون —</option>
            {cats.map((c) => (
              <option key={c.id} value={c.id}>{c.name_ar}</option>
            ))}
          </select>
        </div>
      </div>

      <div>
        <label className="label">الصور</label>
        <div className="flex flex-wrap gap-3">
          {images.map((img, i) => (
            <div key={i} className="relative h-24 w-24 overflow-hidden rounded-xl border">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src={img} alt="" className="h-full w-full object-cover" />
              <button
                type="button"
                onClick={() => setImages(images.filter((_, j) => j !== i))}
                className="absolute top-1 end-1 flex h-5 w-5 items-center justify-center rounded-full bg-red-500 text-xs text-white"
              >
                ×
              </button>
            </div>
          ))}
          <label className="flex h-24 w-24 cursor-pointer items-center justify-center rounded-xl border-2 border-dashed border-gray-300 text-2xl text-gray-400 hover:border-brand-400">
            {uploading ? "..." : "+"}
            <input
              type="file"
              accept="image/*"
              multiple
              className="hidden"
              onChange={(e) => e.target.files && uploadFiles(e.target.files)}
            />
          </label>
        </div>
        <p className="mt-1 text-xs text-gray-400">الصورة الأولى هي الرئيسية</p>
      </div>

      <div className="flex gap-6">
        <label className="flex items-center gap-2 text-sm">
          <input type="checkbox" checked={form.is_featured} onChange={(e) => setForm((f) => ({ ...f, is_featured: e.target.checked }))} />
          منتج مميز (يظهر بالرئيسية)
        </label>
        <label className="flex items-center gap-2 text-sm">
          <input type="checkbox" checked={form.is_active} onChange={(e) => setForm((f) => ({ ...f, is_active: e.target.checked }))} />
          منشور
        </label>
      </div>

      {error && <p className="text-sm text-red-500">{error}</p>}
      <div className="flex gap-3">
        <button className="btn-primary" disabled={saving || uploading}>
          {saving ? "..." : "حفظ"}
        </button>
        <button type="button" className="btn-outline" onClick={() => router.push("/admin/products")}>
          إلغاء
        </button>
      </div>
    </form>
  );
}
