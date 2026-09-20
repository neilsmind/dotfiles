#!/usr/bin/env bash
# Link this repo's files into $HOME. Safe to rerun: existing correct links are
# left alone, anything else in the way is moved to backups/ first.
#
#   ./install.sh            link everything for this OS
#   ./install.sh --dry-run  show what would change
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dry_run=0
[[ ${1:-} == --dry-run || ${1:-} == -n ]] && dry_run=1

case "$(uname -s)" in
  Linux)  os=linux ;;
  Darwin) os=macos ;;
  *) echo "Unsupported OS: $(uname -s)" >&2; exit 1 ;;
esac

backup="$root/backups/backup-$(date +%Y%m%d%H%M%S)"
changed=0

# link <repo-relative source> <absolute target>
link() {
  local src="$root/$1" dest="$2"
  if [[ -L $dest && $(readlink "$dest") == "$src" ]]; then
    return 0
  fi
  changed=1
  if [[ $dry_run -eq 1 ]]; then
    if [[ -e $dest || -L $dest ]]; then
      echo "replace  $dest  ->  $1"
    else
      echo "link     $dest  ->  $1"
    fi
    return 0
  fi
  mkdir -p "$(dirname "$dest")"
  if [[ -e $dest || -L $dest ]]; then
    mkdir -p "$backup/$(dirname "${dest#"$HOME"/}")"
    mv "$dest" "$backup/${dest#"$HOME"/}"
    echo "backed up $dest"
  fi
  ln -s "$src" "$dest"
  echo "linked   $dest  ->  $1"
}

# link_tree <repo-relative dir> <absolute target dir>
# One link per file, real directories in between. Tools and Omarchy can add
# their own untracked files beside ours without touching the repo.
link_tree() {
  local src_dir="$1" dest_dir="$2" f rel
  [[ -d "$root/$src_dir" ]] || return 0
  while IFS= read -r -d '' f; do
    rel="${f#"$root/$src_dir"/}"
    link "$src_dir/$rel" "$dest_dir/$rel"
  done < <(find "$root/$src_dir" -type f -print0 | sort -z)
}

# unlink_stale <absolute path>: remove a link into this repo whose target is gone
# (left over from the pre-XDG layout).
unlink_stale() {
  local dest="$1"
  if [[ -L $dest && $(readlink "$dest") == "$root"/* && ! -e $dest ]]; then
    changed=1
    if [[ $dry_run -eq 1 ]]; then
      echo "remove   $dest  (dangling link into repo)"
    else
      rm "$dest"
      echo "removed  $dest  (dangling link into repo)"
    fi
  fi
}

echo "dotfiles: $root  os: $os"

# Shared XDG config, every machine.
link_tree config "$HOME/.config"

# Platform-specific XDG config.
link_tree "platform/$os/config" "$HOME/.config"

# Shell loaders. Both are linked everywhere so either shell works on any box.
link shell/bashrc "$HOME/.bashrc"
link shell/zshrc  "$HOME/.zshrc"

# Agent guidance: same file for Claude Code and for tools that read AGENTS.md.
link agents/CLAUDE.md "$HOME/.claude/CLAUDE.md"
link agents/CLAUDE.md "$HOME/AGENTS.md"

# Leftovers from the old layout.
unlink_stale "$HOME/.zshrc.d"
unlink_stale "$HOME/.gitconfig"
unlink_stale "$HOME/.gitignore_global"

if [[ $changed -eq 0 ]]; then
  echo "Nothing to do; everything already linked."
elif [[ $dry_run -eq 0 && -d $backup ]]; then
  echo "Backups of replaced files: $backup"
fi
