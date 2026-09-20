# Environment shared by bash and zsh on every machine.
# Plain POSIX sh: no shell-specific syntax here.

export LANG="${LANG:-en_US.UTF-8}"

# Editor: Neovim everywhere, plain vim as a fallback.
if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"

# Homebrew (macOS). Apple Silicon first, then Intel.
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# PATH additions, each only if the directory exists and is not already present.
_dot_path_add() {
  [ -d "$1" ] || return 0
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1:$PATH" ;;
  esac
}
_dot_path_add "$HOME/.local/bin"
_dot_path_add "$HOME/.docker/bin"
_dot_path_add "$HOME/.cargo/bin"
_dot_path_add "$HOME/go/bin"
unset -f _dot_path_add
export PATH
