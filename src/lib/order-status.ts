import type { OrderStatus } from "./types";

export const statusLabels: Record<OrderStatus, string> = {
  new: "جديد",
  confirmed: "مؤكد",
  shipped: "تم الشحن",
  delivered: "تم التوصيل",
  cancelled: "ملغي",
};
export const statusColors: Record<OrderStatus, string> = {
  new: "bg-blue-100 text-blue-700",
  confirmed: "bg-amber-100 text-amber-700",
  shipped: "bg-purple-100 text-purple-700",
  delivered: "bg-green-100 text-green-700",
  cancelled: "bg-gray-200 text-gray-600",
};
export const paymentLabels: Record<string, string> = {
  cod: "عند الاستلام",
  card: "بطاقة",
  whatsapp: "واتساب",
};
