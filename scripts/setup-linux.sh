#!/bin/bash

# هذا السكربت سيثبت proot-distro ويجهز Ubuntu لأول مرة

echo "🔧 جاري تهيئة بيئة Linux داخل Termux..."

# 1. تحديث الحزم وتثبيت proot-distro
pkg update -y
pkg install proot-distro -y

# 2. تثبيت Ubuntu (إذا لم يكن مثبتاً)
if ! proot-distro list | grep -q "ubuntu"; then
    echo "📦 جاري تثبيت Ubuntu، يرجى الانتظار..."
    proot-distro install ubuntu
fi

# 3. إضافة أمر الدخول التلقائي إلى .bashrc (للمرة القادمة)
if ! grep -q "proot-distro login ubuntu" ~/.bashrc; then
    echo "⚙️ إعداد الدخول التلقائي لجلسات Termux القادمة..."
    echo "proot-distro login ubuntu" >> ~/.bashrc
    echo "echo '🐧 تم تشغيل Ubuntu تلقائياً'" >> ~/.bashrc
fi

echo "✅ تم التهيئة بنجاح!"
echo "💡 أعد تشغيل Termux أو اكتب 'proot-distro login ubuntu' للدخول إلى Ubuntu"
