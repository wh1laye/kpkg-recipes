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
| `fs/dosfstools` | `4.2` | FAT filesystem tools |
| `fs/e2fsprogs` | `1.47.0` | ext2, ext3 and ext4 tools |
| `libs/gmp` | `6.3.0` | Arbitrary precision arithmetic library |
| `libs/json-c` | `0.19.20260627` | JSON implementation in C |
| `libs/mpc` | `1.3.1` | Complex number arithmetic library |
| `libs/mpfr` | `4.2.1` | Multiple precision floating point library |
| `network/curl` | `8.10.1` | URL transfer tool and library |
| `network/dhcpcd` | `10.1.0` | DHCP client |
| `network/iproute2` | `6.11.0` | IP routing tools |
| `network/iputils` | `20240905` | ping and network diagnostic tools |
| `network/openssh` | `9.9p1` | OpenSSH client and server |
| `system/bash` | `5.2.37` | GNU Bourne Again shell |
| `system/bzip2` | `1.0.8` | Block sorting compressor |
| `system/coreutils` | `9.5` | GNU core utilities |
| `system/diffutils` | `3.10` | GNU diff tools |
| `system/file` | `5.45` | File type identification |
| `system/findutils` | `4.10.0` | GNU find tools |
| `system/gawk` | `5.3.0` | GNU awk |
| `system/grep` | `3.11` | GNU grep |
| `system/gzip` | `1.13` | GNU gzip |
| `system/kmod` | `33` | Kernel module tools |
| `system/less` | `661` | Terminal pager |
| `system/libxcrypt` | `4.4.36` | Password hashing library |
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
| `toolchain/bison` | `3.8.2` | Parser generator |
| `toolchain/flex` | `2.6.4` | Lexical analyzer generator |
| `toolchain/libtool` | `2.4.7` | Generic library support script |
| `toolchain/m4` | `1.4.19` | GNU macro processor |
| `toolchain/make` | `4.4.1` | GNU make |
| `toolchain/patch` | `2.7.6` | Apply diff files to originals |
| `toolchain/pkgconf` | `2.3.0` | Compiler and linker flag helper |
| `tools/fastfetch` | `2.70.0` | Fast system information tool |
| `tools/nano` | `8.0` | GNU nano editor |

## ✅ Checksums and checks

Recipes written without a `SHA256` field are waiting for a checksum. Run the **fill-checksums** workflow from the Actions tab, or run `kpkg checksum path/to/recipe.kpkg` locally. `kpkg` downloads the sources and writes the hashes into the recipe. Run the checks with:

```sh
KPKG=/path/to/kpkg bash tools/test-recipes.sh
```

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
