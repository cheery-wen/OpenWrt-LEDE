# OpenWrt / LEDE 自动编译



基于 GitHub Actions 的 OpenWrt/LEDE 双版本自动编译模板，专为 x86_64 平台优化。

---

## 📥 下载固件

前往 [Releases](../../releases) 页面下载最新固件。

| 版本 | 说明 |
|------|------|
| **OpenWrt 官方版** | 基于 openwrt/openwrt 主线，跟随官方最新内核 |
| **LEDE 版** | 基于 coolsnowwolf/lede，内核 6.12 |

---

## 🔧 默认配置

| 项目 | 值 |
|------|-----|
| 默认 IP | `192.168.5.1` |
| 默认密码 | 无 |
| 默认主题 | Argon |
| 默认语言 | 简体中文 |
| IPv6 | ✅ 已启用 |

---

## 📦 集成插件

- **代理**: PassWall（完整版）
- **网络**: DDNS（Cloudflare）、ZeroTier、UDPXY
- **存储**: 磁盘管理、Samba4、硬盘休眠
- **系统**: Lucky、关机按钮、访问限制、内存释放
- **服务**: KMS 服务器、TTYD 终端、文件传输
  
---

## 📄 固件文件说明

| 文件格式 | 适用场景 |
|----------|----------|
| `*.img.gz` | 物理机直接写入 |
| `*.vmdk` | VMware 虚拟机 |
| `*.vdi` | VirtualBox 虚拟机 |
| `*.vhdx` | Hyper-V 虚拟机 |
| `*.qcow2` | Proxmox / KVM 虚拟机 |

---

## 🙏 致谢

- [OpenWrt](https://github.com/openwrt/openwrt)
- [LEDE](https://github.com/coolsnowwolf/lede)
- [PassWall](https://github.com/xiaorouji/openwrt-passwall)
- [Argon 主题](https://github.com/jerrykuku/luci-theme-argon)
- 所有为开源社区无私奉献的开发者们

---

