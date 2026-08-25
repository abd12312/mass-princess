-- Mass Princess catalog seed — run AFTER schema.sql in Supabase SQL Editor

insert into public.categories (slug, name_ar, name_en, sort) values ('lips', 'الشفاه', 'Lips', 0);
insert into public.categories (slug, name_ar, name_en, sort) values ('eyes-brows', 'العيون والحواجب', 'Eyes & Brows', 1);
insert into public.categories (slug, name_ar, name_en, sort) values ('face', 'الوجه', 'Face', 2);
insert into public.categories (slug, name_ar, name_en, sort) values ('skincare', 'العناية بالبشرة', 'Skincare', 3);
insert into public.categories (slug, name_ar, name_en, sort) values ('nails', 'الأظافر', 'Nails', 4);
insert into public.categories (slug, name_ar, name_en, sort) values ('perfume-tools', 'العطور والأدوات', 'Perfume & Tools', 5);

insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-gloss-classic', 'جلوس شفاه', 'Lip Gloss', 'جلوس شفاه من ماس برنسيس بجودة عالية.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6', 'Lip Gloss by Mass Princess — high quality.

Available shades: 1, 2, 3, 4, 5, 6', 1.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/16.png?v=1775899577']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-balm', 'مرطب شفاه', 'Lip Balm', 'مرطب شفاه من ماس برنسيس بجودة عالية.

الدرجات المتوفرة: 1، 2، 3، 4، 5', 'Lip Balm by Mass Princess — high quality.

Available shades: 1, 2, 3, 4, 5', 1.49, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/6_98b4a6b0-d5b9-4afd-93d2-51f142a00da3.png?v=1775899486']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('classic-black-mascara', 'مسكارا سوداء كلاسيك', 'Classic Black Mascara', 'مسكارا سوداء كلاسيك من ماس برنسيس بجودة عالية.', 'Classic Black Mascara by Mass Princess — high quality.', 2.49, null, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/13.png?v=1775899421']::text[], 10, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('eyebrow-gel', 'جل حواجب', 'Eyebrow Gel', 'جل حواجب من ماس برنسيس بجودة عالية.', 'Eyebrow Gel by Mass Princess — high quality.', 1.99, null, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/8.png?v=1775899319']::text[], 13, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-gloss-love', 'جلوس شفاه لوف', 'Lip Gloss Love', 'جلوس شفاه لوف من ماس برنسيس بجودة عالية.

الدرجات المتوفرة: 1، 2، 3', 'Lip Gloss Love by Mass Princess — high quality.

Available shades: 1, 2, 3', 1.49, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/9.png?v=1775899232']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-liner-set', 'طقم محدد شفاه', 'Lip Liner Set', 'طقم محدد شفاه من ماس برنسيس بجودة عالية.', 'Lip Liner Set by Mass Princess — high quality.', 7.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/15.png?v=1775899173']::text[], 6, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-plumper-2', 'جلوس مكبر للشفاه', 'Lip Plumper', 'جلوس مكبر للشفاه من ماس برنسيس بجودة عالية.

الدرجات المتوفرة: A1، A2، A3، A4، A5، A6، A7، A8، B1، B2، B3، B4، B5، B6، B7، B8', 'Lip Plumper by Mass Princess — high quality.

Available shades: A1, A2, A3, A4, A5, A6, A7, A8, B1, B2, B3, B4, B5, B6, B7, B8', 1.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/10.png?v=1775899008','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/11.png?v=1775899008']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('waterproof-eyebrow-pencil', 'قلم حواجب مقاوم للماء', 'Stain + Waterproof Eyebrow Pencil', 'قلم حواجب مقاوم للماء من ماس برنسيس بجودة عالية.', 'Stain + Waterproof Eyebrow Pencil by Mass Princess — high quality.', 1.99, null, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/4_84d032d2-9c01-4ccd-bd2b-4351bbceac04.png?v=1775898935']::text[], 38, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('contour-concealer-2in1', 'كونتور وكونسيلر 2 في 1', '2 in 1 Contour & Concealer', 'كونتور وكونسيلر 2 في 1 من ماس برنسيس بجودة عالية.

الدرجات المتوفرة: 01، 02', '2 in 1 Contour & Concealer by Mass Princess — high quality.

Available shades: 01, 02', 2.49, null, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/2.png?v=1775898756','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/3.png?v=1775898756']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('creamy-highlighter', 'هايلايتر كريمي', 'Creamy Highlighter', 'هايلايتر كريمي من ماس برنسيس بجودة عالية.

الدرجات المتوفرة: Gold، White، Pink', 'Creamy Highlighter by Mass Princess — high quality.

Available shades: Gold, White, Pink', 2.99, null, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/17.png?v=1775898663']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lipstick-lipliner-2in1', 'روج ومحدد شفاه 2 في 1', '2 in 1 Lipstick & Lip Liner', 'قلم مزدوج الاستخدام يجمع بين محدد الشفاه وأحمر الشفاه، لترسمي وتملئي شفايفك بسهولة بلون أنيق وثابت. 
 متوفر بعدة ألوان جذّابة تناسب كل الإطلالات 
 طريقة الاستخدام: 
 1. حدّدي الشفاه باستخدام الطرف الرفيع (الليب لاينر). 
 2. ادمجي الخط لتغطي ثلث الشفاه. 
 3. استخدمي الطرف الآخر لتعبئة باقي الشفاه للحصول على مظهر ممتلئ ومتناسق. 
 النتيجة: شفاه محددة، لون غني ومات يدوم لساعات.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6، 7، 8', 'قلم مزدوج الاستخدام يجمع بين محدد الشفاه وأحمر الشفاه، لترسمي وتملئي شفايفك بسهولة بلون أنيق وثابت. 
 متوفر بعدة ألوان جذّابة تناسب كل الإطلالات 
 طريقة الاستخدام: 
 1. حدّدي الشفاه باستخدام الطرف الرفيع (الليب لاينر). 
 2. ادمجي الخط لتغطي ثلث الشفاه. 
 3. استخدمي الطرف الآخر لتعبئة باقي الشفاه للحصول على مظهر ممتلئ ومتناسق. 
 النتيجة: شفاه محددة، لون غني ومات يدوم لساعات.

Available shades: 1, 2, 3, 4, 5, 6, 7, 8', 1.49, 2.99, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/159.webp?v=1766822553','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/160.webp?v=1766822553']::text[], 42, true, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-gloss-mini', 'جلوس شفاه', 'Lip Gloss', 'احصلي على شفاه جذابة بلمسة مخملية. يتميز بقوام كريمي وخفيف يمنحك لونًا غنيًا وثابتًا يدوم لساعات، دون التسبب في جفاف الشفاه.
 طريقة الاستخدام: 
ضعيه مباشرة على شفتيك باستخدام الفرشاة المدمجة، وابدئي من المنتصف ووزعيه نحو الأطراف. للحصول على مظهر أكثر تحديدًا، استخدمي محدد شفاه قبل التطبيق.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6', 'احصلي على شفاه جذابة بلمسة مخملية. يتميز بقوام كريمي وخفيف يمنحك لونًا غنيًا وثابتًا يدوم لساعات، دون التسبب في جفاف الشفاه.
 طريقة الاستخدام: 
ضعيه مباشرة على شفتيك باستخدام الفرشاة المدمجة، وابدئي من المنتصف ووزعيه نحو الأطراف. للحصول على مظهر أكثر تحديدًا، استخدمي محدد شفاه قبل التطبيق.

Available shades: 1, 2, 3, 4, 5, 6', 0.99, 1.99, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/158.webp?v=1766822113']::text[], 51, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-plumper', 'جلوس مكبر للشفاه', 'Lip Plumper', 'مكبر الشفاه الذي يمنح شفاهك مظهرًا ممتلئًا وجذابًا بفضل تركيبته الخاصة التي تعزز الدورة الدموية في الشفاه وتمنحها حجمًا إضافيًا ولمعانًا طبيعيًا في دقائق. تركيبة خفيفة لا تُسبب لزوجة، تحتوي على مكونات مرطبة للحفاظ على نعومة الشفاه.
 طريقة الاستخدام: 
قمي بلف من اسفل المنتج ومن ثم يُطبّق مباشرة على شفاه نظيفة، ويُترك لعدة دقائق حتى يبدأ مفعول الامتلاء. يمكن استخدامه بمفرده للحصول على لمعة طبيعية، أو كقاعدة تحت أحمر الشفاه لزيادة الامتلاء. يفضل تجنب وضعه على الشفاه المتشققة أو الحساسة جدًا.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6، 7، 8', 'مكبر الشفاه الذي يمنح شفاهك مظهرًا ممتلئًا وجذابًا بفضل تركيبته الخاصة التي تعزز الدورة الدموية في الشفاه وتمنحها حجمًا إضافيًا ولمعانًا طبيعيًا في دقائق. تركيبة خفيفة لا تُسبب لزوجة، تحتوي على مكونات مرطبة للحفاظ على نعومة الشفاه.
 طريقة الاستخدام: 
قمي بلف من اسفل المنتج ومن ثم يُطبّق مباشرة على شفاه نظيفة، ويُترك لعدة دقائق حتى يبدأ مفعول الامتلاء. يمكن استخدامه بمفرده للحصول على لمعة طبيعية، أو كقاعدة تحت أحمر الشفاه لزيادة الامتلاء. يفضل تجنب وضعه على الشفاه المتشققة أو الحساسة جدًا.

