#!/data/data/com.termux/files/usr/bin/bash

echo "====================================="
echo "   Linux Terminal - Starting Ubuntu"
echo "====================================="

# تثبيت proot-distro
if ! command -v proot-distro &> /dev/null; then
    echo "📦 Installing proot-distro..."
    pkg install proot-distro -y
fi

# تثبيت Ubuntu
if ! proot-distro list | grep -q "ubuntu"; then
    echo "📦 Installing Ubuntu (first time, please wait)..."
    proot-distro install ubuntu
fi

# تشغيل Ubuntu
echo "🚀 Starting Ubuntu Linux..."
echo "Type 'exit' to return"
echo "====================================="
proot-distro login ubuntu
