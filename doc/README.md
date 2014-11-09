Boot2Geoportal, 8 novembre 2014
R�gis C.
Ecole Nationale des Sciences G�ographiques
Etudiant Ing�nieur 3eme ann�e
Fili�re G�omatique et Technologies des Syst�mes d'Information
TP d'Architecture SI avec DDuportal
==========
Les scripts pr�sents dans ce repository permettent d'obtenir un "geoportail" utilisant geoserver et postgis sous forme de conteneurs docker tournant sur une machine virtuelle boot2docker
la proc�dure d�taill�e ici concerne une machine Windows sur laquelle sont install� Vagrant et Virtualbox.

==========
Arborescence
- doc 
pr�sent fichier + diagrammes vision utilisateur et "architecte"
- proxy
script de configuration d'un proxy
- vm
N�cessaire d'installation de Boot2GEoportal

==========
PROCEDURE D'UTILISATION

1- Lancer une invite de commande Windows

2- Si votre machine est derriere un proxy, �diter le fichier outils/param_proxy.bat et remplissez les adresses manquantes


3 Se placer dans vm et lancer run_vm.bat
et noter le num�ro � la suite de "5432 =>", il s'agit du port avec lequel vous pourrez vous connecter � Postgres depuis la machine hote Windows

3 bis . Si vous disposez d'un client ssh type putty, vous pourrez gagner en qualit� d'affichage, parametre de connexion : (port en principe 2222, � verifier selon le meme principe que postgres expliqu� au dessus, login : docker mot de passe : tcuser)

4- Se placer dans /vagrant (cd /vagrant/sh_boot2geoportal)

5- Lancer le script install_geoportail.sh
a) Noter l'adresse IP indiqu�e " Adresse IP du SGBD Postgres ", elle vous servira � cr�er l'entrepot postgis
b) Il vous faudra taper le mot de passe "postgres" pour la cr�ation de la base de donn�es 

Il se peut que l'affichage soit buggu�, dans ce cas noter l'adresse ip de postgres avec la commande suivante : 
docker inspect  dbserver | grep "IPAddress"

6- Depuis la machine hote Windows lancer un navigateur � l'adresse suivante : 
http://127.0.0.1:8080/geoserver/

7 - Se connecter avec les identifiants suivants : 
login : admin
mot de passe : geoserver

8- Cr�er l'entrepot de donn�es correspondant � la base de donn�es Postgis, pour cela (exemple sur creation_entrepot_geoserver.png): 
Cliquer sur Entrepots / Ajouter un nouvel entrepot / Postgis 
Nom de la source de donn�es : exemple entrepotBoot2Geoportal
host : l'adresse ip que vous avez not� au dessus
database : entrepot
user : postgres
passwd : postgres

Le reste par d�faut

Sauvegarder

9. Ajouter la couche communes d'ores et d�j� cr�e
Cliquer sur couches / Ajouter une nouvelle ressource
Choisir l'entrepot pr�cedemment cr��
La couche doit apparaitre dans la liste, cliquer sur publier
Cocher activ� / publi�
Ajouter la projection de la couche dans SRC des donn�es : EPSG:2154
Cliquer sur les liens permettant de calculer les emprises de maniere automatique depuis les donn�es
Cliquer sur sauvegarder

Il est �galement possible de cr�er une nouvelle couche depuis l'interface

10. Pr�visualiser la couche
Cliquer sur Pr�visualisation de la couche
Au niveau de la ligne cite:communes	communes, cliquer sur OpenLayers
La commune de Cognac apparait


