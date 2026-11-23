<div align="center">

<img src="https://raw.githubusercontent.com/wh1laye/Kryonux/main/docs/logo.svg" alt="Kryonux logo" width="96" height="96">

# 🍳 kpkg recipes

**Package recipes for the Kryonux package manager `kpkg`.**

![kpkg](https://img.shields.io/badge/kpkg-0.0.1-5fb4ff?style=flat-square)
![license](https://img.shields.io/badge/license-GPLv3-blue?style=flat-square)

[🏠 Kryonux](https://github.com/wh1laye/Kryonux) · [📖 Recipe guide](RECIPES.md) · [🌐 Website](https://wh1laye.github.io/Kryonux/)

</div>

---

## ✨ Overview

A recipe is a plain text `.kpkg` file that tells `kpkg` where to download the sources of a program, how to verify them and how to build and install them. This repository is the official recipe tree of Kryonux. It is intentionally clean: every recipe follows the same layout and is checked by `tools/test-recipes.sh` and `kpkg lint`.

## 🗂️ Layout

```text
category/name/name-version/name-version.kpkg
```

Categories: `system`, `fs`, `network`, `toolchain`, `build`, `tools`, `libs`, `boot`, `init`, `admin`.

Current recipes:

| Recipe | Version | Description |
| :--- | :--- | :--- |
| `admin/doas` | `6.8.2` | Minimal privilege escalation tool |
| `boot/limine` | `8.6.0` | Limine bootloader |
| `fs/btrfs-progs` | `6.11` | Btrfs filesystem tools |
| `fs/dosfstools` | `4.2` | FAT filesystem tools |
| `fs/e2fsprogs` | `1.47.0` | ext2, ext3 and ext4 tools |
| `init/openrc` | `0.54` | Dependency based init system |
| `libs/gmp` | `6.3.0` | Arbitrary precision arithmetic library |
| `libs/json-c` | `0.19.20260627` | JSON implementation in C |
| `libs/libmnl` | `1.0.5` | Minimalistic netlink library |
| `libs/libnftnl` | `1.2.8` | Netfilter nftables netlink library |
| `libs/libsodium` | `1.0.20` | Cryptography library |
| `libs/mpc` | `1.3.1` | Complex number arithmetic library |
| `libs/mpfr` | `4.2.1` | Multiple precision floating point library |
| `network/curl` | `8.10.1` | URL transfer tool and library |
| `network/dhcpcd` | `10.1.0` | DHCP client |
| `network/iproute2` | `6.11.0` | IP routing tools |
| `network/iputils` | `20240905` | ping and network diagnostic tools |
| `network/nftables` | `1.1.1` | Netfilter packet filtering framework |
| `network/openssh` | `9.9p1` | OpenSSH client and server |
| `system/bash` | `5.2.37` | GNU Bourne Again shell |
| `system/bzip2` | `1.0.8` | Block sorting compressor |
| `system/coreutils` | `9.5` | GNU core utilities |
| `system/diffutils` | `3.10` | GNU diff tools |
| `system/eudev` | `3.2.14` | Device manager |
| `system/file` | `5.45` | File type identification |
| `system/findutils` | `4.10.0` | GNU find tools |
| `system/gawk` | `5.3.0` | GNU awk |
| `system/glibc` | `2.40` | GNU C library |
| `system/grep` | `3.11` | GNU grep |
| `system/gzip` | `1.13` | GNU gzip |
| `system/kmod` | `33` | Kernel module tools |
| `system/less` | `661` | Terminal pager |
| `system/libxcrypt` | `4.4.36` | Password hashing library |
| `system/linux-headers` | `6.18.64` | Linux kernel headers |
| `system/ncurses` | `6.5` | Terminal handling library |
| `system/openssl` | `3.3.2` | TLS and cryptography toolkit |
| `system/procps` | `4.0.4` | Process tools: ps, top, free |
| `system/readline` | `8.2` | Line editing library |
| `system/sed` | `4.9` | GNU sed |
| `system/shadow` | `4.16.0` | Login and account tools |
| `system/tar` | `1.35` | GNU tar |
| `system/util-linux` | `2.40.2` | System utilities: mount, fdisk, lsblk |
| `system/xz-utils` | `5.4.7` | XZ compression tools and library |
| `system/zlib` | `1.3.1` | Compression library |
| `toolchain/autoconf` | `2.72` | Generates configure scripts |
| `toolchain/automake` | `1.17` | Generates Makefile.in files |
| `toolchain/binutils` | `2.43.1` | GNU binary utilities |
| `toolchain/bison` | `3.8.2` | Parser generator |
| `toolchain/cmake` | `3.30.5` | Cross platform build system generator |
| `toolchain/flex` | `2.6.4` | Lexical analyzer generator |
| `toolchain/gcc` | `14.2.0` | GNU compiler collection |
| `toolchain/gperf` | `3.1` | Perfect hash function generator |
| `toolchain/libtool` | `2.4.7` | Generic library support script |
| `toolchain/m4` | `1.4.19` | GNU macro processor |
| `toolchain/make` | `4.4.1` | GNU make |
| `toolchain/meson` | `1.5.2` | Meson build system |
| `toolchain/nasm` | `2.16.03` | Netwide assembler |
| `toolchain/ninja` | `1.12.1` | Small build system |
| `toolchain/patch` | `2.7.6` | Apply diff files to originals |
| `toolchain/perl` | `5.40.0` | Practical extraction and report language |
| `toolchain/pkgconf` | `2.3.0` | Compiler and linker flag helper |
| `toolchain/python` | `3.12.7` | Python interpreter |
| `tools/fastfetch` | `2.70.0` | Fast system information tool |
| `tools/minisign` | `0.11` | Small tool to sign files and verify signatures |
| `tools/mtools` | `4.0.45` | FAT filesystem tools without mounting |
| `tools/nano` | `8.0` | GNU nano editor |

## ✅ Checksums and checks

Recipes written without a `SHA256` field are waiting for a checksum. Run the **fill-checksums** workflow from the Actions tab, or run `kpkg checksum path/to/recipe.kpkg` locally. `kpkg` downloads the sources and writes the hashes into the recipe. Every package of the Kryonux stage 3 and live ISO has a recipe here. Run the checks with:

```sh
KRYONUX_DIR=/path/to/Kryonux KPKG=/path/to/kpkg bash tools/test-recipes.sh
```

The test checks the layout, names, categories, style, `kpkg lint`, that every dependency has a recipe, and that every package in the stage 3 list has a recipe.

## 🚀 Using the tree

```sh
doas kpkg sync
doas kpkg install -a tools/fastfetch
```

Install a single recipe file without the tree:

```sh
kpkg lint name-1.0.kpkg
doas kpkg install ./name-1.0.kpkg
```

## ✍️ Writing a recipe

Read [RECIPES.md](RECIPES.md). It describes every field and build function and walks through the two reference recipes, `libs/json-c` (library) and `tools/fastfetch` (application). Recipes for AI assistants are covered in [AGENTS.md](AGENTS.md).

## 🤝 Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md). Report vulnerabilities privately as described in [SECURITY.md](SECURITY.md).

## 📜 License

Copyright © 2026 The Kryonux Project. Released under the [GNU General Public License v3.0](LICENSE). Each packaged program keeps its own license, named in the recipe. See [NOTICE](NOTICE) for brand rules.

---

<div align="center">

📝 See the [CHANGELOG](CHANGELOG.md) for history.

</div>
