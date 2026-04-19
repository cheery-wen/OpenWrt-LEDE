#!/bin/bash
set -e

echo "========================================="
echo "OpenWrt 官方版 DIY 脚本 2"
echo "========================================="




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
