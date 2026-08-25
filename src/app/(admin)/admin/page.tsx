import Link from "next/link";
import { createClient } from "@/lib/supabase/server";

export const dynamic = "force-dynamic";

const statusLabels: Record<string, string> = {
  new: "جديد",
  confirmed: "مؤكد",
  shipped: "تم الشحن",
  delivered: "تم التوصيل",
  cancelled: "ملغي",
};

export default async function AdminDashboard() {
  const supabase = createClient();
  const [{ count: productCount }, { count: orderCount }, { data: newOrders }, { data: recent }] =
    await Promise.all([
      supabase.from("products").select("*", { count: "exact", head: true }),
      supabase.from("orders").select("*", { count: "exact", head: true }),
      supabase.from("orders").select("total").eq("status", "delivered"),
      supabase.from("orders").select("*").order("created_at", { ascending: false }).limit(8),
    ]);

  const revenue = (newOrders ?? []).reduce((s, o) => s + Number(o.total), 0);

  const stats = [
    { label: "المنتجات", value: productCount ?? 0, href: "/admin/products" },
    { label: "الطلبات", value: orderCount ?? 0, href: "/admin/orders" },
    { label: "المبيعات (المُوصَّلة)", value: `${revenue.toFixed(2)} د.أ`, href: "/admin/orders" },
  ];

  return (
    <div>
      <h1 className="mb-6 text-2xl font-bold">لوحة التحكم</h1>
      <div className="grid gap-4 sm:grid-cols-3">
        {stats.map((s) => (
          <Link key={s.label} href={s.href} className="card p-5 hover:border-brand-200">
            <p className="text-sm text-gray-500">{s.label}</p>
            <p className="mt-1 text-3xl font-extrabold text-brand-700">{s.value}</p>
          </Link>
        ))}
      </div>

      <h2 className="mb-3 mt-8 text-lg font-bold">آخر الطلبات</h2>
      <div className="card overflow-x-auto">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b bg-gray-50 text-start">
              <th className="p-3 text-start">#</th>
              <th className="p-3 text-start">العميل</th>
              <th className="p-3 text-start">المدينة</th>
              <th className="p-3 text-start">الإجمالي</th>
              <th className="p-3 text-start">الحالة</th>
            </tr>
          </thead>
          <tbody>
            {(recent ?? []).map((o) => (
              <tr key={o.id} className="border-b last:border-0 hover:bg-brand-50/40">
                <td className="p-3">
                  <Link href={`/admin/orders/${o.id}`} className="font-semibold text-brand-600">
                    #{o.order_number}
                  </Link>
                </td>
                <td className="p-3">{o.customer_name}</td>
                <td className="p-3">{o.city}</td>
                <td className="p-3">{Number(o.total).toFixed(2)} د.أ</td>
                <td className="p-3">{statusLabels[o.status] ?? o.status}</td>
              </tr>
            ))}
            {(recent ?? []).length === 0 && (
              <tr>
                <td colSpan={5} className="p-6 text-center text-gray-400">
                  لا توجد طلبات بعد
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
