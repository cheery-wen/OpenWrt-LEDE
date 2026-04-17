# OpenWrt / LEDE 自动编译

基于 GitHub Actions 的 OpenWrt 官方版和 LEDE 双版本自动编译模板。

## 特性

- ✅ 双版本支持：OpenWrt 官方版 + LEDE
- ✅ x86_64 平台，EFI 启动
- ✅ 默认 IP：192.168.5.1
- ✅ 默认密码：无
- ✅ IPv6 完整支持
- ✅ 默认主题：Argon
- ✅ 中文界面

## 集成插件

PassWall、Lucky、关机按钮、访问限制、内存释放、DDNS、磁盘管理、Samba4、TTYD、ZeroTier、UDPXY、KMS服务器、文件传输、硬盘休眠

## 触发方式

| 触发方式 | 说明 |
|---------|------|
| Push 到 master | 自动编译两个版本 |
| 手动触发 | 可选择编译 openwrt / lede / both |


## 默认信息

| 项目 | 值 |
|------|-----|
| IP | 192.168.5.1 |
| 密码 | 无 |
| 主题 | Argon |
| 语言 | 简体中文 |

## 致谢

- [OpenWrt](https://github.com/openwrt/openwrt)
- [LEDE](https://github.com/coolsnowwolf/lede)
- [luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon)
- [openwrt-passwall](https://github.com/xiaorouji/openwrt-passwall)
- [lucky](https://github.com/gdy666/luci-app-lucky)

## 许可证

MIT
