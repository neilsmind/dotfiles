#!/usr/bin/env bash
set -euo pipefail

root="$HOME/dotfiles"
backup="$root/backups/backup-$(date +%Y%m%d%H%M%S)"
mkdir -p "$backup"

link() {
  src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] || [ -L "$dest" ]; then mv -v "$dest" "$backup"/; fi
  ln -sv "$root/$src" "$dest"
}

link zshrc            "$HOME/.zshrc"
link zshrc.d          "$HOME/.zshrc.d"
link gitconfig        "$HOME/.gitconfig"
link gitignore_global "$HOME/.gitignore_global"
link config/starship.toml  "$HOME/.config/starship.toml"

echo "Backed up any existing files to: $backup"