# 📝 Changelog

All notable changes to the Kryonux recipe tree are recorded here.

## [v0.0.1] - 2026-11-22

### 🍳 Recipes
#### Fixed
- `test-recipes.sh` scanned the `kryonux/` checkout used by the workflow for old CloudPkg and CloudOS names and failed on its `AGENTS.md` and `test-iso.sh`; it now skips that directory
- The `recipes` workflow failed with `kpkg is not available`: `test-kpkg.sh` runs `make clean` and removed the built `kpkg`, so the workflow now builds `kpkg` after the kpkg tests
- The fill-checksums run timed out on `ftp.gnu.org`. GNU sources now use `ftpmirror.gnu.org`, and `kpkg` retries GNU downloads from other mirrors. The workflow now commits the checksums it did write even when some downloads fail
- The recipes workflow ran the kpkg tests without root, so one test failed; it now uses `sudo`

#### Changed
- The repository was reset. All 393 old recipes in the legacy `.cpr` format were removed together with their `Manifest` files and Gentoo style categories
- Recipes now live in `category/name/name-version/name-version.kpkg`
- Checksums are a `SHA256` field inside the recipe instead of separate `Manifest` files

#### Added
- Recipes for what the live ISO needs: `zstd`, `squashfs-tools`, `libburn`, `libisofs`, `libisoburn` (xorriso), `popt`, `lvm2` (device mapper), `cryptsetup`, `cpio` and `psmisc`
- `test-recipes.sh` now fails on leftovers of the old repository: `.gitmodules`, any `cloudpkg` or `cloudos` name, and workflows other than `recipes.yml` and `fill-checksums.yml`
- 42 recipes for the base system, the build toolchain and common tools: `make`, `patch`, `m4`, `autoconf`, `automake`, `libtool`, `bison`, `flex`, `pkgconf`, `gmp`, `mpfr`, `mpc`, `zlib`, `bzip2`, `xz-utils`, `gzip`, `tar`, `grep`, `sed`, `gawk`, `diffutils`, `findutils`, `coreutils`, `ncurses`, `readline`, `bash`, `less`, `file`, `kmod`, `libxcrypt`, `openssl`, `procps`, `util-linux`, `shadow`, `e2fsprogs`, `dosfstools`, `curl`, `openssh`, `dhcpcd`, `iproute2`, `iputils` and `nano`. They have no `SHA256` yet: the **fill-checksums** workflow or `kpkg checksum` writes it from the real archives
- Recipes for the toolchain and boot chain: `binutils`, `gcc`, `glibc`, `linux-headers`, `perl`, `python`, `ninja`, `meson`, `cmake`, `gperf`, `nasm`, `mtools`, `openrc`, `limine`, `eudev`, `libmnl`, `libnftnl`, `nftables`, `btrfs-progs`, `libsodium`, `minisign` and `doas`. Every package of the Kryonux stage 3 list now has a recipe. Versions and URLs are written from known releases and are confirmed when the **fill-checksums** workflow downloads them. `limine` builds the UEFI loader and may need a clang based toolchain
- `tools/test-recipes.sh` checks layout, names, categories, style, dependencies (each must have a recipe) and the stage 3 list, and runs `kpkg lint`; the `recipes` workflow runs it together with the kpkg tests
- Reference recipes `libs/json-c` and `tools/fastfetch`
- `RECIPES.md` with the full recipe format and `AGENTS.md` and `CLAUDE.md` so AI assistants can write correct recipes
- `NOTICE`, `CONTRIBUTING.md`, `SECURITY.md`, issue templates and a pull request template
