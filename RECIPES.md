# 🍳 How to write a kpkg recipe

A recipe is a plain text file with the `.kpkg` extension. `kpkg` parses it itself, so the header is never executed as shell code. Only the build functions run in a shell.

## 📁 Location and name

```text
category/name/name-version/name-version.kpkg
```

- Use lowercase names with letters, digits, `-`, `+` and `.`
- The directory and file name must match `PACKAGE` and `VERSION`
- Pick the category from: `system`, `fs`, `network`, `toolchain`, `build`, `tools`, `libs`, `boot`, `init`, `admin`

## 🧾 Header fields

| Field | Required | Meaning |
| :--- | :--- | :--- |
| `PACKAGE` | yes | Package name |
| `VERSION` | yes | Package version |
| `DESCRIPTION` | yes | One line description |
| `LICENSE` | yes | License of the packaged program |
| `SRC_URI` | yes | Source URLs separated by spaces. `url -> file` renames the download |
| `SHA256` | yes | One SHA-256 per source, in the same order as `SRC_URI`, separated by spaces |
| `HOMEPAGE` | no | Project website |
| `DEPEND` | no | Build dependencies as `category/name` separated by spaces |
| `RDEPEND` | no | Runtime dependencies |
| `SLOT` | no | Slot name for parallel versions |
| `BUILD_FLAGS` | no | Extra flags passed by the default configure step |

Write values in double quotes. A quoted value may span several lines. Lines that start with `#` are ignored by `kpkg`, but recipes in this repository do not use comments.

## 🔧 Build functions

All functions are optional. `kpkg` supplies defaults: `./configure --prefix=/usr`, CMake or Meson depending on the source tree, then a parallel build.

| Function | Runs |
| :--- | :--- |
| `prepare` | After unpacking, before configuring |
| `configure` | Configures the build |
| `build` | Compiles |
| `install` | Installs into `$DESTDIR` |
| `pre_install`, `post_install` | Before and after files reach the system |
| `pre_remove`, `post_remove` | Before and after removal |

Available variables: `DESTDIR`, `JOBS`, `BUILD_FLAGS`. The old names `src_prepare`, `src_configure`, `src_compile`, `src_install`, `pkg_preinst`, `pkg_postinst`, `pkg_prerm` and `pkg_postrm` are accepted but should not be used in new recipes.

## 📚 Reference recipes

`libs/json-c/json-c-0.19.20260627/json-c-0.19.20260627.kpkg` shows a library: a CMake project, a dependency list, flags passed through `BUILD_FLAGS`, and custom `build` and `install` functions.

`tools/fastfetch/fastfetch-2.70.0/fastfetch-2.70.0.kpkg` shows an application: every function in order, `configure` written explicitly, and a `post_install` message.

## 🔐 Getting the checksum

```sh
curl -fLO https://example.org/name-1.0.tar.gz
sha256sum name-1.0.tar.gz
```

Always hash the exact file the `SRC_URI` downloads, after any rename.

## ✅ Checklist

1. Create the directory and file as shown above
2. Fill every required field
3. Run `kpkg lint path/to/name-version.kpkg` and fix every message
4. Run `doas kpkg install ./path/to/name-version.kpkg` on a Kryonux system and confirm it builds
5. Add a line to `CHANGELOG.md`
