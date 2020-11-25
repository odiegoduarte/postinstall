#!/bin/bash

# Criado por Diego Duarte 2020
# Template de instalação automatica em Shell Script.
# Link do projeto no Github https://github.com/odiegoduarte/postinstall

#Variáveis PPA --------------------------------------------------------------------------------------------#

 PPA_OBS="ppa:obsproject/obs-studio"
#
#
#

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
# 
# 
#

#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_EMAGE"https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"


#Variáveis Personalização ---------------------------------------------------------------------------------#

URL_QOGIR="https://raw.githubusercontent.com/vinceliuice/Qogir-theme/releases/Qogir-dark.tar.xz"
URL_PAPIRUS="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/master.zip"


#Variáveis de pasta ---------------------------------------------------------------------------------------#

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"
ICONS="$HOME/.icons"
THEMES="$HOME/.themes"

#Removendo travas do APT -----------------------------------------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA ------------------------------------------------------------------------------------------#

sudo apt-add-repository "$PPA_OBS" -y

#Atualizando o repositório --------------------------------------------------------------------------------#

sudo apt update -y

#Personalização -------------------------------------------------------------------------------------------#

wget -c "$URL_QOGIR"     -P "$THEMES"
wget -c "$URL_PAPIRUS"   -P "$ICONS"

cd "$THEMES"
tar -xvf *.tar.xz

cd "$ICONS"
unzip *.zip

#O comando cd é para acessar a pasta e os comandos "tar" e "unzip" são para extrair os arquivos compactados.


#Download DEB ---------------------------------------------------------------------------------------------#

mkdir "$DEB"
wget -c "$URL_CHROME"     -P "$DEB"

sudo dpkg -i $DEB/*.deb
sudo apt-get install -f -y

#Download AppImage ----------------------------------------------------------------------------------------#

mkdir "$APPIMAGE"

wget -c "$URL_EMAGE"       -P "$APPIMAGE"

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