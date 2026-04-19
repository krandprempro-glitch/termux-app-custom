#!/bin/bash

echo "🔧 تجهيز بيئة Alpine Linux داخل التطبيق..."

# تثبيت الأداة الأساسية
pkg update -y
pkg install proot-distro -y

# تثبيت Alpine Linux (خفيف جداً)
if ! proot-distro list | grep -q "alpine"; then
    echo "📦 جاري تثبيت Alpine Linux..."
    proot-distro install alpine
fi

# إضافة أمر التشغيل التلقائي لـ Alpine
if ! grep -q "proot-distro login alpine" ~/.bashrc; then
    echo "⚙️ إعداد التشغيل التلقائي..."
    echo "echo '🐧 تشغيل Alpine Linux...' && proot-distro login alpine" >> ~/.bashrc
fi

echo "✅ تم التهيئة! أعد تشغيل التطبيق أو اكتب 'proot-distro login alpine'"
