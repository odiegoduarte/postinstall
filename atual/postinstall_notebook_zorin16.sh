#!/bin/bash

#Criado por Diego Duarte 2020 - 2022
#Esse Shell Script criado para instalação automatizada dos programas que utilizo no meu dia a dia.
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
} | whiptail --gauge " Iniciando postinstall ZorinOS 16 Notebook" 7 60 0

HEIGHT=17
WIDTH=50
CHOICE_HEIGHT=6
BACKTITLE="postinstall ZorinOS 16"
TITLE="postinstall ZorinOS 16"
MENU="Escolha uma das seguintes opções:"

OPTIONS=(
         1 "Instalar todos os programas"
         2 "Instalar apenas programas flatpak"
         3 "Instalar driver NVIDIA 390"
         4 "Instalar driver Bluetooth RT3290"
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
print_centered "Instalando todos os programas"
echo -e

#Variáveis PPA --------------------------------------------------------------------------------------------#

PPA_BT="ppa:blaze/rtbth-dkms"

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_NOMACHINE="https://download.nomachine.com/download/7.9/Linux/nomachine_7.9.2_1_amd64.deb"
URL_ANGRYIP="https://github.com/angryip/ipscan/releases/download/3.8.2/ipscan_3.8.2_amd64.deb"
URL_EMAGE="https://github.com/douglasjunior/emage/releases/download/1.1.0/emage_1.1.0_amd64.deb"
URL_QLIGHT="https://www.qlcplus.org/downloads/4.12.4/qlcplus_4.12.4_amd64.deb"
URL_DRAWIO="https://github.com/jgraph/drawio-desktop/releases/download/v19.0.3/drawio-amd64-19.0.3.deb"

#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_SHOWPLAYER="https://github.com/FrancescoCeruti/linux-show-player/releases/download/v0.5.2/LinuxShowPlayer-v0.5.2-x86_64.AppImage"
URL_REAPER="https://www.reaper.fm/files/6.x/reaper660_linux_x86_64.tar.xz"
URL_FONTBASE="https://releases.fontba.se/linux/FontBase-2.17.5.AppImage"
URL_BUTTERCUP="https://github.com/buttercup/buttercup-desktop/releases/download/v2.14.2/Buttercup-linux-x86_64.AppImage"

#Variáveis de pasta ---------------------------------------------------------------------------------------#

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"
ICONS="$HOME/.icons"
THEMES="$HOME/.themes"

echo -e

print_centered "-"  "-" 
print_centered "Adicionando PPA ao Sistema"
print_centered "-"  "-" 

echo -e

#Removendo travas do APT -------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA ---------------------------------------------------------#

sudo apt-add-repository "$PPA_BT" -y

#Atualizando o repositório -----------------------------------------------#

sudo apt update -y

#Download DEB ------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando programas .DEB"
print_centered "-"  "-" 

echo -e

mkdir "$DEB"

wget -c "$URL_CHROME"     -P "$DEB"
wget -c "$URL_NOMACHINE"  -P "$DEB"
wget -c "$URL_ANGRYIP"    -P "$DEB"
wget -c "$URL_EMAGE"      -P "$DEB"
wget -c "$URL_QLIGHT"     -P "$DEB"
wget -c "$URL_DRAWIO"     -P "$DEB"

sudo dpkg -i $DEB/*.deb
sudo apt-get install -f -y

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando programas AppImage"
print_centered "-"  "-" 

echo -e

#Download App Image ----------------------------------------------------------#

mkdir "$APPIMAGE"

wget -c "$URL_SHOWPLAYER"  -P "$APPIMAGE"
wget -c "$URL_REAPER"      -P "$APPIMAGE"
wget -c "$URL_FONTBASE"    -P "$APPIMAGE"
wget -c "$URL_BUTTERCUP"   -P "$APPIMAGE"

echo -e

print_centered "-"  "-" 
print_centered "Instalando programas via PPA's"
print_centered "-"  "-" 

echo -e

#Instala os apps via repositório -----------------------------------------------#

#PPA de terceiros

sudo apt install rtbth-dkms -y

#PPA

sudo apt install linssid -y
sudo apt install SimpleScreenRecorder -y
sudo apt install steam -y
sudo apt install p7zip-full -y
sudo apt install adb -y
sudo apt install scrcpy -y
sudo apt install git -y
sudo apt install stacer -y
sudo apt install synaptic -y

echo -e

print_centered "-"  "-" 
print_centered "Iinstalando programas em Flatpak"
print_centered "-"  "-" 

echo -e

#Flatpak -------------------------------------------------------------------------#

flatpak install -y --noninteractive flathub org.gimp.GIMP
flatpak install -y --noninteractive flathub org.gimp.GIMP.Plugin.GMic
flatpak install -y --noninteractive flathub org.gimp.GIMP.Plugin.Resynthesizer
flatpak install -y --noninteractive flathub org.inkscape.Inkscape
flatpak install -y --noninteractive flathub org.audacityteam.Audacity
flatpak install -y --noninteractive flathub org.kde.kdenlive
flatpak install -y --noninteractive flathub org.mixxx.Mixxx
flatpak install -y --noninteractive flathub org.gnome.glabels-3
flatpak install -y --noninteractive flathub net.sourceforge.projectM
flatpak install -y --noninteractive flathub org.telegram.desktop
flatpak install -y --noninteractive flathub org.qbittorrent.qBittorrent
flatpak install -y --noninteractive flatpak install flathub in.srev.guiscrcpy
flatpak install -y --noninteractive flatpak install flathub com.github.tchx84.Flatseal
flatpak install -y --noninteractive flatpak install flathub com.anydesk.Anydesk
flatpak install -y --noninteractive flatpak install flathub com.discordapp.Discord
flatpak install -y --noninteractive flatpak install flathub com.virustotal.VirusTotalUploader

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

read

           ;;
             
#-------------------------------------------------------------------------------#
        
        2)

print_centered "Instalando programas do flathub"
echo -e

flatpak install -y --noninteractive flathub org.gimp.GIMP
flatpak install -y --noninteractive flathub org.gimp.GIMP.Plugin.GMic
flatpak install -y --noninteractive flathub org.gimp.GIMP.Plugin.Resynthesizer
flatpak install -y --noninteractive flathub org.inkscape.Inkscape
flatpak install -y --noninteractive flathub org.audacityteam.Audacity
flatpak install -y --noninteractive flathub org.kde.kdenlive
flatpak install -y --noninteractive flathub org.mixxx.Mixxx
flatpak install -y --noninteractive flathub org.gnome.glabels-3
flatpak install -y --noninteractive flathub net.sourceforge.projectM
flatpak install -y --noninteractive flathub org.telegram.desktop
flatpak install -y --noninteractive flathub org.qbittorrent.qBittorrent
flatpak install -y --noninteractive flatpak install flathub in.srev.guiscrcpy
flatpak install -y --noninteractive flatpak install flathub com.github.tchx84.Flatseal

            ;;

#-------------------------------------------------------------------------------#
        
        3)

print_centered "Instalando driver NVIDIA 390"
echo -e
sudo apt install nvidia-driver-390

             ;;
                     
#-------------------------------------------------------------------------------#
        
        4)

print_centered "Instalando driver Bluetooth RT3290"
echo -e

sudo apt-add-repository ppa:blaze/rtbth-dkms
sudo apt install rtbth-dkms -y

             ;; 

#-------------------------------------------------------------------------------#

        5)
exit
            ;;                      
esac