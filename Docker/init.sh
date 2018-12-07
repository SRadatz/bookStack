#!/bin/bash

#need to be in the folder with the files
cd /
mkdir vols/sql
mkdir vols/bookstack/uploads
mkdir vols/bookstack/storage

docker build -t sradatz/docit:latest .

docker network create bookstack_nw

docker run -d --net bookstack_nw  \
-e MYSQL_ROOT_PASSWORD=secret \
-e MYSQL_DATABASE=bookstack \
-e MYSQL_USER=bookstack \
-e MYSQL_PASSWORD=secret \
 --name="bookstack_db" \
 mysql:5.7.21

 docker run -d --net bookstack_nw  \
-e DB_HOST=bookstack_db:3306 \
-e DB_DATABASE=bookstack \
-e DB_USERNAME=bookstack \
-e DB_PASSWORD=secret \
-p 8080:80 \
 sradatz/docit:latest


docker run -d --net bookstack_nw -v /vols/sql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=bookstack -e MYSQL_USER=bookstack -e MYSQL_PASSWORD=secret --name="bookstack_db" mysql:5.7.21
docker run -d --net bookstack_nw -v /vols/bookstack/uploads:/var/www/bookstack/public/uploads -v /vols/bookstack/uploads:/var/www/bookstack/public/storage -e DB_HOST=bookstack_db:3306 -e DB_DATABASE=bookstack -e DB_USERNAME=bookstack -e DB_PASSWORD=secret -p 8080:80 --name="bookstack_app" sradatz/docit:latest
