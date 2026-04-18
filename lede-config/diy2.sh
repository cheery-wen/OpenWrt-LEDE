#!/bin/bash
set -e

echo "========================================="
echo "LEDE DIY 脚本 2"
echo "========================================="

if [ -f "feeds/luci/collections/luci/Makefile" ]; then
    sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
    echo "✅ 默认主题已设置为 Argon"
fi

echo "✅ diy2.sh 执行完成"
