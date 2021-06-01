#!/bin/bash

#Criado por Diego Duarte 2020 - 2021
#Esse Shell Script criado com base no POP! OS 20.04 LTS.
#Link do projeto no Github https://github.com/odiegoduarte/postinstall

{
    for ((i = 0 ; i <= 100 ; i+=7)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge "Iniciando o postinstall.sh" 6 50 0

if (whiptail --title " Seja bem-vindo(a)$(whoami) " --yesno "PostInstall é um simples shell script que foi criado para fazer instalação automatizada de programas no POP! OS 20.04 LTS.
No próximo passo irá te pedir a senha de usuário.
Deseja continuar ?" 10 60) then
    echo "Iniciando postinstall . . . "
else
    echo "Postinstall cancelado.$6 "
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

#Variáveis PPA --------------------------------------------------------------------------------------------#

PPA_NOME="ppa:nome_do_ppa/ppa"

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_NOME="https://link_do_app-deb64.deb"

#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_NOME="https://link_do_app-appimage.AppImage"

#Variáveis Personalização ---------------------------------------------------------------------------------#

#URL_NOME="ICONEX"

#Variáveis de pasta ---------------------------------------------------------------------------------------#

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"
ICONS="$HOME/.icons"
ICONSEX="$HOME/.icons/Extras"
THEMES="$HOME/.themes"

#Adicionando PPA ao Sistema --------------------------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Adicionando PPA ao Sistema"
print_centered "-"  "-" 

echo -e

#Removendo travas do APT -----------------------------------------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA ------------------------------------------------------------------------------------------#

sudo apt-add-repository "$NOME" -y

#Atualizando o repositório --------------------------------------------------------------------------------#

sudo apt update -y

#Baixando temas e icone -----------------------------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Baixando temas e icone"
print_centered "-"  "-" 

echo -e

#Personalização --------------------------------------------------------------------------------------------#

#wget -c "$URL_NOME"     -P "$PASTA"

#cd "$THEMES"
#tar -xvf *.tar.xz

#cd "$ICONS"
#unzip *.zip

#Baixando e instalando programas .DEB ----------------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando programas .DEB"
print_centered "-"  "-" 

echo -e

#Download DEB ---------------------------------------------------------------------------------------------#

mkdir "$DEB"

wget -c "$URL_NOME"     -P "$DEB"

#Instalando DEB ---------------------------------------------------------------------------------------------#

sudo dpkg -i $DEB/*.deb
sudo apt-get install -f -y

#Baixando e instalando programas AppImage ------------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando programas AppImage"
print_centered "-"  "-" 

echo -e

#Download App Image ---------------------------------------------------------------------------------------#

mkdir "$APPIMAGE"

wget -c "$URL_NOME"         -P "$APPIMAGE"

#Instalando programas dos PPA's --------------------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Instalando programas dos PPA's"
print_centered "-"  "-" 

echo -e

#Instala os apps via repositório ---------------------------------------------------------------------------#

#PPA de terceiros

sudo apt install nome-app -y

#PPA

sudo apt install nome-app -y

#Instalando programas em Flatpak ---------------------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Instalando programas em Flatpak"
print_centered "-"  "-" 

echo -e

#Flatpak --------------------------------------------------------------------------------------------------#

flatpak install flathub org.nome-app.APP -y


#Removendo programas --------------------------------------------------------------------------------------#

sudo apt remove nome-app -y

#Atualização e limpeza do sistema -------------------------------------------------------------------------#

flatpak update

flatpak uninstall --unused -y

sudo apt update -y
sudo apt autoremove -y
sudo apt autoclean -y

#Instalação finalizada ------------------------------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Instalação finalizada !"
print_centered "-"  "-" 

echo -e

#read