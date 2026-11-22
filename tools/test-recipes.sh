#!/bin/bash
set -eu

HERE=$(cd "$(dirname "$0")" && pwd)
REPO=$(dirname "$HERE")
KPKG=${KPKG:-kpkg}
CATS="system fs network toolchain build tools libs boot init admin"

command -v "$KPKG" >/dev/null 2>&1 || [ -x "$KPKG" ] || { echo "kpkg is not available, set KPKG=/path/to/kpkg" >&2; exit 1; }

fail=0
pending=0
total=0
err() { printf 'FAIL  %s: %s\n' "$1" "$2"; fail=$((fail+1)); }

while IFS= read -r f; do
  total=$((total+1))
  rel=${f#"$REPO"/}
  IFS=/ read -r cat name dir file extra <<< "$rel"
  if [ -n "${extra:-}" ] || [ -z "${file:-}" ]; then err "$rel" "expected category/name/name-version/name-version.kpkg"; continue; fi
  case " $CATS " in *" $cat "*) ;; *) err "$rel" "unknown category $cat"; continue ;; esac
  pkg=$(sed -n 's/^PACKAGE=//p' "$f" | head -1)
  ver=$(sed -n 's/^VERSION=//p' "$f" | head -1)
  [ "$pkg" = "$name" ] || err "$rel" "PACKAGE is $pkg, the directory is $name"
  [ "$dir" = "$name-$ver" ] || err "$rel" "directory is $dir, expected $name-$ver"
  [ "$file" = "$name-$ver.kpkg" ] || err "$rel" "file name is $file, expected $name-$ver.kpkg"
  if grep -n '^[[:space:]]*#' "$f" >/dev/null; then err "$rel" "recipes must not contain comments"; fi
  if grep -qP '\t' "$f"; then err "$rel" "tabs are not allowed, use two spaces"; fi
  if grep -qE '^(KEYWORDS|CATEGORY|EAPI|inherit)\b|^src_|^pkg_' "$f"; then err "$rel" "Gentoo style keys or function names are not allowed"; fi
  out=$("$KPKG" lint "$f" 2>&1) && rc=0 || rc=$?
  if [ "$rc" != 0 ]; then
    if [ "$(printf '%s\n' "$out" | grep -vc 'SHA256 is missing')" = 0 ]; then
      pending=$((pending+1))
    else
      err "$rel" "$(printf '%s' "$out" | grep -v 'SHA256 is missing' | head -3 | tr '\n' ' ')"
    fi
  fi
  for d in $(sed -n 's/^\(DEPEND\|RDEPEND\)="\(.*\)"/\2/p' "$f"); do
    case $d in */*) ;; *) err "$rel" "dependency $d must be category/name" ;; esac
  done
done < <(find "$REPO" -name '*.kpkg' -not -path '*/.git/*' | sort)

printf '\nrecipes: %d checked, %d waiting for a checksum, %d failed\n' "$total" "$pending" "$fail"
[ "$fail" = 0 ] || exit 1