Available shades: 1, 2, 3, 4, 5, 6, 7, 8', 2.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/ee1459ad-1bb9-4c40-943a-717220cb0a3293a2a955-cbe4-4efc-be52-7434a48a87c0.webp?v=1765888077']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('liquid-eyeliner', 'آيلاينر سائل', 'Liquid Eyeliner', 'بفضل قوامه الخفيف والسائل، يجف قلم تحديد العيون الأنيق غير اللامع من نوت بسرعة، مما يمنح عينيك الخطوط المثالية واللمسة النهائية غير اللامعة المثالية. بفضل كثافة لونه العالية، يمنحك قلم تحديد العيون الأنيق غير اللامع لونًا غنيًا وعميقًا مقاومًا للماء والتعرق والتلطخ. تركيبته طويلة الأمد تظل ثابتة، حتى في المناخات الأكثر حرارة ورطوبة. بفضل طرفه المرن الناعم، ينساب قلم تحديد العيون بسلاسة ليخلق خطوطًا حادة ومحددة بمسحة واحدة فقط. طريقة الاستخدام: ابدئي من الزاوية الداخلية للعين واسحبي الفرشاة برفق على طول خط الرموش العلوي، مع التحكم في سمك الخط حسب رغبتك. يمكن استخدامه لإضافة لمسة نهائية مثالية ل', 'بفضل قوامه الخفيف والسائل، يجف قلم تحديد العيون الأنيق غير اللامع من نوت بسرعة، مما يمنح عينيك الخطوط المثالية واللمسة النهائية غير اللامعة المثالية. بفضل كثافة لونه العالية، يمنحك قلم تحديد العيون الأنيق غير اللامع لونًا غنيًا وعميقًا مقاومًا للماء والتعرق والتلطخ. تركيبته طويلة الأمد تظل ثابتة، حتى في المناخات الأكثر حرارة ورطوبة. بفضل طرفه المرن الناعم، ينساب قلم تحديد العيون بسلاسة ليخلق خطوطًا حادة ومحددة بمسحة واحدة فقط. طريقة الاستخدام: ابدئي من الزاوية الداخلية للعين واسحبي الفرشاة برفق على طول خط الرموش العلوي، مع التحكم في سمك الخط حسب رغبتك. يمكن استخدامه لإضافة لمسة نهائية مثالية ل', 2.99, null, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/c0421b4a-3339-425a-be53-ed87216d277193a2a955-cbe4-4efc-be52-7434a48a87c0.webp?v=1765881715']::text[], 11, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('micellar-water', 'ماء ميسيلار لإزالة المكياج', 'Micellar Water', 'منتج تنظيف فعال يعمل على إزالة المكياج والشوائب من البشرة بكل سهولة دون الحاجة للفرك أو غسل الوجه بالماء. بتركيبته المائية اللطيفة، ينظف البشرة بعمق ويزيل الأوساخ والمكياج، كما يساعد في تهدئة البشرة وترطيبها بفضل مكوناته المغذية. مثالي لجميع أنواع البشرة، بما في ذلك البشرة الحساسة. طريقة الاستخدام: قومي بوضع القليل من ماء الميسيلار على قطعة قطنية، ثم امسحي بها وجهك برفق لإزالة المكياج والشوائب. كرري العملية إذا لزم الأمر. لا يحتاج إلى شطف بعد الاستخدام.

الدرجات المتوفرة: PINK، YELLOW', 'منتج تنظيف فعال يعمل على إزالة المكياج والشوائب من البشرة بكل سهولة دون الحاجة للفرك أو غسل الوجه بالماء. بتركيبته المائية اللطيفة، ينظف البشرة بعمق ويزيل الأوساخ والمكياج، كما يساعد في تهدئة البشرة وترطيبها بفضل مكوناته المغذية. مثالي لجميع أنواع البشرة، بما في ذلك البشرة الحساسة. طريقة الاستخدام: قومي بوضع القليل من ماء الميسيلار على قطعة قطنية، ثم امسحي بها وجهك برفق لإزالة المكياج والشوائب. كرري العملية إذا لزم الأمر. لا يحتاج إلى شطف بعد الاستخدام.

Available shades: PINK, YELLOW', 1.99, 3.99, (select id from public.categories where slug='skincare'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/138.webp?v=1765881487']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('eyebrow-pencil', 'قلم حواجب', 'Eyebrow Pencil', 'منتج تنظيف فعال يعمل على إزالة المكياج والشوائب من البشرة بكل سهولة دون الحاجة للفرك أو غسل الوجه بالماء. بتركيبته المائية اللطيفة، ينظف البشرة بعمق ويزيل الأوساخ والمكياج، كما يساعد في تهدئة البشرة وترطيبها بفضل مكوناته المغذية. مثالي لجميع أنواع البشرة، بما في ذلك البشرة الحساسة. طريقة الاستخدام: قومي بوضع القليل من ماء الميسيلار على قطعة قطنية، ثم امسحي بها وجهك برفق لإزالة المكياج والشوائب. كرري العملية إذا لزم الأمر. لا يحتاج إلى شطف بعد الاستخدام.

الدرجات المتوفرة: 1، 2', 'منتج تنظيف فعال يعمل على إزالة المكياج والشوائب من البشرة بكل سهولة دون الحاجة للفرك أو غسل الوجه بالماء. بتركيبته المائية اللطيفة، ينظف البشرة بعمق ويزيل الأوساخ والمكياج، كما يساعد في تهدئة البشرة وترطيبها بفضل مكوناته المغذية. مثالي لجميع أنواع البشرة، بما في ذلك البشرة الحساسة. طريقة الاستخدام: قومي بوضع القليل من ماء الميسيلار على قطعة قطنية، ثم امسحي بها وجهك برفق لإزالة المكياج والشوائب. كرري العملية إذا لزم الأمر. لا يحتاج إلى شطف بعد الاستخدام.

Available shades: 1, 2', 0.99, 1.99, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/4f9c836b-cf83-48b0-bfb1-13d1ed8b321393a2a955-cbe4-4efc-be52-7434a48a87c0.webp?v=1765881237']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('honey-lip-gloss', 'جلوس شفاه بالعسل', 'Honey Lip Gloss', 'زيت الشفاه بالعسل – ترطيب ولمعان طبيعي! دلّلي شفتيك مع زيت الشفاه بتصميم وعاء العسل اللطيف الذي يجمع بين الأناقة والعناية! تركيبته الغنية تحتوي على مكونات مرطّبة وفيتامين لتغذية الشفاه، تعزيز مرونتها، ومنحها مظهرًا ممتلئًا، ناعمًا، ولامعًا. طريقة الاستخدام: قبل النوم: ضعي طبقة مناسبة من الزيت على الشفاه واتركيها طوال الليل، ثم اشطفيها صباحًا لشفاه ناعمة ورطبة. قبل أو بعد المكياج: استخدميه كـ زيت عناية أو لمسة نهائية ليمنح شفاهك ترطيبًا ولمعانًا يدوم طوال اليوم.

الدرجات المتوفرة: 1، 2، 3', 'زيت الشفاه بالعسل – ترطيب ولمعان طبيعي! دلّلي شفتيك مع زيت الشفاه بتصميم وعاء العسل اللطيف الذي يجمع بين الأناقة والعناية! تركيبته الغنية تحتوي على مكونات مرطّبة وفيتامين لتغذية الشفاه، تعزيز مرونتها، ومنحها مظهرًا ممتلئًا، ناعمًا، ولامعًا. طريقة الاستخدام: قبل النوم: ضعي طبقة مناسبة من الزيت على الشفاه واتركيها طوال الليل، ثم اشطفيها صباحًا لشفاه ناعمة ورطبة. قبل أو بعد المكياج: استخدميه كـ زيت عناية أو لمسة نهائية ليمنح شفاهك ترطيبًا ولمعانًا يدوم طوال اليوم.

Available shades: 1, 2, 3', 0.99, 1.99, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/140.webp?v=1765880971']::text[], 11, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('tube-lip-gloss', 'جلوس شفاه تيوب', 'Tube Lip Gloss', 'جلوس الشفاه يمنح شفاهك لمسة لامعة جذابة وإحساساً مرطباً يدوم طوال اليوم. تركيبته الغنية تعزز مظهر الشفاه الطبيعي وتمنحها امتلاءً ناعماً بفضل تركيبته الخفيفة وغير اللاصقة، ليكون خيارك المثالي للإطلالات اليومية أو لتثبيت لون الروج المفضل لديك.
 يُستخدم مباشرة على الشفاه بمفرده لإضاءة طبيعية، أو فوق أحمر الشفاه لإضفاء لمعة إضافية. يمكن إعادة التطبيق خلال اليوم حسب الحاجة.

الدرجات المتوفرة: 1، 2، 3، 4', 'جلوس الشفاه يمنح شفاهك لمسة لامعة جذابة وإحساساً مرطباً يدوم طوال اليوم. تركيبته الغنية تعزز مظهر الشفاه الطبيعي وتمنحها امتلاءً ناعماً بفضل تركيبته الخفيفة وغير اللاصقة، ليكون خيارك المثالي للإطلالات اليومية أو لتثبيت لون الروج المفضل لديك.
 يُستخدم مباشرة على الشفاه بمفرده لإضاءة طبيعية، أو فوق أحمر الشفاه لإضفاء لمعة إضافية. يمكن إعادة التطبيق خلال اليوم حسب الحاجة.

Available shades: 1, 2, 3, 4', 1.99, 3.49, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/6af1bdb8-468c-4c56-8f73-9eb6f32ee31f93a2a955-cbe4-4efc-be52-7434a48a87c0.webp?v=1765880642']::text[], 89, true, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-gloss', 'جلوس شفاه', 'Lip Gloss', 'زيت مرطب وملمع الشفاه بتركيبة زيتية غير لزجة يوضع فوق الشفتين الطبيعية أو أحمر الشفاه للحصول على لمسة نهائية لامعة للغاية

الدرجات المتوفرة: 1، 2، 3', 'زيت مرطب وملمع الشفاه بتركيبة زيتية غير لزجة يوضع فوق الشفتين الطبيعية أو أحمر الشفاه للحصول على لمسة نهائية لامعة للغاية

