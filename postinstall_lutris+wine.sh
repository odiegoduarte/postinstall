#!/bin/bash

#Criado por Diego Duarte 2020 - 2021
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

function print_centered {
     [[ $# == 0 ]] && return 1

     declare -i TERM_COLS="$(tput cols)"
     declare -i str_len="${#1}"
     [[ $str_len -ge $TERM_COLS ]] && {
          echo "$1";
          return 0;
     }

     declare -i filler_len="$(( (TERM_COLS - str_len) / 2 ))"
     [[ $# -ge 2 ]] && ch="${2:0:1}" || ch=" "
     filler=""
     for (( i = 0; i < filler_len; i++ )); do
          filler="${filler}${ch}"
     done

     printf "%s%s%s" "$filler" "$1" "$filler"
     [[ $(( (TERM_COLS - str_len) % 2 )) -ne 0 ]] && printf "%s" "${ch}"
     printf "\n"

     return 0
}

#Removendo travas do APT -------------------------------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

echo -e

print_centered "-"  "-" 
print_centered "Instalando Lib Vukan"
print_centered "-"  "-" 

echo -e

#Lib Vukan Nvidia --------------------------------------------------------------------------------#

sudo apt install libvulkan1 libvulkan1:i386


#Lib Vukan AMD -----------------------------------------------------------------------------------#

#sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando o Lutris"
print_centered "-"  "-" 

echo -e

#Lutris PPA 

sudo add-apt-repository ppa:lutris-team/lutris -y
sudo apt-get update -y
sudo apt-get install lutris -y

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando o Wine"
print_centered "-"  "-" 

echo -e

# Wine -------------------------------------------------------------------------------------------#

sudo dpkg --add-architecture i386 -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key -y

#PPA Ubuntu 20.04 e Mint 20 ----------------------------------------------------------------------#

sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'

sudo apt update -y
sudo apt-get install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y
sudo apt-get install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y

echo -e

print_centered "-"  "-" 
print_centered "Instalação finalizada !"
print_centered "-"  "-" 

echo -e

#read