# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this is

A dotfiles repo linked into `$HOME` by `install.sh`, one symlink per file. `README.md` explains the layout; read it first. `machines/<hostname>.md` explains the current machine's customizations; it is gitignored and exists only on that machine.

## Rules

- `config/` mirrors `~/.config`. A file's path in the repo is its path under `~/.config`. Same for `platform/<os>/config/`.
- `shell/env.sh`, `aliases.sh`, `functions.sh`, and `hooks.sh` must stay valid in both bash and zsh. No arrays, no `[[ ]]`-only idioms that zsh parses differently, no shell-specific builtins. Shell-specific code goes in `shell/bashrc` or `shell/zshrc`.
- Every tool hook in `hooks.sh` is guarded twice: skip if the tool is missing, skip if it is already initialized. Keep that pattern for new hooks.
- Do not add tool-generated state (locks, caches, logs, `theme.lua` on Omarchy) to `config/`.
- `install.sh` must stay idempotent and must never delete a file that is not a dangling link into this repo. Test changes with `--dry-run` against a scratch `HOME`.
- `legacy/` is reference only. Nothing links to it.
- When a change is Omarchy-specific, update `machines/<hostname>.md` in the same commit.
