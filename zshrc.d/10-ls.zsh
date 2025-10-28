# --- Smart ls family: prefer eza or lsd, else sensible ls defaults ---
if command -v eza >/dev/null 2>&1; then
  # eza is a modern ls replacement
  alias ls='eza --group-directories-first --classify'
  alias l='eza -1 --group-directories-first'
  alias ll='eza -lh --group-directories-first --git'
  alias la='eza -lha --group-directories-first --git'
  alias lt='eza -lh --group-directories-first --git --sort=modified'
  alias tree='eza --tree --level=2'
else
  # Portable ls defaults
  if [[ "$OSTYPE" == darwin* ]]; then
    # macOS BSD ls
    alias ls='ls -G'                    # color
    alias l='ls -1'
    alias ll='ls -lh'                   # human sizes
    alias la='ls -lha'                  # your "la" favorite
    alias lt='ls -lht'                  # sort by time, newest first
  else
    # GNU ls (most Linux)
    alias ls='ls --color=auto'
    alias l='ls -1 --group-directories-first'
    alias ll='ls -lh --group-directories-first'
    alias la='ls -lha --group-directories-first'
    alias lt='ls -lht --group-directories-first'
  fi
  # simple tree fallback if no eza/lsd
  command -v tree >/dev/null 2>&1 || alias tree='find . -maxdepth 2 -print'
fi