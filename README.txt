============================
============================
==  _ __ ___  __ _  __| |_ __ ___   ___  ==
== | '__/ _ \/ _` |/ _` | '_ ` _ \ / _ \      ==
== | | |  __/ (_| | (_| | | | | | |  __/        ==
== |_|  \___|\__,_|\__,_|_| |_| |_|\___|==
============================
============================


Compatibilit�
===
> Visual Studio 2015 et SQL Server 2012/2014


Consignes d'installation
===
> Liaison � la base de donn�e :
	> Dans le fichier Web.Config (racine du projet IziWatch), remplir les balises <connectionStrings></connectionStrings> avec (remplacer <Votre instance>) :
		<add name="DefaultConnection" connectionString="data source=<Votre instance>;initial catalog=IziWatch;integrated security=True" providerName="System.Data.SqlClient" />
		<add name="IziWatchEntities" connectionString="metadata=res://*/DataAccess.IziWatch.csdl|res://*/DataAccess.IziWatch.ssdl|res://*/DataAccess.IziWatch.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=<Votre instance>;initial catalog=IziWatch;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />

> Cr�ation de la base de donn�es :
	> Lancer SQL Management Studio et ex�cuter le script iw.sql (racine du rendu)
	
> Manipulations suppl�mentaires :
	> G�n�rer la solution
	> D�finir le projet "IziWatch" comme projet de d�marrage

	
Utilisation de l'application
===
> Identifiants des comptes :
	login		password		email					role
	----------------------------------------------------
	root		password		root@epita.fr			Root
	admin	password		admin@epita.fr		Admin
	user		password		user@epita.fr			User


Informations sur le d�veloppement
===
> Certaines fonctionnalit�s ont �t� d�velopp�es mais ne fonctionnent pas en local :
	> Bouton "Partager sur Facebook"
	> Les "Card" des r�seaux sociaux

> L'utilisation de l'API Facebook n�c�ssite l'obtention d'un certificat donnant acc�s � un token de connexion. Dans le cadre de ce projet, il �tait impossible d'obtenir ce certificat, il faut donc utiliser des tokens de test valable une demi-heure, pour utiliser les fonctionnalit�s de l'API Facebook.
Dans l'interface d'administration, un champs est disponible pour fournir un token de test. Celui-ci peut �tre obtenu � l'adresse https://developers.facebook.com/tools/explorer/?__mref=message_bubble en cliquant sur "GetToken" > "Get Page Access Token".

