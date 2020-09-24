#!/bin/bash

# Criado por Diego Duarte 2020
# Template de instalação automatica em Shell Script.

#Variáveis PPA --------------------------------------------------------------------------------------------#

 PPA_OBS="ppa:obsproject/obs-studio"


#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"


#Variáveis de pasta ---------------------------------------------------------------------------------------#

DEB="$HOME/Downloads/DEB"


#Removendo travas do APT ----------------------------------------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA ------------------------------------------------------------------------------------------#

sudo apt-add-repository "$PPA_OBS" -y

#Atualizando o repositório --------------------------------------------------------------------------------#

sudo apt update -y

#Download DEB ---------------------------------------------------------------------------------------------#

mkdir "$DEB"
wget -c "$URL_CHROME"     -P "$DEB"

sudo dpkg -i $DEB/*.deb
sudo apt-get install -f -y

#Instala os apps via repositório --------------------------------------------------------------------------#

#PPA de terceiros
sudo apt install obs-studio -y

#PPA
apt-get install SimpleScreenRecorder -y


#Flatpak --------------------------------------------------------------------------------------------------#

flatpak install flathub org.gimp.GIMP -y

#Atualização e limpeza do sistema -------------------------------------------------------------------------#

flatpak update

sudo apt update -y
sudo apt autoclean -y
sudo apt autoremove -y

echo "Instalação finalizada !"