#!/bin/sh

########################## Parametres connexion geoserver ###############################
# login : admin
# mot de passe : geoserver
#########################################################################################

SERVER_PG_NAME="dbserver"
LOGIN_PG=postgres
PASSWD_PG=postgres
SERVER_CARTO_NAME="geoserver"

echo "== Killing all existing containers"
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

echo "Recuperation de l image jamesbrink/postgresql"
docker pull jamesbrink/postgresql
echo "== Lancement du serveur PG (redirection port 5432:5432)"

docker run --name ${SERVER_PG_NAME} -d  -p 5432:5432  -e USERNAME=${LOGIN_PG} -e PASS=${PASSWD_PG} jamesbrink/postgresql

echo "== Recuperation de l image geoserver kartoza/geoserver..."
docker pull kartoza/geoserver
echo "== Lancement de Geoserver (redirection du port 8080=>8080) avec un lien sur le conteneur Postgres..."
docker run --name ${SERVER_CARTO_NAME} --link ${SERVER_PG_NAME}:postgis  -d -p 8080:8080 kartoza/geoserver

echo "=======   Adresse IP du SGBD Postgres   =========="
docker inspect  ${SERVER_PG_NAME} | grep "IPAddress" | cut -d: -f2 | cut -d, -f1| cut -d\" -f2

echo "=======   Creation de la base de données Postgis entrepot avec insertion Geofla 2013 Communes France Métropolitaine (IGN) , ville de Cognac =========="
docker run --link ${SERVER_PG_NAME}:db -ti -v /vagrant:/vagrant jamesbrink/postgresql sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres  -f /vagrant/donnees_boot2geoportal/bd_postgis.sql'

# Scénario 2
# Aide sur https://registry.hub.docker.com/u/kartoza/geoserver/

