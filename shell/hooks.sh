# Tool hooks that need the shell name. The loader sets DOT_SHELL to bash or zsh.
# Every hook is guarded so it is skipped when the tool is absent or when
# something earlier (Omarchy's bash rc, for example) already ran it.

: "${DOT_SHELL:?DOT_SHELL must be set to bash or zsh before sourcing hooks.sh}"

# Runtime version manager: mise everywhere. fnm/rbenv/pyenv are only used on a
# machine that has not moved to mise yet, and only when mise is absent.
if command -v mise >/dev/null 2>&1; then
  [ -n "${MISE_SHELL:-}" ] || eval "$(mise activate "$DOT_SHELL")"
else
  command -v fnm   >/dev/null 2>&1 && eval "$(fnm env --use-on-cd --shell "$DOT_SHELL")"
  command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init - "$DOT_SHELL")"
  command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init - "$DOT_SHELL")"
fi

if command -v direnv >/dev/null 2>&1; then
  command -v _direnv_hook >/dev/null 2>&1 || eval "$(direnv hook "$DOT_SHELL")"
fi

if command -v zoxide >/dev/null 2>&1; then
  command -v __zoxide_z >/dev/null 2>&1 || eval "$(zoxide init "$DOT_SHELL")"
fi

if command -v starship >/dev/null 2>&1 && [ "${TERM:-}" != dumb ]; then
  [ -n "${STARSHIP_SHELL:-}" ] || eval "$(starship init "$DOT_SHELL")"
fi
