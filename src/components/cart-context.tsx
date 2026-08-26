"use client";
import { createContext, useContext, useEffect, useMemo, useState } from "react";
import { cartKey, type CartItem } from "@/lib/types";

type CartCtx = {
  items: CartItem[];
  add: (item: CartItem) => void;
  remove: (key: string) => void;
  setQty: (key: string, qty: number) => void;
  clear: () => void;
  count: number;
  subtotal: number;
};

const Ctx = createContext<CartCtx | null>(null);
const KEY = "mp_cart";
const keyOf = (i: CartItem) => cartKey(i.productId, i.shade);

export function CartProvider({ children }: { children: React.ReactNode }) {
  const [items, setItems] = useState<CartItem[]>([]);
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    try {
      const raw = localStorage.getItem(KEY);
      if (raw) setItems(JSON.parse(raw));
    } catch {}
    setLoaded(true);
  }, []);

  useEffect(() => {
    if (!loaded) return;
    try {
      localStorage.setItem(KEY, JSON.stringify(items));
    } catch {}
  }, [items, loaded]);

  const add = (item: CartItem) =>
    setItems((prev) => {
      const k = keyOf(item);
      const ex = prev.find((i) => keyOf(i) === k);
      if (ex)
        return prev.map((i) =>
          keyOf(i) === k ? { ...i, qty: Math.min(i.qty + item.qty, i.stock || 99) } : i
        );
      return [...prev, item];
    });

  const remove = (key: string) =>
    setItems((prev) => prev.filter((i) => keyOf(i) !== key));

  const setQty = (key: string, qty: number) =>
    setItems((prev) =>
      prev.map((i) =>
        keyOf(i) === key ? { ...i, qty: Math.max(1, Math.min(qty, i.stock || 99)) } : i
      )
    );

  const clear = () => setItems([]);

  const { count, subtotal } = useMemo(
    () => ({
      count: items.reduce((s, i) => s + i.qty, 0),
      subtotal: items.reduce((s, i) => s + i.qty * i.price, 0),
    }),
    [items]
  );

  return (
    <Ctx.Provider value={{ items, add, remove, setQty, clear, count, subtotal }}>
      {children}
    </Ctx.Provider>
  );
}

export function useCart() {
  const ctx = useContext(Ctx);
  if (!ctx) throw new Error("useCart outside CartProvider");
  return ctx;
}
