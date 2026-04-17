#!/bin/bash
set -e

echo "========================================="
echo "OpenWrt 官方版 DIY 脚本 2"
echo "========================================="

# ---------- 1. 设置默认语言 ----------
if [ -f "feeds/luci/modules/luci-base/root/etc/config/luci" ]; then
    sed -i "s/option lang auto/option lang zh_cn/g" feeds/luci/modules/luci-base/root/etc/config/luci
    echo "✅ 默认语言已设置为简体中文"
fi

# ---------- 2. 设置默认主题 ----------
if [ -f "feeds/luci/collections/luci/Makefile" ]; then
    sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
    echo "✅ 默认主题已设置为 Argon"
fi

echo "✅ diy2.sh 执行完成"
