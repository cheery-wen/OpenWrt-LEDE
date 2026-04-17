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

| 插件 | 功能 |
|------|------|
| PassWall | 代理客户端 |
| Lucky | 端口转发/DDNS/SSL证书 |
| 关机按钮 | 一键关机 |
| 访问限制 | 家长控制 |
| 内存释放 | 一键释放内存 |
| DDNS | 动态DNS（Cloudflare） |
| 磁盘管理 | 分区/格式化/挂载 |
| Samba4 | 网络共享 |
| TTYD | 网页终端 |
| ZeroTier | 虚拟局域网 |
| UDPXY | 组播转单播 |
| KMS服务器 | 激活服务 |
| 文件传输 | 文件管理 |
| 硬盘休眠 | 硬盘节能 |
| Autocore | 系统信息显示 |
| Autosamba | USB自动共享 |




## 使用

1. Fork 本仓库
2. 按需修改 `openwrt/` 或 `lede/` 目录下的配置文件
3. 推送代码自动触发编译
4. 在 Releases 页面下载固件

## 默认信息

| 项目 | 值 |
|------|-----|
| IP | 192.168.5.1 |
| 密码 | 无 |
| 主题 | Argon |
| 语言 | 简体中文 |

## 致谢

### 源码
- [OpenWrt](https://github.com/openwrt/openwrt)
- [LEDE](https://github.com/coolsnowwolf/lede)

### 主题
- [luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon)
- [luci-app-argon-config](https://github.com/jerrykuku/luci-app-argon-config)

### 代理
- [openwrt-passwall](https://github.com/Openwrt-Passwall/openwrt-passwall)
- [openwrt-passwall-packages](https://github.com/Openwrt-Passwall/openwrt-passwall-packages)

### 系统工具
- [luci-app-poweroff](https://github.com/esirplayground/luci-app-poweroff)
- [luci-app-lucky](https://github.com/gdy666/luci-app-lucky)
- [luci-app-control-webrestriction](https://github.com/Lienol/openwrt-package)
- [luci-app-ramfree](https://github.com/Lienol/openwrt-package)
- [autocore](https://github.com/immortalwrt/autocore)
- [autosamba](https://github.com/sbwml/autosamba)

### 其他
- 所有 OpenWrt/LEDE 官方插件维护者
- GitHub Actions
