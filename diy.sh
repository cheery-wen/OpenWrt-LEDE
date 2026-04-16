#!/bin/bash
# ============================================
# DIY 脚本 - OpenWrt 官方原版
# 功能：修改IP、清除密码、更换主题Argon、添加指定插件、
#       包含PassWall完整界面、Argon配置界面、默认简体中文、
#       luci-app-control-webrestriction、luci-app-ramfree
# ============================================

# ---------- 1. 修改默认 IP 地址为 192.168.5.1 ----------
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# ---------- 2. 清除登录密码（设置为空）----------
if [ -f "package/base-files/files/etc/shadow" ]; then
    sed -i 's/root:[^:]*:/root::/g' package/base-files/files/etc/shadow
fi

# ---------- 3. 自定义固件版本显示 ----------
sed -i "s/DISTRIB_REVISION='.*'/DISTRIB_REVISION='$(TZ=UTC-8 date "+%Y.%m.%d") compiled by cheery'/g" package/base-files/files/etc/openwrt_release

# ---------- 4. 设置 LuCI 默认语言为简体中文 ----------
if [ -f "feeds/luci/modules/luci-base/root/etc/config/luci" ]; then
    sed -i "s/option lang auto/option lang zh_cn/g" feeds/luci/modules/luci-base/root/etc/config/luci
fi

# ---------- 5. 添加第三方插件 ----------
# Argon 主题与配置
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# Lienol 仓库中的特定插件 (control-webrestriction 和 ramfree)
git clone --depth 1 --filter=blob:none --sparse https://github.com/Lienol/openwrt-package.git package/lienol-packages
cd package/lienol-packages
git sparse-checkout set luci-app-control-webrestriction luci-app-ramfree
cd ../..

# 关机按钮
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff

# Lucky 大吉
git clone --depth 1 https://github.com/gdy666/luci-app-lucky.git package/luci-app-lucky

# PassWall 依赖包及主程序
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/openwrt-passwall-packages
git clone --depth 1 https://github.com/Openwrt-Passwall/openwrt-passwall.git package/luci-app-passwall

# ---------- 6. 设置 Argon 为默认主题 ----------
if [ -f "feeds/luci/collections/luci/Makefile" ]; then
    sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
fi

echo "✅ DIY 脚本执行完成"
echo "   - 默认 IP：192.168.5.1"
echo "   - 默认密码：无"
echo "   - 默认主题：Argon"
echo "   - 默认语言：简体中文"
echo "   - IPv6 支持：已启用"
echo "   - 已集成插件：PassWall, Lucky, 关机按钮, 访问限制, 内存释放, DDNS 等"
