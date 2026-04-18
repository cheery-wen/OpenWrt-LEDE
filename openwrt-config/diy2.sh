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

# 方法2：创建默认配置（更可靠）
mkdir -p files/etc/config
cat > files/etc/config/luci <<'EOF'
config core main
    option lang zh_cn
    option mediaurlbase /luci-static/argon
    option resourcebase /luci-static/resources
EOF
echo "✅ 强制设置默认语言和主题"

if [ -f "feeds/luci/collections/luci/Makefile" ]; then
    sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
    echo "✅ 默认主题已设置为 Argon"
fi

echo "✅ diy2.sh 执行完成"
