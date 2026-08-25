-- Mass Princess store schema — run this in Supabase SQL Editor

create extension if not exists "uuid-ossp";

-- Categories
create table public.categories (
  id uuid primary key default uuid_generate_v4(),
  slug text unique not null,
  name_ar text not null,
  name_en text not null,
  image text,
  sort int not null default 0,
  created_at timestamptz not null default now()
);

-- Products
create table public.products (
  id uuid primary key default uuid_generate_v4(),
  slug text unique not null,
  name_ar text not null,
  name_en text not null,
  description_ar text,
  description_en text,
  price numeric(10,2) not null,
  compare_at_price numeric(10,2),
  category_id uuid references public.categories(id) on delete set null,
  images text[] not null default '{}',
  stock int not null default 0,
  is_featured boolean not null default false,
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);
create index products_category_idx on public.products(category_id);
create index products_active_idx on public.products(is_active);

-- Orders
create table public.orders (
  id uuid primary key default uuid_generate_v4(),
  order_number serial,
  customer_name text not null,
  phone text not null,
  city text not null,
  address text not null,
  notes text,
  payment_method text not null default 'cod' check (payment_method in ('cod','card','whatsapp')),
  status text not null default 'new' check (status in ('new','confirmed','shipped','delivered','cancelled')),
  subtotal numeric(10,2) not null,
  shipping numeric(10,2) not null default 0,
  total numeric(10,2) not null,
  created_at timestamptz not null default now()
);

create table public.order_items (
  id uuid primary key default uuid_generate_v4(),
  order_id uuid not null references public.orders(id) on delete cascade,
  product_id uuid references public.products(id) on delete set null,
  name_ar text not null,
  name_en text not null,
  price numeric(10,2) not null,
  qty int not null,
  image text
);
create index order_items_order_idx on public.order_items(order_id);

-- Store settings (single row, key = 'store')
create table public.settings (
  key text primary key,
  value jsonb not null default '{}'
);
insert into public.settings (key, value) values ('store', '{"whatsapp_number":"","shipping_fee":3,"free_shipping_over":50,"instagram":"","facebook":""}');

-- ============ Row Level Security ============
alter table public.categories enable row level security;
alter table public.products enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;
alter table public.settings enable row level security;

-- Public read
create policy "public read categories" on public.categories for select using (true);
create policy "public read products" on public.products for select using (true);
create policy "public read settings" on public.settings for select using (true);

-- Anyone can place an order (insert only)
create policy "anon insert orders" on public.orders for insert with check (true);
create policy "anon insert order_items" on public.order_items for insert with check (true);

-- Admin (any authenticated user) full access
create policy "admin all categories" on public.categories for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "admin all products" on public.products for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "admin select orders" on public.orders for select using (auth.role() = 'authenticated');
create policy "admin update orders" on public.orders for update using (auth.role() = 'authenticated');
create policy "admin delete orders" on public.orders for delete using (auth.role() = 'authenticated');
create policy "admin select order_items" on public.order_items for select using (auth.role() = 'authenticated');
create policy "admin update settings" on public.settings for update using (auth.role() = 'authenticated');

-- Decrement stock atomically on checkout
create or replace function public.decrement_stock(p_id uuid, p_qty int)
returns void language sql security definer as $$
  update public.products set stock = greatest(stock - p_qty, 0) where id = p_id;
$$;

-- ============ Storage ============
-- Create a PUBLIC bucket named: products  (Dashboard > Storage > New bucket)
-- Then run:
-- create policy "public read product images" on storage.objects for select using (bucket_id = 'products');
-- create policy "admin upload product images" on storage.objects for insert with check (bucket_id = 'products' and auth.role() = 'authenticated');
-- create policy "admin delete product images" on storage.objects for delete using (bucket_id = 'products' and auth.role() = 'authenticated');
