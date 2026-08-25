"use client";
import Link from "next/link";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Order, OrderStatus } from "@/lib/types";
import { statusLabels, statusColors, paymentLabels } from "@/lib/order-status";

export default function AdminOrders() {
  const supabase = createClient();
  const [orders, setOrders] = useState<Order[]>([]);
  const [filter, setFilter] = useState<OrderStatus | "all">("all");
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    (async () => {
      setLoading(true);
      let q = supabase.from("orders").select("*").order("created_at", { ascending: false });
      if (filter !== "all") q = q.eq("status", filter);
      const { data } = await q;
      setOrders((data ?? []) as Order[]);
      setLoading(false);
    })();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filter]);

  return (
    <div>
      <h1 className="mb-5 text-2xl font-bold">الطلبات</h1>
      <div className="mb-4 flex flex-wrap gap-2">
        {(["all", "new", "confirmed", "shipped", "delivered", "cancelled"] as const).map((s) => (
          <button
            key={s}
            onClick={() => setFilter(s)}
            className={`rounded-full px-3 py-1.5 text-sm font-medium ${
              filter === s ? "bg-brand-600 text-white" : "bg-white text-gray-600 border"
            }`}
          >
            {s === "all" ? "الكل" : statusLabels[s]}
          </button>
        ))}
      </div>
      <div className="card overflow-x-auto">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b bg-gray-50">
              <th className="p-3 text-start">#</th>
              <th className="p-3 text-start">العميل</th>
              <th className="p-3 text-start">الهاتف</th>
              <th className="p-3 text-start">المدينة</th>
              <th className="p-3 text-start">الدفع</th>
              <th className="p-3 text-start">الإجمالي</th>
              <th className="p-3 text-start">الحالة</th>
              <th className="p-3 text-start">التاريخ</th>
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr><td colSpan={8} className="p-6 text-center text-gray-400">جاري التحميل...</td></tr>
            ) : (
              orders.map((o) => (
                <tr key={o.id} className="border-b last:border-0 hover:bg-brand-50/40">
                  <td className="p-3">
                    <Link href={`/admin/orders/${o.id}`} className="font-semibold text-brand-600">
                      #{o.order_number}
                    </Link>
                  </td>
                  <td className="p-3">{o.customer_name}</td>
                  <td className="p-3" dir="ltr">{o.phone}</td>
                  <td className="p-3">{o.city}</td>
                  <td className="p-3">{paymentLabels[o.payment_method]}</td>
                  <td className="p-3 font-semibold">{Number(o.total).toFixed(2)} د.أ</td>
                  <td className="p-3">
                    <span className={`rounded-full px-2.5 py-1 text-xs font-semibold ${statusColors[o.status]}`}>
                      {statusLabels[o.status]}
                    </span>
                  </td>
                  <td className="p-3 text-xs text-gray-500">
                    {new Date(o.created_at).toLocaleDateString("en-GB")}
                  </td>
                </tr>
              ))
            )}
            {!loading && orders.length === 0 && (
              <tr><td colSpan={8} className="p-6 text-center text-gray-400">لا توجد طلبات</td></tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