Available shades: 1, 2, 3', 1.99, 3.99, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/77.webp?v=1765880471']::text[], 65, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('matte-lip-gloss', 'جلوس شفاه مطفي', 'Matte Lip Gloss', 'مجموعة جلوس مطفي بتركيبة مخملية تدوم طويلاً، تمنح الشفاه لونًا غنيًا وجذابًا مع إحساس خفيف ومريح. يتميز بملمسه الناعم الذي لا يجفف الشفاه، ليمنحك مظهرًا أنيقًا وثابتًا طوال اليوم. طريقة الاستعمال: قومي بتحديد شفتيك برفق، ثم ضعي طبقة من الجلوس باستخدام الفرشاة المرفقة. انتظري بضع ثوانٍ حتى يجف تمامًا للحصول على مظهر مطفي جذاب يدوم لساعات دون تلطخ.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6', 'مجموعة جلوس مطفي بتركيبة مخملية تدوم طويلاً، تمنح الشفاه لونًا غنيًا وجذابًا مع إحساس خفيف ومريح. يتميز بملمسه الناعم الذي لا يجفف الشفاه، ليمنحك مظهرًا أنيقًا وثابتًا طوال اليوم. طريقة الاستعمال: قومي بتحديد شفتيك برفق، ثم ضعي طبقة من الجلوس باستخدام الفرشاة المرفقة. انتظري بضع ثوانٍ حتى يجف تمامًا للحصول على مظهر مطفي جذاب يدوم لساعات دون تلطخ.

Available shades: 1, 2, 3, 4, 5, 6', 1.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/139.webp?v=1765880206']::text[], 24, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('eyeliner', 'آيلاينر', 'Eyeliner', 'اصنعي خطوطًا حادة وأنيقة باستخدام محدد العيون الدقيق. مصمم بطرف رفيع وتركيبة مقاومة للماء، يمنحك محدد العيون ذو الطرف اللبادي لمسة سوداء فائقة الدقة من أول مرة. غني وسريع الجفاف، ولن تتأخري عن الحفلة مرة أخرى.
 طريقة الاستخدام ابدئي برسم خط رفيع على طول خط الرموش العلوي باستخدام الفرشاة الدقيقة، وابدئي من الزاوية الداخلية للعين باتجاه الخارج. يمكنك التحكم بسماكة الخط حسب رغبتك لإطلالة طبيعية أو درامية. اتركيه يجف لبضع ثوانٍ للحصول على مظهر ثابت يدوم طويلاً.', 'اصنعي خطوطًا حادة وأنيقة باستخدام محدد العيون الدقيق. مصمم بطرف رفيع وتركيبة مقاومة للماء، يمنحك محدد العيون ذو الطرف اللبادي لمسة سوداء فائقة الدقة من أول مرة. غني وسريع الجفاف، ولن تتأخري عن الحفلة مرة أخرى.
 طريقة الاستخدام ابدئي برسم خط رفيع على طول خط الرموش العلوي باستخدام الفرشاة الدقيقة، وابدئي من الزاوية الداخلية للعين باتجاه الخارج. يمكنك التحكم بسماكة الخط حسب رغبتك لإطلالة طبيعية أو درامية. اتركيه يجف لبضع ثوانٍ للحصول على مظهر ثابت يدوم طويلاً.', 1.49, 2.99, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/143.webp?v=1765880027']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('creamy-eyeliner', 'آيلاينر كريمي', 'Creamy Eyeliner', 'يتميز كحل بتركيبته الناعمة وسهولة تطبيقه، مما يمنح العين تحديدًا مثاليًا يدوم طويلاً. صبغته الكثيفة تضمن لونًا غنيًا وواضحًا، وهو مناسب للاستخدام اليومي أو للإطلالات الجريئة. طريقة الاستخدام: ارسمي خطًا دقيقًا على خط الرموش العلوي أو الداخلي للعين، ويمكنك دمجه للحصول على تأثير سموكي ناعم حسب الرغبة.

الدرجات المتوفرة: Brown، Black', 'يتميز كحل بتركيبته الناعمة وسهولة تطبيقه، مما يمنح العين تحديدًا مثاليًا يدوم طويلاً. صبغته الكثيفة تضمن لونًا غنيًا وواضحًا، وهو مناسب للاستخدام اليومي أو للإطلالات الجريئة. طريقة الاستخدام: ارسمي خطًا دقيقًا على خط الرموش العلوي أو الداخلي للعين، ويمكنك دمجه للحصول على تأثير سموكي ناعم حسب الرغبة.

Available shades: Brown, Black', 1.49, 2.99, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/141.webp?v=1765879930','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/142.webp?v=1765879930']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('powder-foundation', 'باودر فاونديشن تغطية عالية', 'High Coverage Powder Foundation', 'باودر من ماس برنسس الذي يزيل اللمعان ويجعل بشرتك تبدو ناعمة كالحرير
 بتركيز ناعم يخفي المسام وينعم بشرتك مما يخلق مظهرًا ناعمًا غير لامع تمتاز بأنها تدوم طويلاً.

الدرجات المتوفرة: 1، 2، 3', 'باودر من ماس برنسس الذي يزيل اللمعان ويجعل بشرتك تبدو ناعمة كالحرير
 بتركيز ناعم يخفي المسام وينعم بشرتك مما يخلق مظهرًا ناعمًا غير لامع تمتاز بأنها تدوم طويلاً.

Available shades: 1, 2, 3', 3.99, 4.49, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/85.jpg?v=1757837275','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/86.jpg?v=1757837465','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/84.jpg?v=1757837265']::text[], 32, true, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-oil', 'زيت شفاه', 'Lip Oil', 'زيت مرطب وملمع الشفاه بتركيبة زيتية غير لزجة يوضع فوق الشفتين الطبيعية أو أحمر الشفاه للحصول على لمسة نهائية لامعة للغاية

الدرجات المتوفرة: Purple، yellow، blue، baby blue، pink، baby pink', 'زيت مرطب وملمع الشفاه بتركيبة زيتية غير لزجة يوضع فوق الشفتين الطبيعية أو أحمر الشفاه للحصول على لمسة نهائية لامعة للغاية

Available shades: Purple, yellow, blue, baby blue, pink, baby pink', 1.99, 2.85, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/10_1ab62060-1b84-470c-ba7e-5276e8f8d950.jpg?v=1757154921','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/11_689db5e8-80a9-44be-ab8c-5d4b44ad5b61.jpg?v=1757154931','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/8_245db79f-a134-47d4-bbef-7e9d539ddc4c.jpg?v=1757154958','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/12_c5cc09d3-4451-470d-8597-a513b04e68e2.jpg?v=1757154975','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/7.jpg?v=1757154991','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/9.jpg?v=1757155004']::text[], 39, true, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('mega-mascara', 'مسكارا ميجا الأصلية', 'Original Mega Mascara', 'احصلي على رموش أطول وأكثر جاذبية مع مسكارة التطويل الأصلية. تمنح تركيبتها الغنية والتقنية المتقدمة طولًا استثنائيًا للرموش دون تكتل، مع فرشاة مصممة لفصل وتحديد كل رمش بدقة.
 طريقة الاستخدام: 
ابدئي من جذور الرموش ومرري الفرشاة بلطف نحو الأطراف بحركات متعرجة لضمان تغطية كاملة. كرري الطبقات حسب الحاجة للحصول على الطول والكثافة المطلوبة.', 'احصلي على رموش أطول وأكثر جاذبية مع مسكارة التطويل الأصلية. تمنح تركيبتها الغنية والتقنية المتقدمة طولًا استثنائيًا للرموش دون تكتل، مع فرشاة مصممة لفصل وتحديد كل رمش بدقة.
 طريقة الاستخدام: 
ابدئي من جذور الرموش ومرري الفرشاة بلطف نحو الأطراف بحركات متعرجة لضمان تغطية كاملة. كرري الطبقات حسب الحاجة للحصول على الطول والكثافة المطلوبة.', 1.99, 3.99, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass-mascara-1.jpg?v=1746276312','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass-mascara.jpg?v=1746276312']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('brow-fection-set', 'مجموعة حواجب: فرشاة مائلة وصبغة', 'Brow-Fection Angled Brush & Dip', 'يقدم لك تجربة متكاملة بتصميم مبتكر يجمع بين بودرة الحواجب والفرشاة المائلة، ليوفر تحديدًا دقيقًا وملئًا طبيعيًا لشكل الحواجب. تركيبته الغنية تمنحك لونًا واضحًا يدوم طويلًا، مع سهولة الدمج لنتيجة مثالية ومتناسقة.
 طريقة الاستخدام يُستخدم الطرف المدمج المائل لتحديد شكل الحواجب أولًا، ثم يُملأ الفراغ باستخدام البودرة المرفقة بحركات خفيفة باتجاه نمو الشعر. يمكن إعادة التطبيق للحصول على كثافة أكبر حسب الرغبة.

الدرجات المتوفرة: Auburn، Chocolate', 'يقدم لك تجربة متكاملة بتصميم مبتكر يجمع بين بودرة الحواجب والفرشاة المائلة، ليوفر تحديدًا دقيقًا وملئًا طبيعيًا لشكل الحواجب. تركيبته الغنية تمنحك لونًا واضحًا يدوم طويلًا، مع سهولة الدمج لنتيجة مثالية ومتناسقة.
 طريقة الاستخدام يُستخدم الطرف المدمج المائل لتحديد شكل الحواجب أولًا، ثم يُملأ الفراغ باستخدام البودرة المرفقة بحركات خفيفة باتجاه نمو الشعر. يمكن إعادة التطبيق للحصول على كثافة أكبر حسب الرغبة.

Available shades: Auburn, Chocolate', 2.99, 3.99, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/CHOCOLATE_aa43915e-0caa-4ef8-b448-3f5abcbba224.jpg?v=1742110126','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/AUBURN.jpg?v=1742110114','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/CHOCOLATE.jpg?v=1742110109']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-plumping-gloss-2', 'جلوس تكبير الشفاه', 'Lip Plumping Gloss', 'جلوس تكبير الشفاه من Mass Princess هو منتج يجمع بين الجاذبية والترطيب، حيث يمنح الشفاه مظهراً ممتلئاً ولامعاً بفضل تركيبته الخاصة المعززة بمكونات مرطبة. يتميز بقوام خفيف وغير لاصق، مما يجعله مثالياً للاستخدام اليومي والمناسبات الخاصة، مع توفير شعور بالراحة والحفاظ على نعومة الشفاه طوال اليوم.
 طريقة الاستخدام 
 للحصول على أفضل النتائج، يُنصح بوضع طبقة رقيقة من الجلوس على شفاه نظيفة وجافة، بدءاً من منتصف الشفاه باتجاه الأطراف. يمكن تكرار العملية للحصول على حجم أكبر وامتلاء أكثر، مع مراعاة توزيع الجلوس بالتساوي للحصول على مظهر جذاب ومتناسق.

