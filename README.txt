 _ __ ___  __ _  __| |_ __ ___   ___ 
| '__/ _ \/ _` |/ _` | '_ ` _ \ / _ \
| | |  __/ (_| | (_| | | | | | |  __/
|_|  \___|\__,_|\__,_|_| |_| |_|\___|
=====================================

-VS 2015 :
==========
	- Ouvrir le Web.Config
	- Balise <connectionStrings>
	- Changer les deux connection Strings :
		<add name="DefaultConnection" connectionString="data source=<Votre instance>;initial catalog=IziWatch;integrated security=True" providerName="System.Data.SqlClient" />
		<add name="IziWatchEntities" connectionString="...;data source=<Votre instance>;initial catalog=IziWatch;integrated security=True;..." />
	
SQL Server :
============
	- Lancer le script iw.sql

Comptes utilisés :
==================

login	password	email		role
--------------------------------------------
root	password	root@epita.fr	0
admin	password	admin@epita.fr	1
user	password	user@epita.fr	2


NB: Les boutons "shared" de Facebook et les social cards (Facebook & twitter) 
    sont fonctionnels cependant il faut que le site soit hébérgé. 

Le token
