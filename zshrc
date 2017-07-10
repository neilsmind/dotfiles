# Path to your oh-my-zsh installation.
export ZSH=/Users/neil/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gem rails rand-quote docker)

# User configuration
export PATH="/Users/neil/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:node_modules/.bin:`yarn global bin`"
eval "$(nodenv init -)"

source $ZSH/oh-my-zsh.sh
source "$HOME/.console/console.rc" 2>/dev/null

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias b="dcr web bundle"
alias bi="b install"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias rails="be rails"
alias rake="be rake"
alias guard="be guard"

alias prettyjson='python -mjson.tool'

alias dc='docker-compose'
alias dcr='docker-compose run --rm'
alias dbstart='docker run -p 8000:8000 -d --rm --name dynamodb-localhost -v ~/.docker/volumes/dynamodb:/var/dynamodb_data ryanratcliff/dynamodb'
alias dbstop='docker stop dynamodb-localhost'

alias g="git"
alias gb="git branch -a -v"
alias gc="git commit -v"
alias gco="git checkout"
alias gca="git commit -v -a"
alias gd="git diff"
alias gl="git pull"
alias glr="git pull --rebase"
alias gf="git fetch"
alias gp="git push"
alias gs="git status -sb"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Source local extra (private) settings specific to machine if it exists
[ -f ~/.zsh.local ] && source ~/.zsh.local

eval "$(direnv hook zsh)"

eval "$(hub alias -s)"
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