الدرجات المتوفرة: 01، 02، 03، 04، 05، 06، 07، 08', 'جلوس تكبير الشفاه من Mass Princess هو منتج يجمع بين الجاذبية والترطيب، حيث يمنح الشفاه مظهراً ممتلئاً ولامعاً بفضل تركيبته الخاصة المعززة بمكونات مرطبة. يتميز بقوام خفيف وغير لاصق، مما يجعله مثالياً للاستخدام اليومي والمناسبات الخاصة، مع توفير شعور بالراحة والحفاظ على نعومة الشفاه طوال اليوم.
 طريقة الاستخدام 
 للحصول على أفضل النتائج، يُنصح بوضع طبقة رقيقة من الجلوس على شفاه نظيفة وجافة، بدءاً من منتصف الشفاه باتجاه الأطراف. يمكن تكرار العملية للحصول على حجم أكبر وامتلاء أكثر، مع مراعاة توزيع الجلوس بالتساوي للحصول على مظهر جذاب ومتناسق.

Available shades: 01, 02, 03, 04, 05, 06, 07, 08', 1.99, 2.99, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesslipplumper2white_015b0bb1-2aec-4488-ac85-0987b14db636.jpg?v=1738570957']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('creamy-blusher', 'بلشر كريمي', 'Creamy Blusher', 'بلشر كريمي من Mass Princess يمنح الخدود مظهراً صحياً وإشراقة طبيعية بفضل تركيبته الناعمة والخفيفة التي تنساب بسهولة على البشرة. يتميز بألوان متعددة تناسب مختلف درجات البشرة، مع إمكانية مزجها للحصول على اللون المثالي. التركيبة الكريمية تساعد على ترطيب الخدود ومنحها ملمساً ناعماً يدوم طوال اليوم، مما يجعله خياراً مثالياً للإطلالات اليومية والمناسبات الخاصة.
 للاستخدام، توضع كمية صغيرة من البلشر على أطراف الأصابع أو باستخدام الفرشاة المدمجة، ثم توزع بلطف على عظمة الخد مع التربيت بخفة حتى يتجانس اللون مع البشرة. يمكن إضافة طبقات أخرى بحسب الرغبة للحصول على درجة اللون المطلوبة. يُفضل تطبيقه بعد كري

الدرجات المتوفرة: 01، 02، 03، 04، 05، 06', 'بلشر كريمي من Mass Princess يمنح الخدود مظهراً صحياً وإشراقة طبيعية بفضل تركيبته الناعمة والخفيفة التي تنساب بسهولة على البشرة. يتميز بألوان متعددة تناسب مختلف درجات البشرة، مع إمكانية مزجها للحصول على اللون المثالي. التركيبة الكريمية تساعد على ترطيب الخدود ومنحها ملمساً ناعماً يدوم طوال اليوم، مما يجعله خياراً مثالياً للإطلالات اليومية والمناسبات الخاصة.
 للاستخدام، توضع كمية صغيرة من البلشر على أطراف الأصابع أو باستخدام الفرشاة المدمجة، ثم توزع بلطف على عظمة الخد مع التربيت بخفة حتى يتجانس اللون مع البشرة. يمكن إضافة طبقات أخرى بحسب الرغبة للحصول على درجة اللون المطلوبة. يُفضل تطبيقه بعد كري

Available shades: 01, 02, 03, 04, 05, 06', 2.5, 3.5, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/fdjbhvfbhjfdbjh.jpg?v=1738570647']::text[], 0, true, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('nail-polish', 'مناكير', 'Nail Polish', 'مناكير من Mass Princess يتميز بألوانه الجذابة وتركيبته طويلة الأمد التي تمنحك لمسة نهائية لامعة ومثالية. سهل التطبيق ويجف بسرعة ليكمل إطلالتك بأناقة.
 طريقة الاستخدام :
قومي بتنظيف أظافرك جيدًا، ثم ضعي طبقة واحدة من المناكير واتركيها تجف. يمكن إضافة طبقة ثانية للحصول على لون أكثر كثافة وثباتًا.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6، 7، 8، 9، 10، 11، 12، 13، 14، 15، 16، 17، 18، 19، 20، 21، 22، 23، 24', 'مناكير من Mass Princess يتميز بألوانه الجذابة وتركيبته طويلة الأمد التي تمنحك لمسة نهائية لامعة ومثالية. سهل التطبيق ويجف بسرعة ليكمل إطلالتك بأناقة.
 طريقة الاستخدام :
قومي بتنظيف أظافرك جيدًا، ثم ضعي طبقة واحدة من المناكير واتركيها تجف. يمكن إضافة طبقة ثانية للحصول على لون أكثر كثافة وثباتًا.

Available shades: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24', 0.99, null, (select id from public.categories where slug='nails'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessnailpolishhite.jpg?v=1736430601','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_001.jpg?v=1736430802','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_002.jpg?v=1736430813','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_003.jpg?v=1736430820','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_004.jpg?v=1736430825','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_005.jpg?v=1736430834','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_006.jpg?v=1736430841','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_007.jpg?v=1736430847','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_008.jpg?v=1736430852','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_009.jpg?v=1736430857','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_010.jpg?v=1736430865','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_011.jpg?v=1736430877','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_012.jpg?v=1736430881','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_014.jpg?v=1736430891','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_015.jpg?v=1736430896','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_016.jpg?v=1736430903','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_017.jpg?v=1736430908','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_018.jpg?v=1736430915','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_019.jpg?v=1736430917','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_020.jpg?v=1736430923','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_021.jpg?v=1736430927','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_022.jpg?v=1736430933','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_023.jpg?v=1736430942','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_nail_polish_024.jpg?v=1736430945']::text[], 0, true, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('matte-lipstick-2', 'روج مطفي', 'Matte Lipstick', 'روج مطفي من Mass Princess يوفر لمسة نهائية أنيقة وجذابة، مع تركيبة خفيفة ومريحة على الشفاه تمنح تغطية كاملة وألوانًا غنية تناسب جميع الإطلالات.
 طريقة الاستخدام :
ابدئي برسم حدود الشفاه باستخدام طرف الروج، ثم قومي بتعبئة اللون على كامل الشفاه. للحصول على نتيجة مثالية، يمكن وضع مرطب شفاه قبل التطبيق لتحضير الشفاه.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6، 7، 8، 9', 'روج مطفي من Mass Princess يوفر لمسة نهائية أنيقة وجذابة، مع تركيبة خفيفة ومريحة على الشفاه تمنح تغطية كاملة وألوانًا غنية تناسب جميع الإطلالات.
 طريقة الاستخدام :
ابدئي برسم حدود الشفاه باستخدام طرف الروج، ثم قومي بتعبئة اللون على كامل الشفاه. للحصول على نتيجة مثالية، يمكن وضع مرطب شفاه قبل التطبيق لتحضير الشفاه.

Available shades: 1, 2, 3, 4, 5, 6, 7, 8, 9', 1.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessmattelipstickwhite.jpg?v=1736426983']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('shiny-lip-gloss-2', 'جلوس لامع', 'Shiny Lip Gloss', 'جلوس لامع من ماس برينسيس يمنح شفتيك مظهرًا مشرقًا وبريقًا جذابًا. يتميز بتركيبة خفيفة وغير لزجة تضيف لمسة ساحرة لأي إطلالة، مع توفير ترطيب يدوم طويلاً.
 طريقة الاستخدام :
ضعيه مباشرة على شفتيك النظيفة والجافة باستخدام الأداة المرفقة. استخدميه بمفرده للحصول على لمعان طبيعي أو فوق أحمر الشفاه لإبراز اللون ولمسة نهائية لامعة.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6، 7', 'جلوس لامع من ماس برينسيس يمنح شفتيك مظهرًا مشرقًا وبريقًا جذابًا. يتميز بتركيبة خفيفة وغير لزجة تضيف لمسة ساحرة لأي إطلالة، مع توفير ترطيب يدوم طويلاً.
 طريقة الاستخدام :
ضعيه مباشرة على شفتيك النظيفة والجافة باستخدام الأداة المرفقة. استخدميه بمفرده للحصول على لمعان طبيعي أو فوق أحمر الشفاه لإبراز اللون ولمسة نهائية لامعة.

Available shades: 1, 2, 3, 4, 5, 6, 7', 1.5, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesslipglossA.jpg?v=1736424177']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('shiny-lip-gloss', 'جلوس لامع', 'Shiny Lip Gloss', 'جلوس لامع من ماس برينسيس يمنح شفتيك مظهرًا مشرقًا وبريقًا جذابًا. يتميز بتركيبة خفيفة وغير لزجة تضيف لمسة ساحرة لأي إطلالة، مع توفير ترطيب يدوم طويلاً.
 طريقة الاستخدام :
ضعيه مباشرة على شفتيك النظيفة والجافة باستخدام الأداة المرفقة. استخدميه بمفرده للحصول على لمعان طبيعي أو فوق أحمر الشفاه لإبراز اللون ولمسة نهائية لامعة.

الدرجات المتوفرة: 1، 2، 3، 4، 5', 'جلوس لامع من ماس برينسيس يمنح شفتيك مظهرًا مشرقًا وبريقًا جذابًا. يتميز بتركيبة خفيفة وغير لزجة تضيف لمسة ساحرة لأي إطلالة، مع توفير ترطيب يدوم طويلاً.
 طريقة الاستخدام :
ضعيه مباشرة على شفتيك النظيفة والجافة باستخدام الأداة المرفقة. استخدميه بمفرده للحصول على لمعان طبيعي أو فوق أحمر الشفاه لإبراز اللون ولمسة نهائية لامعة.

Available shades: 1, 2, 3, 4, 5', 1.5, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesslipglossB.jpg?v=1736423990']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('tinted-lip-balm', 'مرطب شفاه بلمعة', 'Tinted Lip Balm', 'مرطب شفاه بلمعة من ماس برينسيس يقدم ترطيبًا عميقًا ولمسة لامعة تضيف إشراقة طبيعية لشفتيك. غني بالمكونات المغذية التي تحافظ على نعومة الشفاه وتحميها من الجفاف، مما يجعله الاختيار المثالي للإطلالات اليومية أو المناسبة للسهرات.
 طريقة الاستخدام :
ضعيه على شفتيك النظيفة والجافة مباشرة باستخدام الأداة المرفقة. يمكن استخدامه بمفرده للحصول على مظهر طبيعي لامع أو فوق أحمر الشفاه لإضافة لمسة نهائية براقة.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6', 'مرطب شفاه بلمعة من ماس برينسيس يقدم ترطيبًا عميقًا ولمسة لامعة تضيف إشراقة طبيعية لشفتيك. غني بالمكونات المغذية التي تحافظ على نعومة الشفاه وتحميها من الجفاف، مما يجعله الاختيار المثالي للإطلالات اليومية أو المناسبة للسهرات.
 طريقة الاستخدام :
ضعيه على شفتيك النظيفة والجافة مباشرة باستخدام الأداة المرفقة. يمكن استخدامه بمفرده للحصول على مظهر طبيعي لامع أو فوق أحمر الشفاه لإضافة لمسة نهائية براقة.

Available shades: 1, 2, 3, 4, 5, 6', 1.5, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesslippalmwhite.jpg?v=1736423630']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-plumping-gloss', 'جلوس تكبير الشفاه', 'Lip Plumping Gloss', 'جلوس تكبير الشفاه من ماس برينسيس يمنحك شفاه ممتلئة وجذابة بلمسة واحدة. تركيبته الفريدة تحتوي على مكونات مغذية تمنح شفاهك ترطيبًا عميقًا ولمعانًا مميزًا، مع تأثير تكبير طبيعي يعزز جمال شفتيك ويبرز ملامحك. سهل الاستخدام ومثالي لجميع الإطلالات اليومية أو المناسبات الخاصة.
 طريقة الاستخدام :
