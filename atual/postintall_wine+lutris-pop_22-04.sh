#!/bin/bash

#Criado por Diego Duarte 2020 - 2022
#Instala ultima versão wine e lutris POP OS 22.04
#Link do projeto no Github https://github.com/odiegoduarte/postinstall

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

export NEWT_COLORS='
window=,black
border=white,black
textbox=white,black
button=black,white
'
whiptail ...
 {
    for ((i = 0 ; i <= 100 ; i+=7)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge " Iniciando o instalador Wine + Lutris " 7 60 0

HEIGHT=17
WIDTH=50
CHOICE_HEIGHT=6
BACKTITLE="Instalador do Wine + Lutris"
TITLE="Instalador do Wine + Lutris"
MENU="Escolha uma das seguintes opções:"

OPTIONS=(
         1 "Instalar Wine + Lutris"
         2 "Instalar Wine"
         3 "Instalar Lutris"
         5 "Sair"
         )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in

        1)

echo -e        
print_centered "Instalando Wine"
echo -e

#Remove trava APT
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Atualiza o sistema
sudo apt-get update
sudo apt-get upgrade

#Instala Lutris
sudo apt install lutris -y

# Lib Vulkan NVIDIA
sudo apt install libvulkan1 libvulkan1:i386 -y

# Wine
sudo dpkg --add-architecture i386 -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo mv winehq.key /usr/share/keyrings/winehq-archive.key

# Wine Adicionando repositorio Ubuntu, PopOS! e etc 22.04
wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo mv winehq-jammy.sources /etc/apt/sources.list.d/

sudo apt update -y

sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y
sudo apt install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y


echo -e

read

           ;;
             
#-------------------------------------------------------------------------------#
        
        2)

print_centered "Instalando Wine"
echo -e

#Remove trava APT
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Atualiza o sistema
sudo apt-get update
sudo apt-get upgrade

# Lib Vulkan NVIDIA
sudo apt install libvulkan1 libvulkan1:i386 -y

# Wine
sudo dpkg --add-architecture i386 -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo mv winehq.key /usr/share/keyrings/winehq-archive.key

# Wine Adicionando repositorio Ubuntu, PopOS! e etc 22.04
wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo mv winehq-jammy.sources /etc/apt/sources.list.d/

sudo apt update -y

sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y
sudo apt install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y


echo -e

            ;;
#-------------------------------------------------------------------------------#
        
        3)

print_centered "Instalando Lutris"
echo -e

sudo apt install lutris


            ;;

#-------------------------------------------------------------------------------#

        5)
exit
            ;;                      
esac