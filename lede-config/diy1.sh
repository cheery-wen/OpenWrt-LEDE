#!/bin/bash
set -e

echo "========================================="
echo "LEDE DIY 脚本 1"
echo "========================================="

# ---------- 1. 修改默认 IP ----------
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
echo "✅ IP 已修改为 192.168.5.1"

# ---------- 2. 修改内核版本为 6.12 ----------
sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.12/g' ./target/linux/x86/Makefile
echo "✅ 内核版本已修改为 6.12"

# ---------- 3. 清除 LEDE 默认密码 ----------
if [ -f "package/lean/default-settings/files/zzz-default-settings" ]; then
    sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings
    echo "✅ LEDE 默认密码已清除"
fi
if [ -f "package/base-files/files/etc/shadow" ]; then
    sed -i 's/root:[^:]*:/root::/g' package/base-files/files/etc/shadow
fi

# ---------- 4. 修改主机名 ----------
if [ -f "package/lean/default-settings/files/zzz-default-settings" ]; then
    sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt'' package/lean/default-settings/files/zzz-default-settings
    echo "✅ 主机名已修改为 OpenWrt"
fi

# ---------- 5. 自定义版本显示 ----------
if [ -f "package/lean/default-settings/files/zzz-default-settings" ]; then
    sed -i "s/LEDE /OpenWrt ($(TZ=UTC-8 date "+%Y.%m.%d")) compiled by cheery/g" package/lean/default-settings/files/zzz-default-settings
    echo "✅ 版本信息已更新（compiled by cheery）"
fi

# ---------- 6. 清理 Go 模块缓存 ----------
echo "🗑️ 清理 Go 模块缓存..."
rm -rf dl/go-mod-cache 2>/dev/null || true
echo "✅ Go 缓存已清理"

# ---------- 7. 更新 Golang 版本 ----------
echo "📦 更新 Golang..."
rm -rf feeds/packages/lang/golang
git clone --depth 1 https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
echo "✅ Golang 已更新"

# ---------- 8. 删除 LEDE 自带的插件 ----------
echo "🗑️ 删除 LEDE 自带的插件..."
rm -rf feeds/luci/themes/luci-theme-argon 2>/dev/null || true
rm -rf package/lean/luci-theme-argon 2>/dev/null || true
rm -rf package/feeds/luci/luci-theme-argon 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-argon-config 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-passwall 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-lucky 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-poweroff 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-ramfree 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-control-webrestriction 2>/dev/null || true
rm -rf package/lean/luci-app-passwall 2>/dev/null || true
rm -rf package/lean/luci-app-ssr-plus 2>/dev/null || true
rm -rf feeds/packages/net/lucky 2>/dev/null || true
rm -rf package/feeds/packages/lucky 2>/dev/null || true
echo "✅ LEDE 自带插件清理完成"

# ---------- 9. 添加第三方插件 ----------
echo "📦 添加第三方插件..."

# Argon 主题与配置
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
echo "✅ Argon 主题及配置已添加"

# Lienol 仓库插件
git clone --depth 1 --filter=blob:none --sparse https://github.com/Lienol/openwrt-package.git package/lienol-packages
cd package/lienol-packages
git sparse-checkout set luci-app-control-webrestriction luci-app-ramfree
cd ../..
echo "✅ 访问限制、内存释放已添加"

# 关机按钮
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff
echo "✅ 关机按钮已添加"

# Lucky 大吉
git clone --depth 1 https://github.com/gdy666/luci-app-lucky.git package/luci-app-lucky
echo "✅ Lucky 已添加"

# PassWall 依赖及主程序
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/openwrt-passwall-packages
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall.git package/luci-app-passwall
echo "✅ PassWall 已添加"

# ---------- 10. 修复 geoview ----------
echo "📦 修复 geoview..."
if [ -d "package/openwrt-passwall-packages" ]; then
  cd package/openwrt-passwall-packages
  rm -rf geoview 2>/dev/null || true
  git clone --depth 1 https://github.com/snowie2000/geoview.git
  cd geoview
  git checkout v0.2.4 2>/dev/null || echo "使用最新版本"
  cd ../../..
  echo "✅ geoview 已修复"
else
  echo "⚠️ openwrt-passwall-packages 目录不存在，跳过 geoview 修复"
fi

echo "========================================="
echo "✅ LEDE diy1.sh 执行完成"
echo "========================================="
