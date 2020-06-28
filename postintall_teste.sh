#!/bin/bash

#Criado por Diego Duarte 2020
#
# Informações
#

#------------------------------Variáveis PPA------------------------------#
PPA_PULSE_EFFECTS"ppa:mikhailnov/pulseeffects"


#------------------------------Variáveis.deb------------------------------#
URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"


#------------------------------Variáveis de pasta------------------------------#
DEB_DOWNLOADS="$HOME/Downloads/DEB"


#------------------------------Adicionando PPA------------------------------ #
sudo apt-add-repository "$PPA_QBITORRENT"



#deb
apt-get install qbittorrent -y

#Flatpak
flatpak install flathub org.gimp.GIMP