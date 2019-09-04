# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
PATH="$PATH:$(yarn global bin)"
PATH="$PATH:$(npm -g bin)"

export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='code'
else
  export EDITOR='mvim'
fi

alias dynamodb-start="docker run -d --rm -p 8000:8000 -v ~/.dynamodb/data:/var/dynamodb_data --network lambda-local --name dynamodb cnadiminti/dynamodb-local"
alias dynamodb-stop="docker stop dynamodb"

alias mysql-start="docker run -d --rm -p 3306:3306 -v ~/.mysql/data:/var/lib/mysql --name mysql mysql"
alias mysql-stop="docker stop mysql"

alias httpd-start="docker run -d --rm -p 80:80 -p 443:443 -v \"$PWD\":/var/www/html --name httpd"
alias httpd-stop="docker stop httpd"

alias elasticsearch-start="docker run -d --rm -p 9200:9200  -v ~/.elasticsearch/data:/usr/share/elasticsearch/data -e \"http.host=0.0.0.0\" -e \"transport.host=127.0.0.1\" -e \"xpack.security.enabled=false\" --name elasticsearch docker.elastic.co/elasticsearch/elasticsearch:5.5.2"
alias elasticsearch-stop="docker stop elasticsearch"

alias dejavu-start="docker run -p 1358:1358 -d --name dejavu appbaseio/dejavu"
alias dejavu-stop="docker stop dejavu"

alias jenkins-start="docker run -d --rm -p 8080:8080 -p 50000:50000 -v ~/.jenkins:/var/jenkins_home --name jenkins jenkins/jenkins:latest"
alias jenkins-stop="docker stop jenkins"

alias postgres-start="docker run --rm -d -p 5432:5432 -v ~/.postgres/data:/var/lib/postgresql/data --name postgres postgres:9.5"
alias postgres-stop="docker stop postgres"

alias bfg="java -jar ~/Library/BFG/bfg-1.12.16.jar"

alias s3="aws s3"
alias cloudformation="aws cloudformation"

if [ `which hub 2> /dev/null` ]; then
  alias git="hub"
fi

eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(nodenv init -)"

source "$HOME/.oh-my-zsh/themes/agnoster.zsh-theme"
