════════════════════════════════════════════════════════════════════
  AurPay — ملف التصليحات والإضافات (تحديث 2026-09-27)
════════════════════════════════════════════════════════════════════

هذا المجلد يحتوي على كل الملفات المعدّلة خلال آخر جولتين:

  الجولة 1 (تصليحات):
  ├─ تصليح المايك (البالصوت) بشات البوت — صار يشتغل على كل المتصفحات
  ├─ تغيير الاسم الانكليزي UrPay → AurPay بكل الواجهة
  └─ لوقو جديد (حرف A + سهم ذهبي + عملة) يناسب الدفع والاسم

  الجولة 2 (إضافات جديدة):
  ├─ 5 مفاتيح Groq بالـ env مع تبديل تلقائي فوري عند انتهاء حد التوكنات
  ├─ ذاكرة قوية للمودل (يذكر المحادثات القديمة بعد 40+ رسالة)
  ├─ تقليل صرف التوكنات (reasoning_effort + ضغط الرسائل + سقف أقصر)
  └─ نقطة /api/agent/usage لمراقبة صرف التوكنات لكل مفتاح

────────────────────────────────────────────────────────────────────
  طريقة التركيب — نسخ وبس
────────────────────────────────────────────────────────────────────
هيكل المجلد مطابق لهيكل المشروع بالضبط. انسخ محتويات هذا المجلد
فوق مجلد المشروع عندك (Copy → Paste → Replace all).

  aurpay-fixes/start.bat                          →  start.bat              (جذر المشروع)
  aurpay-fixes/README.md                          →  README.md              (جذر المشروع)
  aurpay-fixes/.env.example                       →  خذه كمرجع لملف .env عندك (لا تنسخه فوق ملف .env الموجود إلا إذا تريد البدء من قالب نظيف)
  aurpay-fixes/public/logo.svg                    →  public/logo.svg
  aurpay-fixes/src/app/layout.tsx                 →  src/app/layout.tsx
  aurpay-fixes/src/app/globals.css                →  src/app/globals.css
  aurpay-fixes/src/app/icon.svg                   →  src/app/icon.svg
  aurpay-fixes/src/app/api/[...path]/route.ts     →  src/app/api/[...path]/route.ts
  aurpay-fixes/scripts/fetch-fonts.mjs            →  scripts/fetch-fonts.mjs
  aurpay-fixes/src/components/urpay/logo.tsx      →  src/components/urpay/logo.tsx
  aurpay-fixes/src/components/urpay/parts.tsx     →  src/components/urpay/parts.tsx
  aurpay-fixes/src/components/urpay/qr-card.tsx   →  src/components/urpay/qr-card.tsx
  aurpay-fixes/src/lib/urpay.ts                   →  src/lib/urpay.ts          (تصليح المايك)
  aurpay-fixes/src/lib/receipt-print.ts           →  src/lib/receipt-print.ts
  aurpay-fixes/src/lib/dict/landing.ts            →  src/lib/dict/landing.ts
  aurpay-fixes/src/lib/dict/auth.ts               →  src/lib/dict/auth.ts
  aurpay-fixes/src/lib/dict/dashboard.ts          →  src/lib/dict/dashboard.ts
  aurpay-fixes/src/lib/dict/misc.ts               →  src/lib/dict/misc.ts
  aurpay-fixes/mini-services/urpay-backend/app/config.py        →  نفس المسار
  aurpay-fixes/mini-services/urpay-backend/app/main.py          →  نفس المسار
  aurpay-fixes/mini-services/urpay-backend/app/models.py        →  نفس المسار
  aurpay-fixes/mini-services/urpay-backend/app/constants.py     →  نفس المسار
  aurpay-fixes/mini-services/urpay-backend/app/ops.py           →  نفس المسار (ملف جديد)
  aurpay-fixes/mini-services/urpay-backend/app/agent/providers.py   →  نفس المسار (تدوير المفاتيح)
  aurpay-fixes/mini-services/urpay-backend/app/agent/engine.py       →  نفس المسار (الذاكرة + توفير التوكنات)
  aurpay-fixes/mini-services/urpay-backend/app/agent/tools.py        →  نفس المسار (البحث الذكي عن المستلم)
  aurpay-fixes/mini-services/urpay-backend/app/routers/agent.py      →  نفس المسار (الصوت + usage)
  aurpay-fixes/mini-services/urpay-backend/app/routers/wallet.py     →  نفس المسار

