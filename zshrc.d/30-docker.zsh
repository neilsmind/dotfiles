alias dynamodb-start="docker run -d --rm -p 8000:8000 -v ~/.dynamodb/data:/var/dynamodb_data --network lambda-local --name dynamodb cnadiminti/dynamodb-local"
alias dynamodb-stop="docker stop dynamodb"

alias mysql-start="docker run -d --rm -p 3306:3306 -v ~/.mysql/data:/var/lib/mysql --name mysql mysql"
alias mysql-stop="docker stop mysql"

alias httpd-start="docker run -d --rm -p 80:80 -p 443:443 -v \"$PWD\":/var/www/html --name httpd"
alias httpd-stop="docker stop httpd"

alias elasticsearch-start="docker run -d --rm -p 9200:9200  -v ~/.elasticsearch/data:/usr/share/elasticsearch/data -e \"http.host=0.0.0.0\" -e \"transport.host=127.0.0.1\" -e \"xpack.security.enabled=false\" --name elasticsearch docker.elastic.co/elasticsearch/elasticsearch:9.0.1"
alias elasticsearch-stop="docker stop elasticsearch"

alias dejavu-start="docker run -p 1358:1358 -d --name dejavu appbaseio/dejavu"
alias dejavu-stop="docker stop dejavu"

alias postgres-start="docker run --rm -d -p 5432:5432 -v ~/.postgres/data:/var/lib/postgresql/data --name postgres postgres:9.5"
alias postgres-stop="docker stop postgres"

alias mongo-start="docker run --rm -d -p 8081:8081 -v ~/.mongo/data:/var/lib/mongoql/data --name mongo mongo:8.0"
alias mongo-stop="docker stop mongo"
