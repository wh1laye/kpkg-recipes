# AGENTS.md — kpkg recipes repository guide

Instructions for AI coding agents (OpenCode, Claude Code and others) working in this repository.

## What this repository is

The official recipe tree for `kpkg`, the package manager of Kryonux (`wh1laye/Kryonux`). A recipe is a `.kpkg` text file. The full format is in `RECIPES.md`.

## Writing a recipe

1. Read `RECIPES.md`, then read both reference recipes: `libs/json-c/json-c-0.19.20260627/json-c-0.19.20260627.kpkg` and `tools/fastfetch/fastfetch-2.70.0/fastfetch-2.70.0.kpkg`
2. Place the file at `category/name/name-version/name-version.kpkg`
3. Fill `PACKAGE`, `VERSION`, `DESCRIPTION`, `LICENSE`, `SRC_URI`, `SHA256`. Add `DEPEND` and `RDEPEND` with `category/name` tokens that exist in this tree or in the Kryonux base
4. Use the default configure and build steps when the project is plain autotools, CMake or Meson. Write `configure`, `build` or `install` only when the defaults are not enough
5. Get the SHA-256 with `kpkg checksum file.kpkg`, which downloads the real archive. Never invent a checksum or a URL. If you cannot download the source, leave `SHA256` out and say so; the `fill-checksums` workflow writes it later
6. Run `kpkg lint` and `bash tools/test-recipes.sh` and fix every message
7. Add an entry to `CHANGELOG.md`

## Rules

- No comments in recipes or scripts
- Header values in double quotes, build functions use two space indentation
- Categories only from: `system`, `fs`, `network`, `toolchain`, `build`, `tools`, `libs`, `boot`, `init`, `admin`
- Do not use Gentoo names or layouts: no ebuilds, `KEYWORDS`, `CATEGORY`, `Manifest` files or `src_*` function names
- Recipes must build from source without proprietary blobs or hardcoded host paths
- Repository docs are in English with sentence case. Use `The Kryonux Project` instead of personal nicknames in copyright text
- Record every change in `CHANGELOG.md`
- Commit and push only when asked, using the style described in "Finishing a task"

## Finishing a task

When a task is done, finish in one of two ways:

1. If you can push, commit and push yourself with a message in the style `type: what was fixed or changed`. Use these types: `feat`, `fix`, `docs`, `test`, `ci`, `build`, `refactor`, `perf`, `style` and `chore`. Examples: `docs: fix the changelog dates`, `fix: keep /etc files on kpkg upgrade`, `test: add the iso checks`. Use lower case, the imperative mood and at most 72 characters. Add a short body when the reason is not obvious
2. If you cannot push, as in a chat, do not claim that you pushed. End your answer with the exact commands for the user to run, for example:

```sh
git add -A
git commit -m "docs: fix the changelog dates"
git push
```

Before finishing, make sure that `CHANGELOG.md` is updated and that the checks listed in this file pass.
