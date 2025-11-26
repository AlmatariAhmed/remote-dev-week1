#!/usr/bin/env bash
# هذا السطر (shebang) يخبر النظام: "شغّل هذا الملف باستخدام bash"

# خروج من السكربت فورًا إذا حدث أي خطأ
set -e

# 1. تثبيت جميع الحزم المطلوبة من requirements.txt
pip install -r requirements.txt

# 2. جمع جميع الملفات الثابتة (CSS, JS, صور) في مجلد واحد
# هذا ضروري لأن Django لا يخدم الملفات الثابتة تلقائيًا في الوضع الإنتاجي
python manage.py collectstatic --noinput

# 3. تطبيق تحديثات قاعدة البيانات (إنشاء الجداول، إلخ)
python manage.py migrate

#!/usr/bin/env bash
