# Functions shared by bash and zsh on every machine.

# Make a directory and cd into it.
mkcd() { mkdir -p -- "$1" && cd -- "$1" || return; }
