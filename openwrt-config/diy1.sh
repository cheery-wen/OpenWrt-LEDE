#!/bin/bash
set -e

echo "========================================="
echo "OpenWrt 官方版 DIY 脚本 1"
echo "========================================="

# ---------- 1. 修改默认 IP ----------
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
echo "✅ IP 已修改为 192.168.5.1"

# ---------- 2. 清除登录密码 ----------
if [ -f "package/base-files/files/etc/shadow" ]; then
    sed -i 's/root:[^:]*:/root::/g' package/base-files/files/etc/shadow
    echo "✅ 密码已清除"
fi

# ---------- 3. 自定义版本显示 ----------
sed -i "s/DISTRIB_REVISION='.*'/DISTRIB_REVISION='$(TZ=UTC-8 date "+%Y.%m.%d") compiled by cheery'/g" package/base-files/files/etc/openwrt_release
echo "✅ 版本信息已更新（compiled by cheery）"

# ---------- 4. 删除有依赖问题的软件包 ----------
rm -rf feeds/packages/net/onionshare-cli 2>/dev/null || true
echo "✅ 问题包已删除"

# ---------- 5. 删除可能冲突的自带插件 ----------
echo "🗑️ 删除可能冲突的自带插件..."
rm -rf feeds/luci/themes/luci-theme-argon 2>/dev/null || true
rm -rf package/feeds/luci/luci-theme-argon 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-argon-config 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-passwall 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-lucky 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-poweroff 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-ramfree 2>/dev/null || true
rm -rf feeds/luci/applications/luci-app-control-webrestriction 2>/dev/null || true
rm -rf feeds/packages/net/lucky 2>/dev/null || true
rm -rf package/feeds/packages/lucky 2>/dev/null || true
echo "✅ 自带插件清理完成"

# ---------- 6. 添加第三方插件 ----------
echo "📦 添加第三方插件..."

git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
echo "✅ Argon 主题及配置已添加"

git clone --depth 1 --filter=blob:none --sparse https://github.com/Lienol/openwrt-package.git package/lienol-packages
cd package/lienol-packages
git sparse-checkout set luci-app-control-webrestriction luci-app-ramfree
cd ../..
echo "✅ 访问限制、内存释放已添加"

git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff
echo "✅ 关机按钮已添加"

git clone --depth 1 https://github.com/gdy666/luci-app-lucky.git package/luci-app-lucky
echo "✅ Lucky 已添加"

git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/openwrt-passwall-packages
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall.git package/luci-app-passwall
echo "✅ PassWall 已添加"

git clone --depth 1 https://github.com/immortalwrt/autocore.git package/autocore
echo "✅ Autocore 已添加"

git clone --depth 1 https://github.com/sbwml/autosamba.git package/autosamba
echo "✅ Autosamba 已添加"

echo "========================================="
echo "✅ OpenWrt diy1.sh 执行完成"
echo "========================================="
