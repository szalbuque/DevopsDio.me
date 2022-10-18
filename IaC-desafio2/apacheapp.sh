#!/bin/bash

if [ "$(id -u)" != "0" ]; then echo echo "Voce deve executar este script com poderes de root! " else 

	echo "Atualizando o servidor..."
	apt update
	apt upgrade -y

	echo "Instalando o Apache..."
	apt install apache2 -y

	echo "Instalando o Unzip..."
	apt install unzip -y

	echo "Clonando a aplicação..."
	cd /tmp/
	wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
	unzip main.zip

	echo "Copiando arquivos para o Apache..."
	cd linux-site-dio-main
	cp * /var/www/html/


fi