#!/bin/bash

# Criado por Diego Duarte 2020
# Template de instalação automatica em Shell Script.
# Esse template é apenas um modelo de como eu estruturei o meu sh e adicionei alguns exemplos.
# Sinta-se livre para modificar a forma que quizer


#Variáveis PPA --------------------------------------------------------------------------------------------#

PPA_QBITORRENT="ppa:qbittorrent-team/qbittorrent-stable"
#|-----------|  |--------------------------------------| 
#      |                         |
#      |                         |------ URL do seu PPA
#      | 
#      |------ Nome da váriavel que você vai usar no passo Adicionando ppa
#

#Variáveis.deb --------------------------------------------------------------------------------------------#
URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"


#Variáveis AppImage ---------------------------------------------------------------------------------------#
URL_EMAGE"https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"


#Variáveis de pasta ---------------------------------------------------------------------------------------#
DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"


#Adicionando PPA ------------------------------------------------------------------------------------------#
sudo apt-add-repository "$PPA_QBITORRENT" --sk

#Atualizando o repositório --------------------------------------------------------------------------------#

sudo apt update -y

#Download DEB ---------------------------------------------------------------------------------------------#

mkdir "$DEB"
wget -c "$URL_CHROME"     -P "$DEB"


sudo dpkg -i $DEB/*.deb

#Download App Image ---------------------------------------------------------------------------------------#

mkdir "$APPIMAGE"

wget -c "$URL_EMAGE"       -P "$APPIMAGE"

#Instala os apps via repositório --------------------------------------------------------------------------#

#PPA de terceiros
apt-get install qbittorrent -y

#PPA
apt-get install SimpleScreenRecorder -y


#Flatpak --------------------------------------------------------------------------------------------------#

flatpak install flathub org.gimp.GIMP -y

echo "Instalação finalizada !"