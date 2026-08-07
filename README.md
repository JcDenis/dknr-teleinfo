# README

[![Release](https://img.shields.io/docker/v/jcpd/dknr-teleinfo?color=lightblue)](https://hub.docker.com/r/jcpd/dknr-teleinfo)
[![License](https://img.shields.io/github/license/jcdenis/dknr-teleinfo?color=white)](https://github.com/JcDenis/dknr-teleinfo/blob/master/LICENSE)


## A propos

**dknr-teleinfo** est un projet consacré à la récupération et à l'exploitation des données de téléinformation d'un compteur électrique.

Il permet de collecter les informations transmises par la sortie Téléinformation Client (TIC), puis de les rendre disponibles pour leur consultation, leur traitement ou leur intégration dans un système domotique.

![Dashboard Screenshot](https://github.com/JcDenis/dknr-teleinfo/blob/master/dknr-teleinfo_screenshot.png)


## Fonctionnalités

- **Lecture de la téléinformation** provenant d'un compteur électrique compatible.
- **Décodage des trames TIC** et extraction des valeurs utiles.
- **Prise en charge des données énergétiques** telles que les index, la puissance et l'intensité.
- **Exploitation locale des mesures** pour le suivi de la consommation.
- **Intégration possible** dans une installation domotique ou un outil de supervision.


## Matériel requis

Le matériel exact dépend de l'installation, mais l'utilisation du projet nécessite généralement :

* un compteur électrique disposant d'une sortie TIC tel que le Linky.
* une interface matérielle compatible entre le compteur et la machine hôte tel qu'un clé USB TiC.
* une machine exécutant le logiciel docker.
* les droits d'accès au port USB correspondant.


## Installation

Utilisez le fichier docker-compose.yaml à la racine du dépôt en fournissant les variables d'environnement suivant :

* DKNR_USERNAME : login de l'interface node-red
* DKNR_PASSWORD : mot de passe de l'interface node-red
* DKNR_SECRET   : un mot secret pour encrypter les credits.
