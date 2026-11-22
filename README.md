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

A recipe is a plain text `.kpkg` file that tells `kpkg` where to download the sources of a program, how to verify them and how to build and install them. This repository is the official recipe tree of Kryonux. It is intentionally small and clean: every recipe follows the same layout and is checked with `kpkg lint`.

## 🗂️ Layout

```text
category/name/name-version/name-version.kpkg
```

Categories: `system`, `fs`, `network`, `toolchain`, `build`, `tools`, `libs`, `boot`, `init`, `admin`.

Current recipes:

| Recipe | Version | Description |
| :--- | :--- | :--- |
| `libs/json-c` | `0.19.20260627` | JSON implementation in C |
| `tools/fastfetch` | `2.70.0` | Fast system information tool |

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
