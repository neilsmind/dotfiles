export DEFAULT_USER=`whoami`
export LANG=en_US.UTF-8

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.docker/bin"
export PATH="$PATH:$(brew --prefix python)/libexec/bin"

# Initialize fnm (fast Node version manager)
eval "$(fnm env --use-on-cd)"

# Preferred editor for local and remote sessions
export EDITOR=$([[ -n $SSH_CONNECTION ]] && echo 'code' || echo 'mvim')

# Source all files in ~/.zshrc.d/
ZSHRC_D="$HOME/.zshrc.d"
if [ -d "$ZSHRC_D" ]; then
  setopt null_glob
  for f in "$ZSHRC_D"/*.zsh; do
    # shellcheck disable=SC1090
    source "$f"
  done
  unsetopt null_glob
fi

# Use hub if installed
if [ `which hub 2> /dev/null` ]; then
  alias git="hub"
fi

# Load personal overrides (ignored in Git)
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(starship init zsh)"

# Load cli completions
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit

setopt autocd # Change to a directory by typing its name
setopt nocaseglob # Case insensitive globbing
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive completion
