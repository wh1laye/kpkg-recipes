# AGENTS.md — kpkg recipes repository guide

Instructions for AI coding agents (OpenCode, Claude Code and others) working in this repository.

## What this repository is

The official recipe tree for `kpkg`, the package manager of Kryonux (`wh1laye/Kryonux`). A recipe is a `.kpkg` text file. The full format is in `RECIPES.md`.

## Writing a recipe

1. Read `RECIPES.md`, then read both reference recipes: `libs/json-c/json-c-0.19.20260627/json-c-0.19.20260627.kpkg` and `tools/fastfetch/fastfetch-2.70.0/fastfetch-2.70.0.kpkg`
2. Place the file at `category/name/name-version/name-version.kpkg`
3. Fill `PACKAGE`, `VERSION`, `DESCRIPTION`, `LICENSE`, `SRC_URI`, `SHA256`. Add `DEPEND` and `RDEPEND` with `category/name` tokens that exist in this tree or in the Kryonux base
4. Use the default configure and build steps when the project is plain autotools, CMake or Meson. Write `configure`, `build` or `install` only when the defaults are not enough
5. Verify the SHA-256 against the real archive. Never invent a checksum or a URL. If you cannot download the source, say so instead of guessing
6. Run `kpkg lint` on the file and fix every message
7. Add an entry to `CHANGELOG.md`

## Rules

- No comments in recipes or scripts
- Header values in double quotes, build functions use two space indentation
- Categories only from: `system`, `fs`, `network`, `toolchain`, `build`, `tools`, `libs`, `boot`, `init`, `admin`
- Do not use Gentoo names or layouts: no ebuilds, `KEYWORDS`, `CATEGORY`, `Manifest` files or `src_*` function names
- Recipes must build from source without proprietary blobs or hardcoded host paths
- Repository docs are in English with sentence case. Use `The Kryonux Project` instead of personal nicknames in copyright text
- Record every change in `CHANGELOG.md`
- Commit and push only when asked
