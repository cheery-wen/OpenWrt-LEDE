# OpenWrt 官方原版自动编译模板

![OpenWrt](https://img.shields.io/badge/OpenWrt-official-blue)
![Platform](https://img.shields.io/badge/platform-x86__64-green)
![License](https://img.shields.io/badge/license-GPL--2.0-orange)
![GitHub Actions](https://img.shields.io/badge/build-GitHub%20Actions-2088FF)

基于 GitHub Actions 的 OpenWrt 官方原版自动化编译模板，专为 x86_64 平台优化，集成常用插件和完整中文化支持。

## ✨ 特性

- 🔧 **源码纯净**：基于 [OpenWrt 官方源码](https://github.com/openwrt/openwrt) `main` 分支
- 🖥️ **平台支持**：x86_64 generic（适用于大多数 PC/虚拟机/软路由）
- 🌐 **完整 IPv6**：内置完整 IPv6 协议栈支持
- 🇨🇳 **中文界面**：默认简体中文，所有插件均已汉化
- 🎨 **现代化主题**：默认 Argon 主题，带配置界面
- 📦 **丰富插件**：集成 PassWall、Lucky、DDNS、Samba 等实用插件
- 🔑 **开箱即用**：默认 IP `192.168.5.1`，无密码登录
- 🚀 **自动化发布**：编译完成后自动创建 Release 并上传固件

## 📦 集成插件

### 代理与网络
| 插件 | 功能 |
|------|------|
| PassWall | 功能强大的代理客户端（完整版，支持多种协议） |
| Lucky | 端口转发、DDNS、SSL 证书管理一体化工具 |
| ZeroTier | 虚拟局域网，轻松组建异地网络 |

### 系统工具
| 插件 | 功能 |
|------|------|
| 关机按钮 | 在 LuCI 界面添加关机/重启按钮 |
| 访问限制 | 家长控制/上网时间管理 |
| 内存释放 | 一键释放系统内存 |
| 文件传输 | 通过网页上传/下载文件 |
| TTYD | 网页终端，无需 SSH 客户端 |

### 存储与共享
| 插件 | 功能 |
|------|------|
| 磁盘管理 | 磁盘分区、格式化、挂载管理 |
| Samba4 | 网络文件共享（SMB/CIFS） |
| 硬盘休眠 | 降低闲置硬盘功耗，延长寿命 |

### 网络服务
| 插件 | 功能 |
|------|------|
| DDNS | 动态 DNS（含 Cloudflare 支持） |
| KMS 服务器 | 激活 Windows/Office 的 KMS 服务 |
| UDPXY | 将组播 UDP 流转发为 HTTP 单播流（IPTV 必备） |

### 主题与界面
| 插件 | 功能 |
|------|------|
| Argon 主题 | 现代化的 OpenWrt 管理界面主题 |
| Argon 配置 | Argon 主题的详细配置工具 |

## 🔧 默认配置

| 配置项 | 默认值 |
|--------|--------|
| 管理 IP | `192.168.5.1` |
| 登录密码 | 无（直接登录） |
| 默认语言 | 简体中文 |
| 默认主题 | Argon |
| 分区大小 | 内核 32MB / 根分区 320MB |
| IPv6 支持 | 完整启用 |

## 📁 文件说明

### 文件详解

| 文件 | 执行时机 | 主要功能 |
|------|----------|----------|
| `build.yml` | 全程 | 定义 GitHub Actions 编译流程 |
| `.config` | `make defconfig` 时 | 指定要编译的软件包和内核模块 |
| `diy1.sh` | 克隆源码后、更新 feeds 前 | 修改默认配置、克隆第三方插件源码 |
| `diy2.sh` | 更新 feeds 后、加载配置前 | 设置默认语言和默认主题 |

🙏 致谢

由衷感谢所有为 OpenWrt 无私奉献的开发者们！

特别感谢以下项目

· OpenWrt - 官方源码
· luci-theme-argon - Argon 主题
· openwrt-passwall - PassWall 插件
· luci-app-lucky - Lucky 插件
· Lienol/openwrt-package - 访问限制、内存释放插件
· esirplayground - 关机按钮插件

📜 许可证

本项目遵循 GPL-2.0 开源协议。
