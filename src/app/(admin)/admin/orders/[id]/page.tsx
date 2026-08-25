"use client";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Order, OrderStatus } from "@/lib/types";
import { statusLabels, statusColors, paymentLabels } from "@/lib/order-status";

export default function AdminOrderDetail({ params }: { params: { id: string } }) {
  const supabase = createClient();
  const [order, setOrder] = useState<Order | null>(null);

  async function load() {
    const { data } = await supabase
      .from("orders")
      .select("*, order_items(*)")
      .eq("id", params.id)
      .single();
    setOrder(data as Order | null);
  }
  useEffect(() => {
    load();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function setStatus(status: OrderStatus) {
    await supabase.from("orders").update({ status }).eq("id", params.id);
    load();
  }

  if (!order) return <p className="p-10 text-center text-gray-400">جاري التحميل...</p>;

  return (
    <div className="max-w-3xl">
      <div className="mb-6 flex flex-wrap items-center justify-between gap-3">
        <h1 className="text-2xl font-bold">طلب #{order.order_number}</h1>
        <span className={`rounded-full px-3 py-1.5 text-sm font-semibold ${statusColors[order.status]}`}>
          {statusLabels[order.status]}
        </span>
      </div>

      <div className="card mb-5 p-5">
        <p className="mb-3 font-bold">تغيير الحالة:</p>
        <div className="flex flex-wrap gap-2">
          {(Object.keys(statusLabels) as OrderStatus[]).map((s) => (
            <button
              key={s}
              onClick={() => setStatus(s)}
              disabled={order.status === s}
              className={`rounded-full px-3 py-1.5 text-sm font-medium border transition ${
                order.status === s
                  ? "bg-brand-600 text-white border-brand-600"
                  : "bg-white text-gray-600 hover:border-brand-400"
              }`}
            >
              {statusLabels[s]}
            </button>
          ))}
        </div>
      </div>

      <div className="grid gap-5 sm:grid-cols-2">
        <div className="card p-5 text-sm">
          <p className="mb-2 font-bold">بيانات العميل</p>
          <p>الاسم: {order.customer_name}</p>
          <p dir="ltr" className="text-start">📞 {order.phone}</p>
          <p>المدينة: {order.city}</p>
          <p>العنوان: {order.address}</p>
          {order.notes && <p>ملاحظات: {order.notes}</p>}
          <a
            href={`https://wa.me/${order.phone.replace(/[^0-9]/g, "").replace(/^0/, "962")}`}
            target="_blank"
            rel="noreferrer"
            className="btn-outline mt-3 !px-4 !py-1.5 text-xs"
          >
            تواصل واتساب
          </a>
        </div>
        <div className="card p-5 text-sm">
          <p className="mb-2 font-bold">تفاصيل الطلب</p>
          <p>طريقة الدفع: {paymentLabels[order.payment_method]}</p>
          <p>التاريخ: {new Date(order.created_at).toLocaleString("en-GB")}</p>
          <p>المجموع الفرعي: {Number(order.subtotal).toFixed(2)} د.أ</p>
          <p>التوصيل: {Number(order.shipping).toFixed(2)} د.أ</p>
          <p className="mt-1 text-base font-bold text-brand-700">
            الإجمالي: {Number(order.total).toFixed(2)} د.أ
          </p>
        </div>
      </div>

      <div className="card mt-5 divide-y">
        {(order.order_items ?? []).map((i) => (
          <div key={i.id} className="flex items-center gap-3 p-3">
            <div className="h-14 w-14 shrink-0 overflow-hidden rounded-lg bg-brand-50">
              {i.image && (
                // eslint-disable-next-line @next/next/no-img-element
                <img src={i.image} alt="" className="h-full w-full object-cover" />
              )}
            </div>
            <div className="flex-1">
              <p className="font-semibold">{i.name_ar}</p>
              <p className="text-xs text-gray-500">
                {Number(i.price).toFixed(2)} د.أ × {i.qty}
              </p>
            </div>
            <p className="font-bold">{(Number(i.price) * i.qty).toFixed(2)} د.أ</p>
          </div>
        ))}
      </div>
    </div>
  );
}
