# 📝 Changelog

All notable changes to the Kryonux recipe tree are recorded here.

## [v0.0.1] - 2026-11-22

### 🍳 Recipes
#### Changed
- The repository was reset. All 393 old recipes in the legacy `.cpr` format were removed together with their `Manifest` files and Gentoo style categories
- Recipes now live in `category/name/name-version/name-version.kpkg`
- Checksums are a `SHA256` field inside the recipe instead of separate `Manifest` files

#### Added
- Reference recipes `libs/json-c` and `tools/fastfetch`
- `RECIPES.md` with the full recipe format and `AGENTS.md` and `CLAUDE.md` so AI assistants can write correct recipes
- `NOTICE`, `CONTRIBUTING.md`, `SECURITY.md`, issue templates and a pull request template
