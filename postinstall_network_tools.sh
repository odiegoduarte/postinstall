#!/bin/bash

# Criado por Diego Duarte 2020 - 2021
# Esse Shell Script criado com base no Linux Mint 20 LTS.
# Link do projeto no Github https://github.com/odiegoduarte/postinstall


#Variáveis PPA

#Variáveis.deb

#Variáveis AppImage

#Variáveis de pasta

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"

#Removendo travas do APT

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA

#Atualizando o repositório

sudo apt update -y

#Download DEB

mkdir "$DEB"

wget -c "$URL_NOME_PACOTE_DEB"     -P "$DEB"

sudo dpkg -i $DEB/*.deb
sudo apt-get install -f -y

#Download App Image

mkdir "$APPIMAGE"

#Instala os apps via repositório

#PPA de terceiros

#PPA

#Flatpak

#Atualização e limpeza do sistema

flatpak update

flatpak uninstall --unused -y

sudo apt update -y
sudo apt autoremove -y
sudo apt autoclean -y

echo Instalação finalizada !