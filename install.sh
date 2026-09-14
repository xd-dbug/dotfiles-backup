#!/usr/bin/env bash
# Restores dotfiles from this repo into $HOME.
# Any existing file at the destination is backed up to <file>.bak before being overwritten.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while IFS= read -r -d '' src; do
  rel="${src#"$REPO_DIR"/home/}"
  dest="$HOME/$rel"
  if [ -e "$dest" ] && ! cmp -s "$src" "$dest"; then
    cp "$dest" "$dest.bak"
    echo "backed up existing $rel to $rel.bak"
  fi
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  echo "installed $rel"
done < <(find "$REPO_DIR/home" -type f -print0)
