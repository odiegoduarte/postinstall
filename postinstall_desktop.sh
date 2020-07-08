#!/bin/bash

#Criado por Diego Duarte 2020

#Variáveis PPA

PPA_PULSE_EFFECTS="ppa:mikhailnov/pulseeffects"
PPA_QBITORRENT="ppa:qbittorrent-team/qbittorrent-stable"

#Variáveis.deb

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_TEAMVIEWER="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
URL_DISCORD="https://discord.com/api/download?platform=linux&format=deb"

#Variáveis AppImage

URL_EMAGE="https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"
URL_SCREENCLOUD="https://github.com/olav-st/screencloud/releases/download/v1.5.1/ScreenCloud-v1.5.1-x86_64.AppImage"

#Variáveis de pasta

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"

#Adicionando PPA

sudo apt-add-repository "$PULSE_EFFECTS"
sudo apt-add-repository "$PPA_QBITORRENT"

sudo apt update -y

#Download DEB
mkdir "$DEB"
wget -c "$URL_CHROME"     -P "$DEB"
wget -c "$URL_TEAMVIEWER" -P "$DEB"
wget -c "$URL_DISCORD"    -P "$DEB"

#Download App Image
mkdir "$APPIMAGE"
wget -c "$URL_EMAGE"       -P "$APPIMAGE"
wget -c "$URL_SCREENCLOUD" -P "$APPIMAGE"

#PPA
apt-get install qbittorrent -y
apt-get install pulseeffects -y
apt-get install SimpleScreenRecorder -y
apt-get install spotify -y
apt-get install steam -y

#Flatpak
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.inkscape.Inkscape -y
