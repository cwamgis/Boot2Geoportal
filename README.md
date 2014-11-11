Boot2Geoportal, 8 novembre 2014
Régis C.
Ecole Nationale des Sciences Géographiques
Etudiant Ingénieur 3eme année
Filière Géomatique et Technologies des Systèmes d'Information
TP d'Architecture SI avec DDuportal
==========
Les scripts présents dans ce repository permettent d'obtenir un "geoportail" utilisant geoserver et postgis sous forme de conteneurs docker tournant sur une machine virtuelle boot2docker
la procédure détaillée ici concerne une machine Windows sur laquelle sont installé Vagrant et Virtualbox.

==========
Arborescence
- doc 
présent fichier + diagrammes vision utilisateur et "architecte"
- proxy
script de configuration d'un proxy
- vm
Nécessaire d'installation de Boot2GEoportal

==========
PROCEDURE D'UTILISATION

1- Lancer une invite de commande Windows

2- Si votre machine est derriere un proxy, éditer le fichier outils/param_proxy.bat et remplissez les adresses manquantes


3 Se placer dans vm et lancer run_vm.bat
et noter le numéro à la suite de "5432 =>", il s'agit du port avec lequel vous pourrez vous connecter à Postgres depuis la machine hote Windows

3 bis . Si vous disposez d'un client ssh type putty, vous pourrez gagner en qualité d'affichage, parametre de connexion : (port en principe 2222, à verifier selon le meme principe que postgres expliqué au dessus, login : docker mot de passe : tcuser)

4- Se placer dans /vagrant (cd /vagrant/sh_boot2geoportal)

5- Lancer le script install_geoportail.sh
a) Noter l'adresse IP indiquée " Adresse IP du SGBD Postgres ", elle vous servira à créer l'entrepot postgis
b) Il vous faudra taper le mot de passe "postgres" pour la création de la base de données 

Il se peut que l'affichage soit buggué, dans ce cas noter l'adresse ip de postgres avec la commande suivante : 
docker inspect  dbserver | grep "IPAddress"

6- Depuis la machine hote Windows lancer un navigateur à l'adresse suivante : 
http://127.0.0.1:8080/geoserver/

7 - Se connecter avec les identifiants suivants : 
login : admin
mot de passe : geoserver

8- Créer l'entrepot de données correspondant à la base de données Postgis, pour cela (exemple sur creation_entrepot_geoserver.png): 
Cliquer sur Entrepots / Ajouter un nouvel entrepot / Postgis 
Nom de la source de données : exemple entrepotBoot2Geoportal
host : l'adresse ip que vous avez noté au dessus
database : entrepot
user : postgres
passwd : postgres

Le reste par défaut

Sauvegarder

9. Ajouter la couche communes d'ores et déjà crée
Cliquer sur couches / Ajouter une nouvelle ressource
Choisir l'entrepot précedemment créé
La couche doit apparaitre dans la liste, cliquer sur publier
Cocher activé / publié
Ajouter la projection de la couche dans SRC des données : EPSG:2154
Cliquer sur les liens permettant de calculer les emprises de maniere automatique depuis les données
Cliquer sur sauvegarder

Il est également possible de créer une nouvelle couche depuis l'interface

10. Prévisualiser la couche
Cliquer sur Prévisualisation de la couche
Au niveau de la ligne cite:communes	communes, cliquer sur OpenLayers
La commune de Cognac apparait