ضعي طبقة من الجلوس على شفتيك النظيفة والجافة باستخدام الفرشاة المرفقة، ووزعيه بالتساوي. يمكن استخدامه بمفرده أو فوق أحمر الشفاه المفضل لديك للحصول على مظهر لامع وممتلئ.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6، 7، 8', 'جلوس تكبير الشفاه من ماس برينسيس يمنحك شفاه ممتلئة وجذابة بلمسة واحدة. تركيبته الفريدة تحتوي على مكونات مغذية تمنح شفاهك ترطيبًا عميقًا ولمعانًا مميزًا، مع تأثير تكبير طبيعي يعزز جمال شفتيك ويبرز ملامحك. سهل الاستخدام ومثالي لجميع الإطلالات اليومية أو المناسبات الخاصة.
 طريقة الاستخدام :
ضعي طبقة من الجلوس على شفتيك النظيفة والجافة باستخدام الفرشاة المرفقة، ووزعيه بالتساوي. يمكن استخدامه بمفرده أو فوق أحمر الشفاه المفضل لديك للحصول على مظهر لامع وممتلئ.

Available shades: 1, 2, 3, 4, 5, 6, 7, 8', 1.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesslipplumberwhite.jpg?v=1736423450']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('nail-file', 'مبرد أظافر', 'Nail File', 'مبرد الأظافر من ماس برينسيس هو أداة عملية وأنيقة تساعدك في تشكيل أظافرك بسهولة ودقة. مصنوع من مواد عالية الجودة لضمان نعومة الأظافر وتجنب التشقق، مما يجعله مثاليًا للاستخدام اليومي أو أثناء جلسات العناية بالأظافر في المنزل. يوفر لك سطحًا مزدوج الاستخدام لتنعيم الأطراف وختمها، مما يعزز مظهر الأظافر بشكل صحي ومرتب.
 طريقة الاستخدام :
استخدمي المبرد برفق لتشكيل أطراف الأظافر في الاتجاه المطلوب. تجنبي الحركات العشوائية ذهابًا وإيابًا لتفادي ضعف الأظافر.', 'مبرد الأظافر من ماس برينسيس هو أداة عملية وأنيقة تساعدك في تشكيل أظافرك بسهولة ودقة. مصنوع من مواد عالية الجودة لضمان نعومة الأظافر وتجنب التشقق، مما يجعله مثاليًا للاستخدام اليومي أو أثناء جلسات العناية بالأظافر في المنزل. يوفر لك سطحًا مزدوج الاستخدام لتنعيم الأطراف وختمها، مما يعزز مظهر الأظافر بشكل صحي ومرتب.
 طريقة الاستخدام :
استخدمي المبرد برفق لتشكيل أطراف الأظافر في الاتجاه المطلوب. تجنبي الحركات العشوائية ذهابًا وإيابًا لتفادي ضعف الأظافر.', 1.5, null, (select id from public.categories where slug='nails'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessnailfile100.jpg?v=1736422851']::text[], 13, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('contour-stick', 'كونتور ستيك', 'Contour Stick', 'كونتور ستيك من ماس برينسيس هو منتج مبتكر يمنحك ملامح وجه محددة ومتناغمة بسهولة. يتميز بتركيبة كريمية وسهلة الدمج على البشرة، مما يجعله مناسبًا لجميع أنواع البشرة. يتيح لك هذا الكونتور إضافة تظليل طبيعي وواقعي على مناطق الوجه المختلفة مثل عظام الخدين، الفك، والجبهة، مما يعزز جمال ملامحك بشكل ناعم وطبيعي. يأتي بحجم مناسب لسهولة الاستخدام والتطبيق، مما يجعله مثاليًا للحصول على مظهر مُحدد وجذاب طوال اليوم.
 طريقة الاستخدام :
قومي بتطبيق الكونتور على المناطق التي ترغبين في تحديدها، مثل أسفل عظام الخدين وعلى طول خط الفك. امزجيه جيدًا باستخدام فرشاة أو إسفنجة للحصول على مظهر طبيعي ولامع.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6', 'كونتور ستيك من ماس برينسيس هو منتج مبتكر يمنحك ملامح وجه محددة ومتناغمة بسهولة. يتميز بتركيبة كريمية وسهلة الدمج على البشرة، مما يجعله مناسبًا لجميع أنواع البشرة. يتيح لك هذا الكونتور إضافة تظليل طبيعي وواقعي على مناطق الوجه المختلفة مثل عظام الخدين، الفك، والجبهة، مما يعزز جمال ملامحك بشكل ناعم وطبيعي. يأتي بحجم مناسب لسهولة الاستخدام والتطبيق، مما يجعله مثاليًا للحصول على مظهر مُحدد وجذاب طوال اليوم.
 طريقة الاستخدام :
قومي بتطبيق الكونتور على المناطق التي ترغبين في تحديدها، مثل أسفل عظام الخدين وعلى طول خط الفك. امزجيه جيدًا باستخدام فرشاة أو إسفنجة للحصول على مظهر طبيعي ولامع.

Available shades: 1, 2, 3, 4, 5, 6', 1.99, null, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesscontour.jpg?v=1736422542']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('loose-powder', 'لوس باودر', 'Loose Powder', 'بودرة من طبقتين، طبقة مضغوطة وطبقة لوس باودر من ماس برينسيس هي منتج فريد يوفر تغطية مثالية لمكياج خالٍ من العيوب. تحتوي هذه البودرة على طبقة مضغوطة توفر ثباتاً طويلاً ومظهراً طبيعيًا، بينما تمنح الطبقة الثانية من اللوس باودر لمسة نهائية ناعمة خالية من اللمعان، مما يجعلها مثالية للبشرة الدهنية والمختلطة. بفضل تركيبتها الخفيفة، يمكنك استخدامها لتثبيت المكياج أو للانتعاش خلال اليوم دون التأثير على مظهره.
 طريقة الاستخدام :
استخدمي الفرشاة أو الإسفنجة لتوزيع طبقة من البودرة المضغوطة على وجهك، ثم استخدمي طبقة اللوس باودر لإضفاء لمسة نهائية خفيفة ومشرقة. يمكن استخدامها لتثبيت المكياج طوال اليوم.

الدرجات المتوفرة: 1، 2، 3', 'بودرة من طبقتين، طبقة مضغوطة وطبقة لوس باودر من ماس برينسيس هي منتج فريد يوفر تغطية مثالية لمكياج خالٍ من العيوب. تحتوي هذه البودرة على طبقة مضغوطة توفر ثباتاً طويلاً ومظهراً طبيعيًا، بينما تمنح الطبقة الثانية من اللوس باودر لمسة نهائية ناعمة خالية من اللمعان، مما يجعلها مثالية للبشرة الدهنية والمختلطة. بفضل تركيبتها الخفيفة، يمكنك استخدامها لتثبيت المكياج أو للانتعاش خلال اليوم دون التأثير على مظهره.
 طريقة الاستخدام :
استخدمي الفرشاة أو الإسفنجة لتوزيع طبقة من البودرة المضغوطة على وجهك، ثم استخدمي طبقة اللوس باودر لإضفاء لمسة نهائية خفيفة ومشرقة. يمكن استخدامها لتثبيت المكياج طوال اليوم.

Available shades: 1, 2, 3', 3.5, null, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesscompactpowder.jpg?v=1736422308','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesspowder01.jpg?v=1738663315','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesspowder02.jpg?v=1738663315','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesspowder03.jpg?v=1738663315']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-plumping-gloss-3', 'جلوس مكبر شفاه', 'Lip Plumping Gloss', 'منتج مبتكر يمنح شفاهك حجمًا إضافيًا ومظهرًا ممتلئًا بشكل طبيعي. مع تركيبته الغنية، يعمل الجلوس على ترطيب الشفاه وإعطائها لمسة لامعة وجذابة، مع تعزيز شكل الشفاه ليظهر بشكل أكثر امتلاءً.
 طريقة الاستخدام :
