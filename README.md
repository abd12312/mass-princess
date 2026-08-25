# Mass Princess — متجر إلكتروني (ماس برنسيس)

متجر إلكتروني كامل بنظام شبيه بشوبيفاي: واجهة متجر (عربي/إنجليزي) + لوحة تحكم لإدارة المنتجات والطلبات.

**التقنيات:** Next.js 14 + Supabase (قاعدة بيانات + صور + تسجيل دخول) + Tailwind — جاهز للنشر على Vercel.

---

## خطوات التشغيل (مرة واحدة فقط)

### 1) إنشاء مشروع Supabase
1. ادخل على [supabase.com](https://supabase.com) وأنشئ مشروع جديد (مجاني) — سمّه `mass-princess`.
2. من القائمة الجانبية افتح **SQL Editor** → الصق محتوى الملف `supabase/schema.sql` كاملًا → اضغط **Run**.
3. افتح **Storage** → **New bucket** → الاسم: `products` → فعّل **Public bucket** → أنشئه.
4. ارجع لـ **SQL Editor** وشغّل هذه الأسطر (سياسات الصور):
   ```sql
   create policy "public read product images" on storage.objects for select using (bucket_id = 'products');
   create policy "admin upload product images" on storage.objects for insert with check (bucket_id = 'products' and auth.role() = 'authenticated');
   create policy "admin delete product images" on storage.objects for delete using (bucket_id = 'products' and auth.role() = 'authenticated');
   ```
5. أنشئ حساب الأدمن: **Authentication** → **Users** → **Add user** → **Create new user** → أدخل إيميل وكلمة مرور (هذا حساب دخول لوحة التحكم).

### 2) مفاتيح الربط
من **Project Settings → API** انسخ:
- `Project URL`
- `anon public` key

### 3) النشر على Vercel
1. ارفع هذا المجلد على GitHub (repo جديد).
2. ادخل على [vercel.com](https://vercel.com) → **Add New Project** → اختر الـ repo.
3. في خانة **Environment Variables** أضف:
   - `NEXT_PUBLIC_SUPABASE_URL` = رابط المشروع
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY` = المفتاح
4. اضغط **Deploy**. خلص 🎉

### التشغيل محليًا (اختياري)
```bash
cp .env.example .env.local   # وعبّي المفاتيح
npm install
npm run dev
```

---

## الاستخدام

| الرابط | الوظيفة |
|---|---|
| `/ar` | المتجر بالعربي (الافتراضي) |
| `/en` | المتجر بالإنجليزي |
| `/admin` | لوحة التحكم (تسجيل دخول بحساب Supabase) |

**من لوحة التحكم:** إضافة/تعديل المنتجات مع رفع الصور، التصنيفات، متابعة الطلبات وتغيير حالتها (جديد → مؤكد → تم الشحن → تم التوصيل)، وإعدادات المتجر (رقم الواتساب، رسوم التوصيل، التوصيل المجاني، روابط السوشال).

**طرق الدفع الحالية:** الدفع عند الاستلام (COD) ✅ · الطلب عبر واتساب ✅ · البطاقات: الطلب بينسجل والدفع "قريبًا" — لما تختاروا بوابة دفع (HyperPay / PayTabs / Montypay...) منربطها بالـ API route `src/app/api/checkout/route.ts`.

**العملة:** دينار أردني (د.أ / JOD).
