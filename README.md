# dotfiles

Config for every machine I use: macOS (zsh) and Omarchy Linux (bash).
One repo, one shared layer, small per-platform layers.

## Layout

```
config/            shared XDG config, linked into ~/.config on every machine
  git/  nvim/  tmux/  herdr/  ghostty/  mise/  starship.toml
shell/
  env.sh aliases.sh functions.sh hooks.sh   plain sh, sourced by both shells
  bashrc  zshrc                            thin loaders, linked to ~/.bashrc and ~/.zshrc
platform/
  linux/config/    Omarchy-only: hypr/ overrides and scripts, a systemd user unit
  macos/           (nothing yet)
machines/          one file per machine, gitignored: what is customized here and why
agents/CLAUDE.md   guidance for AI agents, linked to ~/.claude/CLAUDE.md and ~/AGENTS.md
legacy/            the previous zsh-era files, kept until the Macs are migrated
install.sh         links everything for the current OS
```

## Install

```sh
git clone git@github.com:neilsmind/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh --dry-run   # see what would change
./install.sh
```

Links are made per file, so tools and Omarchy can keep their own untracked
files next to ours. Anything already at a target path is moved into
`backups/` first. Rerunning is a no-op when everything is in place.

## How the shell layer works

Both `.bashrc` and `.zshrc` source the same four files from `shell/`, in order:
`env.sh` (PATH, EDITOR, Homebrew), `aliases.sh`, `functions.sh`, and `hooks.sh`
(mise, direnv, zoxide, starship, each guarded so it is skipped if absent or
already initialized). Only the shell-specific bits, such as completion setup,
live in the loaders themselves.

On Omarchy, `.bashrc` sources Omarchy's own rc first, so its aliases and tool
init load before ours and ours win on conflict.

Per-machine overrides go in `~/.config/shell/local.sh` (shell) and
`~/.config/git/config.local` (git identity, credential helper). Neither is tracked.

## Adding something

- A tool's config: put it under `config/<tool>/` at the same path it has under `~/.config`, rerun `install.sh`.
- Platform-only config: same, under `platform/<os>/config/`.
- A new machine: run `install.sh`, then write `machines/<hostname>.md`. That directory is gitignored, so the file stays on that machine only.