ضعي الجلوس على شفاهك باستخدام التطبيق المدمج أو أطراف أصابعك. يمكن استخدامه بمفرده للحصول على لمسة لامعة أو فوق أحمر الشفاه لمزيد من الامتلاء واللمعان.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6، 7، 8', 'منتج مبتكر يمنح شفاهك حجمًا إضافيًا ومظهرًا ممتلئًا بشكل طبيعي. مع تركيبته الغنية، يعمل الجلوس على ترطيب الشفاه وإعطائها لمسة لامعة وجذابة، مع تعزيز شكل الشفاه ليظهر بشكل أكثر امتلاءً.
 طريقة الاستخدام :
ضعي الجلوس على شفاهك باستخدام التطبيق المدمج أو أطراف أصابعك. يمكن استخدامه بمفرده للحصول على لمسة لامعة أو فوق أحمر الشفاه لمزيد من الامتلاء واللمعان.

Available shades: 1, 2, 3, 4, 5, 6, 7, 8', 1.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesslipplumper2white.jpg?v=1736417701']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('pheromone-perfume', 'عطر فرموني', 'Pheromone Perfume', 'عطر فاخر يتميز بمزيج فريد من الروائح المغرية التي تمنحك شعوراً بالثقة والجاذبية. بتركيبته المميزة، يمنحك العطر لمسة من الأنوثة التي تدوم طويلاً، مما يجعله خياراً مثالياً لإطلالة مميزة في أي وقت من اليوم.
 طريقة الاستخدام :
رشي العطر على نقاط النبض مثل المعصمين، خلف الأذنين، وعلى الرقبة للحصول على أفضل تأثير. تجنبي فرك المعصمين بعد الرش لترك العطر يتنفس ويتفاعل مع البشرة.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6', 'عطر فاخر يتميز بمزيج فريد من الروائح المغرية التي تمنحك شعوراً بالثقة والجاذبية. بتركيبته المميزة، يمنحك العطر لمسة من الأنوثة التي تدوم طويلاً، مما يجعله خياراً مثالياً لإطلالة مميزة في أي وقت من اليوم.
 طريقة الاستخدام :
رشي العطر على نقاط النبض مثل المعصمين، خلف الأذنين، وعلى الرقبة للحصول على أفضل تأثير. تجنبي فرك المعصمين بعد الرش لترك العطر يتنفس ويتفاعل مع البشرة.

Available shades: 1, 2, 3, 4, 5, 6', 1.5, null, (select id from public.categories where slug='perfume-tools'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/phermonewhite.jpg?v=1736417478']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('face-primer', 'برايمر', 'Face Primer', 'منتج يعزز من ثبات المكياج ويساعد على تحضير البشرة لتطبيق المكياج بسلاسة. يعمل على تغطية المسام وتنعيم البشرة، مما يجعل المكياج يبدو أكثر سلاسة وطويل الأمد. بفضل تركيبته الغنية، يساهم البرايمر في السيطرة على اللمعان ويمد البشرة بمظهر صحي ومثالي.
 طريقة الاستخدام :
ضعي كمية مناسبة من البرايمر على بشرتك النظيفة بعد ترطيبها. دلكيه برفق على الوجه بحركات دائرية حتى يتم امتصاصه بالكامل، ثم يمكنك تطبيق المكياج على الفور. للحصول على أفضل نتائج، يمكنك استخدامه قبل أي منتج مكياج لضمان ثباته طوال اليوم.', 'منتج يعزز من ثبات المكياج ويساعد على تحضير البشرة لتطبيق المكياج بسلاسة. يعمل على تغطية المسام وتنعيم البشرة، مما يجعل المكياج يبدو أكثر سلاسة وطويل الأمد. بفضل تركيبته الغنية، يساهم البرايمر في السيطرة على اللمعان ويمد البشرة بمظهر صحي ومثالي.
 طريقة الاستخدام :
ضعي كمية مناسبة من البرايمر على بشرتك النظيفة بعد ترطيبها. دلكيه برفق على الوجه بحركات دائرية حتى يتم امتصاصه بالكامل، ثم يمكنك تطبيق المكياج على الفور. للحصول على أفضل نتائج، يمكنك استخدامه قبل أي منتج مكياج لضمان ثباته طوال اليوم.', 2.99, null, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessprimerwhite.jpg?v=1736417346','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprimer1.jpg?v=1738662381','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprimer2.jpg?v=1738662392','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprimer3.jpg?v=1738662398']::text[], 2, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('facial-cleanser', 'منظف بشرة', 'Facial Cleanser', 'منتج مثالي لتنظيف البشرة بعمق وإزالة الشوائب، الأوساخ، والمكياج دون التأثير على توازن البشرة الطبيعي. يحتوي على مكونات لطيفة تمنح بشرتك إشراقة ونضارة مع الحفاظ على ترطيبها. يمنحك هذا المنظف بشرة ناعمة ونظيفة، ويتركها منتعشة ومتجددة بعد كل استخدام.
 طريقة الاستخدام :
ضعي كمية صغيرة من المنظف على بشرة رطبة، ثم قومي بتدليكه بلطف بحركات دائرية لمدة دقيقة أو اثنتين. بعد ذلك، اشطفي وجهك جيدًا بالماء الفاتر وامسحيه بلطف باستخدام منشفة ناعمة. استخدميه يوميًا للحصول على أفضل النتائج.

الدرجات المتوفرة: Water mMelon، Hokkaido Milk، Aloe Vera', 'منتج مثالي لتنظيف البشرة بعمق وإزالة الشوائب، الأوساخ، والمكياج دون التأثير على توازن البشرة الطبيعي. يحتوي على مكونات لطيفة تمنح بشرتك إشراقة ونضارة مع الحفاظ على ترطيبها. يمنحك هذا المنظف بشرة ناعمة ونظيفة، ويتركها منتعشة ومتجددة بعد كل استخدام.
 طريقة الاستخدام :
ضعي كمية صغيرة من المنظف على بشرة رطبة، ثم قومي بتدليكه بلطف بحركات دائرية لمدة دقيقة أو اثنتين. بعد ذلك، اشطفي وجهك جيدًا بالماء الفاتر وامسحيه بلطف باستخدام منشفة ناعمة. استخدميه يوميًا للحصول على أفضل النتائج.

Available shades: Water mMelon, Hokkaido Milk, Aloe Vera', 2.99, null, (select id from public.categories where slug='skincare'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessfacialcleanseraloeverawhite_60a48318-30d8-46fb-bf34-ad1bbb388aa9.jpg?v=1736417189','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessfacialwhippingfoammilkwhite_fcc25914-89a8-4c59-8a09-f527166392b3.jpg?v=1736417189','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessfacialcleanserwatermelonwhite_f178e40f-3dda-4e39-a195-bd5e1106ecf3.jpg?v=1736417189','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessaloeverafreshfacialcleanser2.jpg?v=1738662534','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessaloeverafreshfacialcleanser.jpg?v=1738662534','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessmilkfreshfacialcleanser2.jpg?v=1738662557','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessmilkfreshfacialcleanser.jpg?v=1738662557','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesswatermelonfreshfacialcleanser2.jpg?v=1738663267','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesswatermelonfreshfacialcleanser.jpg?v=1738663266']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('blush-brush', 'فرشاة بلشر', 'Blush Brush', 'فرشاة بلشر من Mass Princess مصممة لتوزيع البلشر بشكل مثالي على البشرة. توفر هذه الفرشاة شعيرات ناعمة وكثيفة تساعد في الحصول على لمسة نهائية خالية من العيوب، مما يضمن لكِ مظهرًا طبيعيًا ومتوازنًا. تتميز بتصميم مريح يتيح لك التحكم السهل في توزيع المنتج لتحقيق مظهر متألق وطبيعي.
 طريقة الاستخدام :
استخدمي الفرشاة لتوزيع البلشر على تفاحتي الخدين أو حسب الشكل الذي تفضلينه. قومي بمزج اللون بلطف على البشرة بحركات دائرية لضمان توزيع مثالي للمنتج.', 'فرشاة بلشر من Mass Princess مصممة لتوزيع البلشر بشكل مثالي على البشرة. توفر هذه الفرشاة شعيرات ناعمة وكثيفة تساعد في الحصول على لمسة نهائية خالية من العيوب، مما يضمن لكِ مظهرًا طبيعيًا ومتوازنًا. تتميز بتصميم مريح يتيح لك التحكم السهل في توزيع المنتج لتحقيق مظهر متألق وطبيعي.
 طريقة الاستخدام :
استخدمي الفرشاة لتوزيع البلشر على تفاحتي الخدين أو حسب الشكل الذي تفضلينه. قومي بمزج اللون بلطف على البشرة بحركات دائرية لضمان توزيع مثالي للمنتج.', 1.99, null, (select id from public.categories where slug='perfume-tools'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/jsdbvjhsdbvjhds.jpg?v=1736416872']::text[], 25, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('cleansing-mousse', 'موس منظف للبشرة', 'Cleansing Mousse', 'موس منظف للبشرة من Mass Princess يُعد خيارًا مثاليًا لتنظيف البشرة بلطف وفعالية. بتركيبته الرغوية الغنية، يُزيل الأوساخ والزيوت الزائدة والشوائب، مما يجعل البشرة نقية ومنتعشة دون أن يؤدي إلى جفافها. يناسب جميع أنواع البشرة ويمنحك إحساسًا بالراحة والانتعاش بعد كل استخدام.
 طريقة الاستخدام :
ضعي كمية صغيرة من الموس على يديكِ، ثم دلكي بلطف على الوجه المبلل بحركات دائرية. اشطفيه جيدًا بالماء الفاتر للحصول على بشرة نظيفة ومنتعشة.', 'موس منظف للبشرة من Mass Princess يُعد خيارًا مثاليًا لتنظيف البشرة بلطف وفعالية. بتركيبته الرغوية الغنية، يُزيل الأوساخ والزيوت الزائدة والشوائب، مما يجعل البشرة نقية ومنتعشة دون أن يؤدي إلى جفافها. يناسب جميع أنواع البشرة ويمنحك إحساسًا بالراحة والانتعاش بعد كل استخدام.
 طريقة الاستخدام :
ضعي كمية صغيرة من الموس على يديكِ، ثم دلكي بلطف على الوجه المبلل بحركات دائرية. اشطفيه جيدًا بالماء الفاتر للحصول على بشرة نظيفة ومنتعشة.', 3.5, null, (select id from public.categories where slug='skincare'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesscleansisngmousse.jpg?v=1736416462','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesscleansingmousse1.jpg?v=1738663221','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesscleansingmousse2.jpg?v=1738663221']::text[], 11, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('eyebrow-fixer', 'مثبت حواجب', 'Eyebrow Fixer', 'يساعد على تثبيت الحواجب طوال اليوم. بتركيبته الخفيفة والقوية، يضفي لمسة نهائية مرتبة ويحافظ على شكل الحواجب بشكل طبيعي دون أن يترك أي تكتلات. يوفر المثبت لمعانًا خفيفًا ويمنع الحواجب من التشويش أو التلاشي، مما يجعله مثاليًا للاستخدام اليومي.
 طريقة الاستخدام :
استخدمي فرشاة المثبت لتمشيط الحواجب بلطف من بداية الحاجب حتى نهايته. كرري التطبيق حسب الحاجة للحصول على التثبيت المطلوب.', 'يساعد على تثبيت الحواجب طوال اليوم. بتركيبته الخفيفة والقوية، يضفي لمسة نهائية مرتبة ويحافظ على شكل الحواجب بشكل طبيعي دون أن يترك أي تكتلات. يوفر المثبت لمعانًا خفيفًا ويمنع الحواجب من التشويش أو التلاشي، مما يجعله مثاليًا للاستخدام اليومي.
 طريقة الاستخدام :
استخدمي فرشاة المثبت لتمشيط الحواجب بلطف من بداية الحاجب حتى نهايته. كرري التطبيق حسب الحاجة للحصول على التثبيت المطلوب.', 1.99, null, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessbrowglowwhite.jpg?v=1736413110','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/eyebrowgluewhite1.jpg?v=1738662128']::text[], 64, true, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('eyebrow-pencil-2', 'قلم حواجب', 'Eyebrow Pencil', 'يوفر لكِ تحديدًا دقيقًا وطبيعيًا لحواجبك. بتركيبته الغنية، يساعد على ملء الفراغات وتحديد شكل الحواجب بشكل مثالي، مما يمنحكِ إطلالة مرتبة وطبيعية. يمتاز القلم بسهولة استخدامه ومرونته، حيث يأتي مع طرف دقيق لرسمة مثالية، مما يجعله مناسبًا لجميع أنواع الحواجب.
 طريقة الاستخدام :
ابدئي بتحديد بداية الحاجب باستخدام الطرف الدقيق للقلم. املي الفراغات بحركات خفيفة، ثم استخدمي الطرف الآخر لتمشيط الحاجب وتوزيع اللون بشكل متساوي للحصول على مظهر طبيعي.', 'يوفر لكِ تحديدًا دقيقًا وطبيعيًا لحواجبك. بتركيبته الغنية، يساعد على ملء الفراغات وتحديد شكل الحواجب بشكل مثالي، مما يمنحكِ إطلالة مرتبة وطبيعية. يمتاز القلم بسهولة استخدامه ومرونته، حيث يأتي مع طرف دقيق لرسمة مثالية، مما يجعله مناسبًا لجميع أنواع الحواجب.
 طريقة الاستخدام :
ابدئي بتحديد بداية الحاجب باستخدام الطرف الدقيق للقلم. املي الفراغات بحركات خفيفة، ثم استخدمي الطرف الآخر لتمشيط الحاجب وتوزيع اللون بشكل متساوي للحصول على مظهر طبيعي.', 1.99, null, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_brow_blade.jpg?v=1736412979','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessbrowblade2.jpg?v=1738663691','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/dfxgchvjbk.jpg?v=1738663803']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('eyebrow-pencil-3', 'قلم حواجب', 'Eyebrow Pencil', 'يوفر لكِ تحديدًا دقيقًا وطبيعيًا لحواجبك. بتركيبته الغنية، يساعد على ملء الفراغات وتحديد شكل الحواجب بشكل مثالي، مما يمنحكِ إطلالة مرتبة وطبيعية. يمتاز القلم بسهولة استخدامه ومرونته، حيث يأتي مع طرف دقيق لرسمة مثالية، مما يجعله مناسبًا لجميع أنواع الحواجب.
 طريقة الاستخدام :
ابدئي بتحديد بداية الحاجب باستخدام الطرف الدقيق للقلم. املي الفراغات بحركات خفيفة، ثم استخدمي الطرف الآخر لتمشيط الحاجب وتوزيع اللون بشكل متساوي للحصول على مظهر طبيعي.

الدرجات المتوفرة: Brown، Dark Brown', 'يوفر لكِ تحديدًا دقيقًا وطبيعيًا لحواجبك. بتركيبته الغنية، يساعد على ملء الفراغات وتحديد شكل الحواجب بشكل مثالي، مما يمنحكِ إطلالة مرتبة وطبيعية. يمتاز القلم بسهولة استخدامه ومرونته، حيث يأتي مع طرف دقيق لرسمة مثالية، مما يجعله مناسبًا لجميع أنواع الحواجب.
 طريقة الاستخدام :
ابدئي بتحديد بداية الحاجب باستخدام الطرف الدقيق للقلم. املي الفراغات بحركات خفيفة، ثم استخدمي الطرف الآخر لتمشيط الحاجب وتوزيع اللون بشكل متساوي للحصول على مظهر طبيعي.

Available shades: Brown, Dark Brown', 1.99, null, (select id from public.categories where slug='eyes-brows'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesseyebrow02.jpg?v=1736412789','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesseyebrow01.jpg?v=1736412789','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_eyebrow_01.jpg?v=1736412897','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_eyebrow_02.jpg?v=1736412901']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('blusher', 'بلشر', 'Blusher', 'منتج مثالي للحصول على لمسة نهائية طبيعية ومشرقة لبشرتك. يتميز بتنسيق مريح مع فرشاة مدمجة لتسهيل التطبيق والمزج بشكل دقيق وسلس. يضمن لك هذا المنتج توزيع اللون بشكل متساوي للحصول على إشراقة جميلة تدوم طوال اليوم.
  طريقة الاستخدام
 ، ضعي كمية صغيرة من البلشر على الفرشاة وامزجيه بلطف على خدودك للحصول على لمسة من اللون الطبيعي الذي يعزز جمال بشرتك.

الدرجات المتوفرة: 1، 2، 3، 4، 5، 6', 'منتج مثالي للحصول على لمسة نهائية طبيعية ومشرقة لبشرتك. يتميز بتنسيق مريح مع فرشاة مدمجة لتسهيل التطبيق والمزج بشكل دقيق وسلس. يضمن لك هذا المنتج توزيع اللون بشكل متساوي للحصول على إشراقة جميلة تدوم طوال اليوم.
  طريقة الاستخدام
 ، ضعي كمية صغيرة من البلشر على الفرشاة وامزجيه بلطف على خدودك للحصول على لمسة من اللون الطبيعي الذي يعزز جمال بشرتك.

Available shades: 1, 2, 3, 4, 5, 6', 2.99, null, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massblusher3white.jpg?v=1736410077','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessblusherwithbrush.jpg?v=1738663929']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('hand-cream-set', 'مجموعة كريم اليدين', 'Hand Cream Set', 'تحتوي على كريمات مرطبة وغنية بالمكونات التي تساعد على تغذية البشرة وحمايتها من الجفاف. تركيبة هذه الكريمات تعمل على توفير ترطيب طويل الأمد وتحسن مظهر البشرة لتظل ناعمة ومشرقة طوال اليوم.
  للحصول على أفضل النتائج، يُنصح باستخدام الكريم بعد غسل اليدين أو في أي وقت تشعرين فيه بجفاف أو احتياج لترطيب إضافي. قومي بتوزيع كمية مناسبة على يديكِ ودلكي بلطف حتى يمتص بالكامل.', 'تحتوي على كريمات مرطبة وغنية بالمكونات التي تساعد على تغذية البشرة وحمايتها من الجفاف. تركيبة هذه الكريمات تعمل على توفير ترطيب طويل الأمد وتحسن مظهر البشرة لتظل ناعمة ومشرقة طوال اليوم.
  للحصول على أفضل النتائج، يُنصح باستخدام الكريم بعد غسل اليدين أو في أي وقت تشعرين فيه بجفاف أو احتياج لترطيب إضافي. قومي بتوزيع كمية مناسبة على يديكِ ودلكي بلطف حتى يمتص بالكامل.', 1.99, null, (select id from public.categories where slug='skincare'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/handcreamwhite.jpg?v=1736409902','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesshandcream5x130ml2.jpg?v=1738663574','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesshandcream5x130ml1.jpg?v=1738663574']::text[], 6, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('matte-lipstick', 'روج مطفي', 'Matte Lipstick', 'روج مطفي يضفي على شفتيك لمسة أنيقة ودائمة طوال اليوم. يتميز بتركيبة خفيفة توفر لونًا غنيًا مع لمسة مطفية جميلة، مما يمنحك مظهرًا جذابًا دون أن يسبب جفافًا. 
 طريقة الاستخدام:
 ضعي الروج مباشرة على شفتيك باستخدام الطرف المدبب ليتناسب مع شكل الشفاه، وامزجيه للحصول على إطلالة طبيعية وأنيقة.

الدرجات المتوفرة: 01، 02، 03، 04، 05، 06، 07، 08، 09', 'روج مطفي يضفي على شفتيك لمسة أنيقة ودائمة طوال اليوم. يتميز بتركيبة خفيفة توفر لونًا غنيًا مع لمسة مطفية جميلة، مما يمنحك مظهرًا جذابًا دون أن يسبب جفافًا. 
 طريقة الاستخدام:
 ضعي الروج مباشرة على شفتيك باستخدام الطرف المدبب ليتناسب مع شكل الشفاه، وامزجيه للحصول على إطلالة طبيعية وأنيقة.

Available shades: 01, 02, 03, 04, 05, 06, 07, 08, 09', 1.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/ffffff.jpg?v=1736255453']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('matte-gloss-set', 'طقم جلوس مطفي', 'Matte Gloss Set', 'أطلقي جمال شفاهك بلمسة راقية! 
طقم الروج المطفي مصمم ليضفي على شفاهك لونًا غنيًا ومظهرًا مخمليًا يدوم طوال اليوم. بفضل التركيبة الكريمية ذات التغطية العالية، ستحصلين على إطلالة جذابة وثابتة دون تكتل أو جفاف، مما يجعلها مثالية للإطلالات اليومية والمناسبات الخاصة.
 طريقة الاستخدام: 
ابدئي بتحديد شفتيك باستخدام قلم تحديد لتجنب التلطخ. ثم قومي بتطبيق الروج المطفي بدءًا من منتصف الشفاه وانتقلي بلطف نحو الزوايا. يمكنك دمجه بأطراف أصابعك أو تركه ليجف للحصول على لمسة نهائية أنيقة تدوم طويلاً.

الدرجات المتوفرة: Matte A، Matte B', 'أطلقي جمال شفاهك بلمسة راقية! 
طقم الروج المطفي مصمم ليضفي على شفاهك لونًا غنيًا ومظهرًا مخمليًا يدوم طوال اليوم. بفضل التركيبة الكريمية ذات التغطية العالية، ستحصلين على إطلالة جذابة وثابتة دون تكتل أو جفاف، مما يجعلها مثالية للإطلالات اليومية والمناسبات الخاصة.
 طريقة الاستخدام: 
ابدئي بتحديد شفتيك باستخدام قلم تحديد لتجنب التلطخ. ثم قومي بتطبيق الروج المطفي بدءًا من منتصف الشفاه وانتقلي بلطف نحو الزوايا. يمكنك دمجه بأطراف أصابعك أو تركه ليجف للحصول على لمسة نهائية أنيقة تدوم طويلاً.

Available shades: Matte A, Matte B', 4.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesslipglossmatteA.jpg?v=1736252725','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesslipglossmatteB.jpg?v=1736252725','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_lipgloss_matte_A.jpg?v=1736252860','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_lipgloss_matte_B.jpg?v=1736252868']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('blusher-2', 'بلشر', 'Blusher', 'بتركيبة ناعمة وبملمس مخملي خفيف ويندمج بسهولة على البشرة يوفر لك بشرة ناعمة وحريرية.

الدرجات المتوفرة: 01، 02، 03، 04', 'بتركيبة ناعمة وبملمس مخملي خفيف ويندمج بسهولة على البشرة يوفر لك بشرة ناعمة وحريرية.

Available shades: 01, 02, 03, 04', 2.5, null, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/68485C1A-70CA-4C27-AC9A-7F921A2B764A.jpg?v=1732369957','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_blusher_01.jpg?v=1736424817','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_blusher_02.jpg?v=1736424824','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_blusher_03.jpg?v=1736424830','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princess_blusher_04.jpg?v=1736424834','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessblusher.jpg?v=1738663838']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('makeup-setting-spray', 'مثبت مكياج', 'Makeup Setting Spray', 'بخاخ مثبت مكياج فكس بلس يحافظ على مكياجك ثابت طوال اليوم ويمنحه الإنتعاش كما يعمل على ترطيب وتنشيط بشرة الوجه المتعبة', 'بخاخ مثبت مكياج فكس بلس يحافظ على مكياجك ثابت طوال اليوم ويمنحه الإنتعاش كما يعمل على ترطيب وتنشيط بشرة الوجه المتعبة', 3.99, 5.39, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/124980B5-F2AF-4EC2-997C-DC5A60079E79.jpg?v=1727202845','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessfixingspray.jpg?v=1738663985']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-cheek-tint', 'تنت شفاه وخدود', 'Lip & Cheek Tint', 'تنت أحمر متوهج للشفاه والخدود من ماركة ماس هو أجمل تورد طبيعي يمكنكِ الحصول عليه

الدرجات المتوفرة: 01، 02', 'تنت أحمر متوهج للشفاه والخدود من ماركة ماس هو أجمل تورد طبيعي يمكنكِ الحصول عليه

Available shades: 01, 02', 1.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/3A7A75CF-3CE6-49E9-8962-C91F140DA43A.jpg?v=1726206137','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/9B090BCD-FD92-479C-87AE-A15657C1EF03.jpg?v=1726206137','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/masstintred1.jpg?v=1738663162','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/masstintred2.jpg?v=1738663163']::text[], 0, false, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('foundation', 'فاونديشن', 'Foundation', 'فاونديشن بثبات فائق يدوم طويلاً وبذات الوقت يسمح لها بالتنفس طيلة اليوم
 يمنحكِ لمسة نهائية ذات مظهر طبيعي ويوحد لون البشرة بطريقة صحيحة

الدرجات المتوفرة: 1، 2، 3، 4', 'فاونديشن بثبات فائق يدوم طويلاً وبذات الوقت يسمح لها بالتنفس طيلة اليوم
 يمنحكِ لمسة نهائية ذات مظهر طبيعي ويوحد لون البشرة بطريقة صحيحة

Available shades: 1, 2, 3, 4', 3.5, null, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/IMG-20240507-WA0035.jpg?v=1715109062','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princesss_foundation_01.jpg?v=1736587745','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princesss_foundation_02.jpg?v=1736587747','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princesss_foundation_03.jpg?v=1736587751','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass_princesss_foundation_04.jpg?v=1736587754','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincessfoundation.jpg?v=1738663633']::text[], 0, false, false);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('full-cover-concealer', 'كونسيلر تغطية كاملة', 'Full Cover Concealer', 'كونسيلر بقوام كريمي مناسب للإستخدام اليومي يعتبر بمثابة المنقذ لإخفاء عيوب البشرة ومظهر ارهاقها.

الدرجات المتوفرة: 1، 2، 3، 4', 'كونسيلر بقوام كريمي مناسب للإستخدام اليومي يعتبر بمثابة المنقذ لإخفاء عيوب البشرة ومظهر ارهاقها.

Available shades: 1, 2, 3, 4', 3.99, null, (select id from public.categories where slug='face'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass-_concealer_web.jpg?v=1710619893','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/mass-_concealer_web_2.jpg?v=1710619892','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/IMG-20240316-WA0028.jpg?v=1710619891','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/IMG-20240316-WA0038.jpg?v=1710619890','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/IMG-20240316-WA0039.jpg?v=1710619890']::text[], 0, true, true);
insert into public.products (slug, name_ar, name_en, description_ar, description_en, price, compare_at_price, category_id, images, stock, is_featured, is_active) values ('lip-plumping-gloss-4', 'جلوس تكبير الشفاه', 'Lip Plumping Gloss', 'جلوس تكبير الشفاه من ماس برينسيس يتميز بتركيبة مبتكرة تمنح شفتيك مظهرًا ممتلئًا وجذابًا بشكل فوري، مع لمسة لامعة تزيد من جاذبيتك. يحتوي على مكونات مغذية تحافظ على ترطيب الشفاه ونعومتها.
 طريقة الاستخدام :
ضعيه على شفتيك النظيفة والجافة باستخدام الفرشاة المرفقة. استخدميه بمفرده للحصول على تأثير تكبير طبيعي أو فوق أحمر الشفاه لإضافة لمعان وحجم إضافي.

الدرجات المتوفرة: A1، A2، A3، A4، A5، A6، A7، A8', 'جلوس تكبير الشفاه من ماس برينسيس يتميز بتركيبة مبتكرة تمنح شفتيك مظهرًا ممتلئًا وجذابًا بشكل فوري، مع لمسة لامعة تزيد من جاذبيتك. يحتوي على مكونات مغذية تحافظ على ترطيب الشفاه ونعومتها.
 طريقة الاستخدام :
ضعيه على شفتيك النظيفة والجافة باستخدام الفرشاة المرفقة. استخدميه بمفرده للحصول على تأثير تكبير طبيعي أو فوق أحمر الشفاه لإضافة لمعان وحجم إضافي.

Available shades: A1, A2, A3, A4, A5, A6, A7, A8', 1.99, null, (select id from public.categories where slug='lips'), array['https://cdn.shopify.com/s/files/1/0681/6117/5842/files/IMG-20240310-WA0023.jpg?v=1710066237','https://cdn.shopify.com/s/files/1/0681/6117/5842/files/massprincesslipplumber.jpg?v=1738664077']::text[], 0, false, true);