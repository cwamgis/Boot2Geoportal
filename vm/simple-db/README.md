simple-db
=========

Introduction
------------

This tiny project will makes you begin with a [Vagrant](https://vagrantup.com) + [Docker](https://docker.com/) stack.

The goal is to run a [PostgreSQL](http://www.postgresql.org/) database server, and run some requests onto this database, from a command line client.

How to run ?
------------

At first, launch the vagrant box, and connect to it thru SSH :
```
$ vagrant up
.....
$ vagrant ssh
...
```

Once inside the VM, fetch the [Docker's official PostgreSQL image](https://registry.hub.docker.com/_/postgres/) :
```
docker pull postgres:9.4
```

Then, launch the database server and see it has well strated using the logs :
```
docker run --name dbserver -d postgres:9.4
docker logs dbserver
```

Finally, launch a psql command line and connect it to the server :
```
$ docker run --link dbserver:db -ti postgres:9.4 sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres'
```

Goal
----

The goal of this exercise is to create a table "account" inside a new database "dab", which has 2 columns : 
* accountid : primary key, integer value , auto-incremented
* accountbalance : integer value

Then create two accounts : one empty (0 in  balance), and one with positive value (whatever you want)

[Click here for SQL's solution](solution.md)
