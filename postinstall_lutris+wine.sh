#!/bin/bash

#Criado por Diego Duarte 2020
#Esse Shell Script criado com base no Linux Mint 20 LTS.
#Link do projeto Github https://github.com/odiegoduarte/postinstall

{
    for ((i = 0 ; i <= 100 ; i+=7)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge "Iniciando o instalador do Lutris e Wine" 6 50 0

if (whiptail --title " Seja bem-vindo(a)$(whoami) " --yesno "È um simples shell script que foi criado para fazer instalação automatizada do Lutris e Wine nos derivados do ubuntu 20.04 ex Xubuntu, Mint e etc.
No próximo passo irá te pedir a senha de usuário.
Deseja continuar ?" 10 60) then
    echo "Iniciando o instalador do Lutris + Wine . . . "
else
    echo "Instalação do Lutris e Wine cancelada.$6 "
fi

#Removendo travas do APT -------------------------------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock


echo "Instalando Lib Vukan"

#Lib Vukan Nvidia --------------------------------------------------------------------------------#

sudo apt install libvulkan1 libvulkan1:i386


#Lib Vukan AMD -----------------------------------------------------------------------------------#
#sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386


echo "Baixando e instalando o Lutris"

#Lutris PPA 

sudo add-apt-repository ppa:lutris-team/lutris -y
sudo apt-get update -y
sudo apt-get install lutris -y


echo "Baixando e instalando o Wine"

# Wine -------------------------------------------------------------------------------------------#

sudo dpkg --add-architecture i386 -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key -y

#PPA Ubuntu 20.04 e Mint 20 ----------------------------------------------------------------------#

sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'

sudo apt update -y
sudo apt-get install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y
sudo apt-get install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y

echo "Instalação finalizada !"