"use client";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { DEFAULT_SETTINGS, type StoreSettings } from "@/lib/types";

export default function AdminSettings() {
  const supabase = createClient();
  const [s, setS] = useState<StoreSettings>(DEFAULT_SETTINGS);
  const [saved, setSaved] = useState(false);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    supabase
      .from("settings")
      .select("value")
      .eq("key", "store")
      .single()
      .then(({ data }) => data && setS({ ...DEFAULT_SETTINGS, ...data.value }));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function save(e: React.FormEvent) {
    e.preventDefault();
    setSaving(true);
    setSaved(false);
    await supabase.from("settings").update({ value: s }).eq("key", "store");
    setSaving(false);
    setSaved(true);
  }

  return (
    <div className="max-w-lg">
      <h1 className="mb-6 text-2xl font-bold">إعدادات المتجر</h1>
      <form onSubmit={save} className="card space-y-4 p-6">
        <div>
          <label className="label">رقم واتساب (بصيغة دولية مثل 962790000000)</label>
          <input
            className="input"
            dir="ltr"
            value={s.whatsapp_number}
            onChange={(e) => setS({ ...s, whatsapp_number: e.target.value })}
          />
        </div>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="label">رسوم التوصيل (د.أ)</label>
            <input
              className="input"
              dir="ltr"
              type="number"
              step="0.01"
              min="0"
              value={s.shipping_fee}
              onChange={(e) => setS({ ...s, shipping_fee: Number(e.target.value) })}
            />
          </div>
          <div>
            <label className="label">توصيل مجاني فوق (د.أ)</label>
            <input
              className="input"
              dir="ltr"
              type="number"
              step="0.01"
              min="0"
              value={s.free_shipping_over ?? ""}
              onChange={(e) =>
                setS({ ...s, free_shipping_over: e.target.value === "" ? null : Number(e.target.value) })
              }
            />
          </div>
        </div>
        <div>
          <label className="label">رابط انستغرام</label>
          <input className="input" dir="ltr" value={s.instagram} onChange={(e) => setS({ ...s, instagram: e.target.value })} />
        </div>
        <div>
          <label className="label">رابط فيسبوك</label>
          <input className="input" dir="ltr" value={s.facebook} onChange={(e) => setS({ ...s, facebook: e.target.value })} />
        </div>
        <div className="flex items-center gap-3">
          <button className="btn-primary" disabled={saving}>
            {saving ? "..." : "حفظ الإعدادات"}
          </button>
          {saved && <span className="text-sm font-semibold text-green-600">✓ تم الحفظ</span>}
        </div>
      </form>
    </div>
  );
}
