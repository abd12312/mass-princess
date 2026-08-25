"use client";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function LoginPage() {
  const router = useRouter();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  async function submit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setError("");
    const { error } = await createClient().auth.signInWithPassword({ email, password });
    if (error) {
      setError("بيانات الدخول غير صحيحة");
      setLoading(false);
      return;
    }
    router.push("/admin");
    router.refresh();
  }

  return (
    <div className="flex min-h-[80vh] items-center justify-center">
      <form onSubmit={submit} className="card w-full max-w-sm space-y-4 p-8">
        <div className="text-center">
          <p className="text-2xl font-extrabold text-brand-700">ماس برنسيس ✦</p>
          <p className="mt-1 text-sm text-gray-500">تسجيل الدخول للوحة التحكم</p>
        </div>
        <div>
          <label className="label">البريد الإلكتروني</label>
          <input className="input" dir="ltr" type="email" required value={email} onChange={(e) => setEmail(e.target.value)} />
        </div>
        <div>
          <label className="label">كلمة المرور</label>
          <input className="input" dir="ltr" type="password" required value={password} onChange={(e) => setPassword(e.target.value)} />
        </div>
        {error && <p className="text-sm text-red-500">{error}</p>}
        <button className="btn-primary w-full" disabled={loading}>
          {loading ? "..." : "دخول"}
        </button>
      </form>
    </div>
  );
}