ملاحظة: ملفات engine.py و providers.py و config.py و routers/agent.py
تحتوي على كل التصليحات السابقة مجتمعة (البحث الذكي عن زينب + المايك
+ الاسم الجديد) — فنسخها فوق النسخ القديمة آمن تمامًا.

بعد النسخ: اوقف الخدمات وشغل start.bat من جديد.

────────────────────────────────────────────────────────────────────
  إضافة المفاتيح الخمسة (الأهم)
────────────────────────────────────────────────────────────────────
افتح ملف .env بجذر المشروع وحط مفاتيحك (شيل #):

  GROQ_API_KEY_1=gsk_...
  GROQ_API_KEY_2=gsk_...
  GROQ_API_KEY_3=gsk_...
  GROQ_API_KEY_4=gsk_...
  GROQ_API_KEY_5=gsk_...

تقدر تحط أقل من 5 (حتى مفتاح واحد يشتغل بالطريقة القديمة
GROQ_API_KEY=gsk_... أو بالسطر المجمع GROQ_API_KEYS=k1,k2,...).

شلون يشتغل التبديل؟
• لحال ما ينتهي حد التوكنات بالدقيقة لمفتاح (يرجع 429)، النظام
  يحطه بفترة تهدئة قصيرة (حسب رأس الرد من Groq، عادة دقيقة)
  ويرسل الطلب فورًا بالمفتاح الثاني — المستخدم ما ينتظر أبدًا.
• إذا كل المفاتيح خلصت بنفس اللحظة، يرجع تلقائيًا لجسر z-ai
  (الطبقة البديلة) وما يوقف الشات.
• بعد ما تنتهي فترة التهدية يرجع المفتاح للخدمة لحاله.

متابعة الصرف: بعد تسجيل الدخول افتح بالنهاية
  GET /api/agent/usage
يرجع لكل مفتاح: مقنّع (آخر 6 حروف) + متوفر أو بالتهدئة + عدد النداءات
+ توكنات الإدخال والإخراج. (بالنظام الحالي يجي بالمتصفح داخل الجلسة).

────────────────────────────────────────────────────────────────────
  الذاكرة القوية للمودل
────────────────────────────────────────────────────────────────────
• آخر 12 رسالة تنرسل كاملة (word-for-word) — تفاصيل دقيقة.
• كل الرسائل الأقدم (حتى 48 رسالة) تنضغط بخلاصة «ذاكرة طويلة المدى»
  بأسطر قصيرة — المودل يذكر الأسماء والمبالغ والطلبات القديمة
  بسعر توكنات أقل بكثير من إرسالها كاملة.
• انضبط ترتيب الرسائل (كانت تنرسل مقلوبة بالجلسات الطويلة!) وانحذف
  تكرار رسالة المستخدم الأخيرة (كانت تنرسل مرتين بكل طلب).

────────────────────────────────────────────────────────────────────
  توفير التوكنات — شنو انسوّى بالضبط
────────────────────────────────────────────────────────────────────
1. reasoning_effort="low" لموديل gpt-oss — أكبر مصدر صرف خفي
   (توكنات التفكير الداخلي) صار بالحد الأدنى.
2. سقف الرد max_tokens من 1200 → 700 (الردود 2-5 جمل أصلاً).
3. نتائج الأدوات تنقص عند 900 حرف بدل 1500.
4. الرسائل القديمة تنضغط (700 حرف للمساعد / 400 للمستخدم).
5. حذف تكرار رسالة المستخدم الحالية (توفير مباشر بكل طلب).
6. حد جولات الأدوات من 6 → 5.
7. تتبع دقيق للصرف بكل نداء (باللوق + /api/agent/usage).

النتيجة: طلب الشات الواحد يصرف توكنات أقل بشكل ملموس، ومع 5
مفاتيح بالتدوير تصير الطاقة الإجمالية ≈ 5 أضعاف حد الدقيقة الواحدة.

════════════════════════════════════════════════════════════════════
  للمعلومة: يوجد أيضًا AurPay.zip بنفس مجلد download — نسخة كاملة
  وجاهزة من المشروع بكل هذي التحديثات (لو تفضل تبدأ من نسخة نظيفة).
════════════════════════════════════════════════════════════════════
