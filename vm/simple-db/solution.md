Simple-db Solution
==================

You'll find here a basic solution for the simple-db exercice.
All this pages assumes that you are inside the psql command, connected to a database server.

Note that you can also run the script "run.sh" on Linux to automatize all :)


Golden rules for psql interactive command
-----------------------------------------

* Don't forget the ';' at the end of your lines !
* When referencing a postgres object (a sequence for example), use the simple quote (') char 


The solution !
--------------

* First, we have to create a new database and jump into database in order to isolate our actions :
```
postgres#= CREATE DATABASE dab;
postgres#= \c dab
dab#=
```

* Then we have to create a sequence, in order to auto-increment the account's ids :
```
dab#= CREATE SEQUENCE serial;
dab#= SELECT nextval('serial');
...
1
...
dab#= SELECT nextval('serial');
...
2
...
```

* Create the table with its data structure (columns), and insert the rows into :
```
dab#= CREATE TABLE comptes (compteid integer PRIMARY KEY DEFAULT nextval('serial'), comptebbalance integer);
dab#= INSERT INTO comptes (comptebbalance) VALUES('0');
dab#= INSERT INTO comptes (comptebbalance) VALUES('400');
```

* Finally, view your table content :
```
dab#= SELECT * FROM comptes;
```
