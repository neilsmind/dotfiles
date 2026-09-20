# Aliases shared by bash and zsh on every machine.

# Directories
alias ..='cd ..'
alias ...='cd ../..'

# ls family: prefer eza, else sensible ls defaults per platform.
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first --classify'
  alias l='eza -1 --group-directories-first'
  alias ll='eza -lh --group-directories-first --git'
  alias la='eza -lha --group-directories-first --git'
  alias lt='eza -lh --group-directories-first --git --sort=modified'
  alias tree='eza --tree --level=2'
else
  case "$(uname -s)" in
    Darwin)
      alias ls='ls -G'
      alias l='ls -1'
      alias ll='ls -lh'
      alias la='ls -lha'
      alias lt='ls -lht'
      ;;
    *)
      alias ls='ls --color=auto'
      alias l='ls -1 --group-directories-first'
      alias ll='ls -lh --group-directories-first'
      alias la='ls -lha --group-directories-first'
      alias lt='ls -lht --group-directories-first'
      ;;
  esac
  command -v tree >/dev/null 2>&1 || alias tree='find . -maxdepth 2 -print'
fi

# Git
alias gco='git checkout'

# Throwaway local services in containers. Each has a matching *-stop.
alias mongo-start='docker run --rm -d -p 27017:27017 -v ~/.mongo/data:/data/db --name mongo mongo:latest'
alias mongo-stop='docker stop mongo'

alias postgres-start='docker run --rm -d -p 5432:5432 -v ~/.postgres/data:/var/lib/postgresql/data --name postgres postgres:9.5'
alias postgres-stop='docker stop postgres'

alias mysql-start='docker run -d --rm -p 3306:3306 -v ~/.mysql/data:/var/lib/mysql --name mysql mysql'
alias mysql-stop='docker stop mysql'

alias dynamodb-start='docker run -d --rm -p 8000:8000 -v ~/.dynamodb/data:/var/dynamodb_data --network lambda-local --name dynamodb cnadiminti/dynamodb-local'
alias dynamodb-stop='docker stop dynamodb'

alias elasticsearch-start='docker run -d --rm -p 9200:9200 -v ~/.elasticsearch/data:/usr/share/elasticsearch/data -e "http.host=0.0.0.0" -e "transport.host=127.0.0.1" -e "xpack.security.enabled=false" --name elasticsearch docker.elastic.co/elasticsearch/elasticsearch:9.0.1'
alias elasticsearch-stop='docker stop elasticsearch'

alias dejavu-start='docker run -p 1358:1358 -d --name dejavu appbaseio/dejavu'
alias dejavu-stop='docker stop dejavu'

# Single quotes so $PWD expands when the alias runs, not when it is defined.
alias httpd-start='docker run -d --rm -p 80:80 -p 443:443 -v "$PWD":/var/www/html --name httpd httpd'
alias httpd-stop='docker stop httpd'
