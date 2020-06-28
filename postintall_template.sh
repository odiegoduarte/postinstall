#!/bin/bash

#Criado por Diego Duarte 2020
#Template de instalação automatica em Shell Script.

#Variáveis PPA
PPA_QBITORRENT="ppa:qbittorrent-team/qbittorrent-stable"

#Variáveis de .deb
URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

#Variáveis AppImage
URL_EMAGE"https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"

#Variáveis das pastas
DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"

#Adicionando PPA no sistema
sudo apt-add-repository "$PPA_QBITORRENT" --sk

#Atualizando o repositório
sudo apt update -y

#Download dos pacotes .deb
mkdir "$DEB"       
wget -c "$URL_CHROME"

#Instala todos os pacotes .deb da pasta.
sudo dpkg -i $DEB/*.deb

#Download App Image
mkdir "$APPIMAGE"
wget -c "$URL_EMAGE" -P "$Apps"

#Instala os apps via repositório
apt-get install qbittorrent -y

#Flatpak instala apps do flathub
flatpak install flathub org.gimp.GIMP