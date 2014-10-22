#!/bin/sh

SERVER_PG_NAME="dbserver"

echo "== Killing all existing containers"
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

#https://registry.hub.docker.com/u/helmi03/docker-postgis/

#echo "== Build de limage postgis"
#docker build -t postgis:2.1 github.com/helmi03/docker-postgis.git
#echo "== Lancement du démon Postgis (redirection port 5432)"
#docker run --name ${SERVER_NAME} -d  -p 5432:5432 postgis:2.1

echo "== Recupration de l image pg/pgis"
docker pull jamesbrink/postgresql
echo "== Lancement du serveur (redirection port 5432)"
docker run --name ${SERVER_NAME} -d  -p 5432:5432 jamesbrink/postgresql

#docker pull kartoza/geoserver
