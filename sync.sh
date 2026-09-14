#!/usr/bin/env bash
# Copies the current live dotfiles from $HOME into this repo.
# Run this, then review with `git diff`, then commit and push.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

FILES=(
  ".zshrc"
  ".zshenv"
  ".bashrc"
  ".bash_logout"
  ".profile"
  ".gitconfig"
  ".config/ghostty/config.ghostty"
  ".config/git/ignore"
  ".config/starship.toml"
)

for f in "${FILES[@]}"; do
  src="$HOME/$f"
  dest="$REPO_DIR/home/$f"
  if [ -e "$src" ]; then
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    echo "synced $f"
  else
    echo "skipped $f (not found in \$HOME)"
  fi
done
