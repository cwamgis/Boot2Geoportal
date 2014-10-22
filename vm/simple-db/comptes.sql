CREATE DATABASE dab;
\c dab
CREATE SEQUENCE serial START 1;
CREATE TABLE comptes (compteid integer PRIMARY KEY DEFAULT nextval('serial'), comptebbalance integer);
INSERT INTO comptes (comptebbalance) VALUES('0');
INSERT INTO comptes (comptebbalance) VALUES('400');
SELECT * FROM comptes;