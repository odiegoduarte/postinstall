#!/bin/bash

#Criado por Diego Duarte 2020
#
# Informações
#

#------------------------------------Variáveis PPA---------------------------------------#

PPA_PULSE_EFFECTS"ppa:mikhailnov/pulseeffects"

#------------------------------------Variáveis.deb---------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

#---------------------------------Variáveis AppImage-------------------------------------#

URL_EMAGE"https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"

#-----------------------------------Variáveis de pasta------------------------------------#

DEB_DOWNLOADS="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"

#-------------------------------------Adicionando PPA------------------------------------ #

sudo apt-add-repository "$PPA_QBITORRENT"

#-------------------------------Atualizando o repositório---------------------------------#

sudo apt update -y

#--------------------------------------Download DEB-------------------------------------- #

mkdir "$DEB"
wget -c "$URL_CHROME"

#-----------------------------------Download App Image----------------------------------- #

mkdir "$APPIMAGE"

wget -c "$URL_EMAGE" -P "$Apps"

#-----------------------------------------DEB-------------------------------------------- #
apt-get install qbittorrent -y

#---------------------------------------Flatpak------------------------------------------ #

flatpak install flathub org.gimp.GIMP