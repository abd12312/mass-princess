-- Shade → image mapping (from Shopify export). Run in Supabase SQL Editor.

alter table public.products add column if not exists shade_images jsonb not null default '{}'::jsonb;

update public.products set shade_images = '{
"Purple":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/10_1ab62060-1b84-470c-ba7e-5276e8f8d950.jpg?v=1757154921",
"yellow":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/11_689db5e8-80a9-44be-ab8c-5d4b44ad5b61.jpg?v=1757154931",
"blue":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/8_245db79f-a134-47d4-bbef-7e9d539ddc4c.jpg?v=1757154958",
"baby blue":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/12_c5cc09d3-4451-470d-8597-a513b04e68e2.jpg?v=1757154975",
"pink":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/7.jpg?v=1757154991",
"baby pink":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/9.jpg?v=1757155004"
}'::jsonb where slug='lip-oil';

update public.products set shade_images = '{
"1":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_001.jpg?v=1736430802",
"2":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_002.jpg?v=1736430813",
"3":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_003.jpg?v=1736430820",
"4":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_004.jpg?v=1736430825",
"5":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_005.jpg?v=1736430834",
"6":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_006.jpg?v=1736430841",
"7":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_007.jpg?v=1736430847",
"8":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_008.jpg?v=1736430852",
"9":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_009.jpg?v=1736430857",
"10":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_010.jpg?v=1736430865",
"11":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_011.jpg?v=1736430877",
"12":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_012.jpg?v=1736430881",
"14":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_014.jpg?v=1736430891",
"15":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_015.jpg?v=1736430896",
"16":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_016.jpg?v=1736430903",
"17":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_017.jpg?v=1736430908",
"18":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_018.jpg?v=1736430915",
"19":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_019.jpg?v=1736430917",
"20":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_020.jpg?v=1736430923",
"21":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_021.jpg?v=1736430927",
"22":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_022.jpg?v=1736430933",
"23":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_023.jpg?v=1736430942",
"24":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_024.jpg?v=1736430945"
}'::jsonb where slug='nail-polish';

update public.products set shade_images = '{
"Auburn":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/AUBURN.jpg?v=1742110114",
"Chocolate":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/CHOCOLATE.jpg?v=1742110109"
}'::jsonb where slug='brow-fection-set';

update public.products set shade_images = '{
"Brown":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/141.webp?v=1765879930",
"Black":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/142.webp?v=1765879930"
}'::jsonb where slug='creamy-eyeliner';

update public.products set shade_images = '{
"01":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/2.png?v=1775898756",
"02":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/3.png?v=1775898756"
}'::jsonb where slug='contour-concealer-2in1';

update public.products set shade_images = '{
"1":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/85.jpg?v=1757837275",
"2":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/86.jpg?v=1757837465",
"3":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/84.jpg?v=1757837265"
}'::jsonb where slug='powder-foundation';

update public.products set shade_images = '{
"1":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/159.webp?v=1766822553",
"2":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/160.webp?v=1766822553"
}'::jsonb where slug='lipstick-lipliner-2in1';

update public.products set shade_images = '{
"A1":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/10.png?v=1775899008",
"A2":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/11.png?v=1775899008"
}'::jsonb where slug='lip-plumper-2';

update public.products set shade_images = '{
"Brown":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_eyebrow_01.jpg?v=1736412897",
"Dark Brown":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_eyebrow_02.jpg?v=1736412901"
}'::jsonb where slug='eyebrow-pencil-3';

update public.products set shade_images = '{
"Water mMelon":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessfacialcleanserwatermelonwhite_f178e40f-3dda-4e39-a195-bd5e1106ecf3.jpg?v=1736417189",
"Hokkaido Milk":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessfacialwhippingfoammilkwhite_fcc25914-89a8-4c59-8a09-f527166392b3.jpg?v=1736417189",
"Aloe Vera":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessfacialcleanseraloeverawhite_60a48318-30d8-46fb-bf34-ad1bbb388aa9.jpg?v=1736417189"
}'::jsonb where slug='facial-cleanser';

update public.products set shade_images = '{
"Matte A":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_lipgloss_matte_A.jpg?v=1736252860",
"Matte B":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_lipgloss_matte_B.jpg?v=1736252868"
}'::jsonb where slug='matte-gloss-set';

update public.products set shade_images = '{
"01":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_blusher_01.jpg?v=1736424817",
"02":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_blusher_02.jpg?v=1736424824",
"03":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_blusher_03.jpg?v=1736424830",
"04":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_blusher_04.jpg?v=1736424834"
}'::jsonb where slug='blusher-2';

update public.products set shade_images = '{
"01":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/3A7A75CF-3CE6-49E9-8962-C91F140DA43A.jpg?v=1726206137",
"02":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/9B090BCD-FD92-479C-87AE-A15657C1EF03.jpg?v=1726206137"
}'::jsonb where slug='lip-cheek-tint';

update public.products set shade_images = '{
"1":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princesss_foundation_01.jpg?v=1736587745",
"2":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princesss_foundation_02.jpg?v=1736587747",
"3":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princesss_foundation_03.jpg?v=1736587751",
"4":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princesss_foundation_04.jpg?v=1736587754"
}'::jsonb where slug='foundation';

update public.products set shade_images = '{
"1":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass-_concealer_web.jpg?v=1710619893",
"2":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass-_concealer_web_2.jpg?v=1710619892",
"3":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/IMG-20240316-WA0028.jpg?v=1710619891",
"4":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/IMG-20240316-WA0038.jpg?v=1710619890"
}'::jsonb where slug='full-cover-concealer';

update public.products set shade_images = '{
"1":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesspowder01.jpg?v=1738663315",
"2":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesspowder02.jpg?v=1738663315",
"3":"https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesspowder03.jpg?v=1738663315"
}'::jsonb where slug='loose-powder';
