#!/bin/bash
set -e

echo "========================================="
echo "OpenWrt 官方版 DIY 脚本 2"
echo "========================================="

# 方法1：修改配置文件
if [ -f "feeds/luci/modules/luci-base/root/etc/config/luci" ]; then
    sed -i "s/option lang auto/option lang zh_cn/g" feeds/luci/modules/luci-base/root/etc/config/luci
    echo "✅ 默认语言已设置为简体中文"
fi

# 方法2：创建默认配置（更可靠，避免 here-document 语法问题）
mkdir -p files/etc/config
{
    echo "config core main"
    echo "    option lang zh_cn"
    echo "    option mediaurlbase /luci-static/argon"
    echo "    option resourcebase /luci-static/resources"
} > files/etc/config/luci
echo "✅ 强制设置默认语言和主题"

if [ -f "feeds/luci/collections/luci/Makefile" ]; then
    sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
    echo "✅ 默认主题已设置为 Argon"
fi


# ---------- 5. 清理 Go 模块缓存 ----------
echo "🗑️ 清理 Go 模块缓存..."
rm -rf dl/go-mod-cache 2>/dev/null || true
echo "✅ Go 缓存已清理"

# ---------- 6. 更新 Golang 版本 ----------
echo "📦 更新 Golang..."
rm -rf feeds/packages/lang/golang
rm -rf package/feeds/packages/golang
git clone --depth 1 https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
echo "✅ Golang 已更新至 22.x"

echo "✅ diy2.sh 执行完成"
