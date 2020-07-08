#!/bin/bash
#Criado por Diego Duarte 2020

#Variáveis PPA --------------------------------------------------------------------------------------------#

PPA_QBITORRENT="ppa:qbittorrent-team/qbittorrent-stable"

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_TEAMVIEWER="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"

#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_EMAGE="https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"

#Variáveis de pasta ---------------------------------------------------------------------------------------#

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"

echo "Adicionando PPA ao Sistema"

#Adicionando PPA ------------------------------------------------------------------------------------------#

sudo apt-add-repository "$PPA_QBITORRENT"

#Atualizando o repositório --------------------------------------------------------------------------------#

sudo apt update -y

#Download DEB ---------------------------------------------------------------------------------------------#

mkdir "$DEB"

wget -c "$URL_CHROME"     -P "$DEB"
wget -c "$URL_TEAMVIEWER" -P "$DEB"

sudo dpkg -i $DEB/*.deb

#Download App Image ---------------------------------------------------------------------------------------#

mkdir "$APPIMAGE"

#Instala os apps via repositório --------------------------------------------------------------------------#

#PPA
apt-get install qbittorrent -y

#Flatpak --------------------------------------------------------------------------------------------------#

flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.inkscape.Inkscape -y