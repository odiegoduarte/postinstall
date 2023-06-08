#!/bin/bash

#Criado por Diego Duarte 2020 - 2023
#Shell Script base
#Link do projeto no Github https://github.com/odiegoduarte/postinstall

#Print do texto centralizado

function print_centered {
     [[ $# == 0 ]] && return 1
     declare -i TERM_COLS="$(($(tput cols)))"
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

#Tela carregamento opcional

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
} | whiptail --gauge " Mensagem de Carregamento" 7 60 0

#MENU

HEIGHT=17
WIDTH=50
CHOICE_HEIGHT=6
BACKTITLE="Texto superior esquerdo"
TITLE="Titulo Centro"
MENU="Escolha uma das seguintes opções:"

OPTIONS=(
         1 "Menu 01"
         2 "Menu 02"
         3 "Menu 03"
         4 "Menu 04"
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
print_centered "Menu 01"
echo -e

#Variáveis PPA --------------------------------------------------------------------------------------------#

PPA_NOME="ppa:nome/repo"

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_NOME="URL .deb"


#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_NOME="URL .AppImage"

#Variáveis de pasta ---------------------------------------------------------------------------------------#

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"
# ICONS="$HOME/.icons"
# THEMES="$HOME/.themes"

echo -e

print_centered "-"  "-" 
print_centered "Adicionando PPA ao Sistema"
print_centered "-"  "-" 

echo -e

#Removendo travas do APT -------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA ---------------------------------------------------------#

sudo apt-add-repository "$PPA_NOME" -y

#Atualizando o repositório -----------------------------------------------#

sudo apt update -y

#Download DEB ------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando programas .DEB"
print_centered "-"  "-" 

echo -e

mkdir "$DEB"

wget -c "$URL_NOME"     -P "$DEB"


sudo dpkg -i "$DEB"/*.deb
sudo apt-get install -f -y

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando programas AppImage"
print_centered "-"  "-" 

echo -e

#Download App Image ----------------------------------------------------------#

mkdir "$APPIMAGE"

wget -c "$URL_NOME"  -P "$APPIMAGE"

echo -e

print_centered "-"  "-" 
print_centered "Instalando programas via PPA's"
print_centered "-"  "-" 

echo -e

#Instala os apps via repositório -----------------------------------------------#

#PPA de terceiros

sudo apt install nome_pacote -y

#PPA

#Apps do repositório oficial da distro
sudo apt install git -y

echo -e

print_centered "-"  "-" 
print_centered "Iinstalando programas em Flatpak"
print_centered "-"  "-" 

echo -e

#Flatpak -------------------------------------------------------------------------#

flatpak install -y --noninteractive flathub org.nome.GIMP


#Atualização e limpeza do sistema -----------------------------------------------#

#sudo apt remove nome-app -y

flatpak update

sudo apt update -y
sudo apt autoclean -y
sudo apt autoremove -y

echo -e

print_centered "-"  "-" 
print_centered "Instalação finalizada !"
print_centered "-"  "-" 

echo -e

read -r

           ;;
             
#-------------------------------------------------------------------------------#
        
        2)

print_centered "Menu 02"
echo -e

#
#Funções para o Menu 02 AQUI
#


            ;;

#-------------------------------------------------------------------------------#
        
        3)

print_centered "Menu 03"
echo -e

#
#Funções para o Menu 02 AQUI
#

             ;;
                     
#-------------------------------------------------------------------------------#
        
        4)

print_centered "Menu 04"
echo -e

#
#Funções para o Menu 04 AQUI
#
             ;; 

#-------------------------------------------------------------------------------#

        5)
exit
            ;;                      
esac