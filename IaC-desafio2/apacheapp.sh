#!/bin/bash

	echo "Atualizando o servidor..."
	apt update
	apt upgrade -y

	echo "Instalando o Apache..."
	apt install apache2 -y

	echo "Instalando o Unzip..."
	apt install unzip -y

	echo "Baixando a aplicação..."
	cd /tmp/
	wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
	unzip main.zip

	echo "Copiando arquivos para o Apache..."
	cd linux-site-dio-main
	cp -r * /var/www/html/


