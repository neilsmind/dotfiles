# Guidance for agents working on this machine

This file is linked to `~/.claude/CLAUDE.md` and `~/AGENTS.md` from `~/dotfiles/agents/CLAUDE.md`.

## Where configuration lives

- `~/dotfiles` is the source of truth for shell, tool, and desktop config. Its files are symlinked into `~/.config` and `$HOME` by `~/dotfiles/install.sh`, one link per file.
- Before changing anything under `~/.config`, check whether the file is a link into `~/dotfiles`. If it is, the change belongs in the repo and should be committed there.
- Files under `~/.config` that are not links are either tool-generated state or not yet curated. Ask before adding them to the repo.
- Read `~/dotfiles/machines/<hostname>.md` first. It records what is customized on this machine and why, including things that have already been investigated and ruled out.

## Ground rules

- Never edit files under `/usr/share/omarchy` or `~/.local/share/omarchy`; those are Omarchy's package files and get overwritten on update. Overrides go in `~/.config` (via the repo).
- On Omarchy, `sudo` needs a password. Do not assume passwordless root.
- Rerun `~/dotfiles/install.sh --dry-run` after an Omarchy upgrade to confirm links survived.
