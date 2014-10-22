#!/bin/sh

IMAGE_NAME="postgres:9.4"
SERVER_NAME="dbserver"

echo "== Trying to download docker image for ${IMAGE_NAME}..."
docker pull ${IMAGE_NAME}

echo "== Killing all existing containers"
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

echo "== Launching postgreSQL image and waiting 10 seconds (avec redirection du port 5432=>5432)..."
docker run --name ${SERVER_NAME}  -p 5432:5432 -d ${IMAGE_NAME}
sleep 10 

echo "== Running the sql script to create all objects"
docker run --link ${SERVER_NAME}:db -ti -v /vagrant:/vagrant ${IMAGE_NAME} sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -f /vagrant/simple-db/comptes.sql'