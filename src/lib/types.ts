export type Category = {
  id: string;
  slug: string;
  name_ar: string;
  name_en: string;
  image: string | null;
  sort: number;
};

export type Product = {
  id: string;
  slug: string;
  name_ar: string;
  name_en: string;
  description_ar: string | null;
  description_en: string | null;
  price: number;
  compare_at_price: number | null;
  category_id: string | null;
  images: string[];
  stock: number;
  is_featured: boolean;
  is_active: boolean;
  created_at: string;
  categories?: Category | null;
};

export type OrderStatus = "new" | "confirmed" | "shipped" | "delivered" | "cancelled";
export type PaymentMethod = "cod" | "card" | "whatsapp";

export type Order = {
  id: string;
  order_number: number;
  customer_name: string;
  phone: string;
  city: string;
  address: string;
  notes: string | null;
  payment_method: PaymentMethod;
  status: OrderStatus;
  subtotal: number;
  shipping: number;
  total: number;
  created_at: string;
  order_items?: OrderItem[];
};

export type OrderItem = {
  id: string;
  order_id: string;
  product_id: string | null;
  name_ar: string;
  name_en: string;
  price: number;
  qty: number;
  image: string | null;
};

export type CartItem = {
  productId: string;
  slug: string;
  name_ar: string;
  name_en: string;
  price: number;
  image: string | null;
  qty: number;
  stock: number;
  shade?: string | null;
};

export function cartKey(productId: string, shade?: string | null) {
  return `${productId}|${shade ?? ""}`;
}

export type StoreSettings = {
  whatsapp_number: string;
  shipping_fee: number;
  free_shipping_over: number | null;
  instagram: string;
  facebook: string;
};

export const DEFAULT_SETTINGS: StoreSettings = {
  whatsapp_number: "",
  shipping_fee: 3,
  free_shipping_over: 50,
  instagram: "",
  facebook: "",
};
