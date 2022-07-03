#!/bin/bash

#Criado por Diego Duarte 2020 - 2022
#Esse Shell Script criado com base no POP! OS 20.04 LTS.
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
} | whiptail --gauge " Iniciando postinstall Pop!_OS 20.04" 7 60 0

HEIGHT=17
WIDTH=50
CHOICE_HEIGHT=6
BACKTITLE="postinstall Pop!_OS 20.04"
TITLE="postinstall Pop!_OS 20.04"
MENU="Escolha uma das seguintes opções:"

OPTIONS=(
         1 "Instalar todos os programas"
         2 "Instalar apenas programas flatpak"
         3 "Sair"
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

#Variáveis PPA --------------------------------------------------------------------------------------------#

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_NOMACHINE="https://download.nomachine.com/download/7.6/Linux/nomachine_7.6.2_4_amd64.deb"
URL_ANGRYIP="https://github.com/angryip/ipscan/releases/download/3.8.2/ipscan_3.8.2_amd64.deb"
URL_DISCORD="https://dl.discordapp.net/apps/linux/0.0.18/discord-0.0.18.deb"
URL_GUILDED="https://www.guilded.gg/downloads/Guilded-Linux.deb"
URL_BINANCE="https://download.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb"
URL_MC="https://launcher.mojang.com/download/Minecraft.deb"
URL_PARSEC"https://builds.parsecgaming.com/package/parsec-linux.deb"


#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_SHOWPLAYER="https://github.com/FrancescoCeruti/linux-show-player/releases/download/v0.5.2/LinuxShowPlayer-v0.5.2-x86_64.AppImage"
URL_REAPER="https://www.reaper.fm/files/6.x/reaper662_linux_x86_64.tar.xz"
URL_FONTBASE="https://releases.fontba.se/linux/FontBase-2.17.5.AppImage"
URL_BUTTERCUP="https://github.com/buttercup/buttercup-desktop/releases/download/v2.14.2/Buttercup-linux-x86_64.AppImage"
URL_EMAGE="https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"
URL_MANAGER="https://github.com/Manager-io/Manager/releases/latest/download/Manager-linux-x64.AppImage"
URL_ASF="https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/5.1.0.8/ASF-linux-x64.zip"
URL_ZEROTIER="https://github.com/tralph3/ZeroTier-GUI/releases/download/v1.2.1/ZeroTier-GUI.zip"
URL_ITCHIO="https://itch.io/app/download?platform=linux"

#Variáveis Personalização ---------------------------------------------------------------------------------#

#URL_ICONSEX=""

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

wget -c "$URL_CHROME"     -P "$DEB"
wget -c "$URL_NOMACHINE"  -P "$DEB"
wget -c "$URL_ANGRYIP"    -P "$DEB"
wget -c "$URL_DISCORD"    -P "$DEB"
wget -c "$URL_GUILDED"    -P "$DEB"
wget -c "$URL_BINANCE"    -P "$DEB"
wget -c "$MC"             -P "$DEB"
wget -c "$PARSEC"         -P "$DEB"

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

wget -c "$URL_SHOWPLAYER"  -P "$APPIMAGE"
wget -c "$URL_REAPER"      -P "$APPIMAGE"
wget -c "$URL_FONTBASE"    -P "$APPIMAGE"
wget -c "$URL_BUTTERCUP"   -P "$APPIMAGE"
wget -c "$URL_EMAGE"       -P "$APPIMAGE"
wget -c "$URL_MANAGER"     -P "$APPIMAGE"
wget -c "$ASF"             -P "$APPIMAGE"
wget -c "$URL_ZEROTIER"    -P "$APPIMAGE"
wget -c "$URL_ITCHIO"      -P "$APPIMAGE"

#Instalando programas dos PPA's --------------------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Instalando programas dos PPA's"
print_centered "-"  "-" 

echo -e

#Instala os apps via repositório ---------------------------------------------------------------------------#

#PPA do sistema

sudo apt install SimpleScreenRecorder -y
sudo apt install virtualbox -y
sudo apt install p7zip-full -y
sudo apt install p7zip-rar -y
sudo apt install adb -y
sudo apt install git -y

#Games

sudo apt install steam -y
sudo apt install lutris -y

#Instalando programas em Flatpak ---------------------------------------------------------------------------#

echo -e

print_centered "-"  "-" 
print_centered "Instalando programas em Flatpak"
print_centered "-"  "-" 

echo -e

#Flatpak --------------------------------------------------------------------------------------------------#

#LCS
flatpak install -y --noninteractive flatpak install flathub org.gimp.GIMP
flatpak install -y --noninteractive flatpak install flathub org.gimp.GIMP.Plugin.GMic
flatpak install -y --noninteractive flatpak install flathub org.kde.krita
flatpak install -y --noninteractive flatpak install flathub org.inkscape.Inkscape
flatpak install -y --noninteractive flatpak install flathub org.audacityteam.Audacity
flatpak install -y --noninteractive flatpak install flathub org.kde.kdenlive
flatpak install -y --noninteractive flatpak install flathub com.sweethome3d.Sweethome3d
flatpak install -y --noninteractive flatpak install flathub fr.handbrake.ghb
flatpak install -y --noninteractive flatpak install flathub com.github.Bleuzen.FFaudioConverter
#flatpak install -y --noninteractive flatpak install flathub org.ardour.Ardour

#Web
flatpak install -y --noninteractive flatpak install flathub com.brave.Browser
flatpak install -y --noninteractive flathub org.qbittorrent.qBittorrent
flatpak install -y --noninteractive flatpak install flathub com.anydesk.Anydesk
flatpak install -y --noninteractive flathub org.telegram.desktop
flatpak install -y --noninteractive flatpak install flathub com.teamspeak.TeamSpeak

#Tolls
flatpak install -y --noninteractive flatpak install flathub com.poweriso.PowerISO
flatpak install -y --noninteractive flatpak install flathub io.github.peazip.PeaZip
flatpak install -y --noninteractive flatpak install flathub org.freefilesync.FreeFileSync

#Live
flatpak install -y --noninteractive flatpak install flathub com.obsproject.Studio
flatpak install -y --noninteractive flatpak install flathub com.github.wwmm.pulseeffects
flatpak install -y --noninteractive flatpak install flathub io.github.Soundux
flatpak install -y --noninteractive flatpak install flathub in.srev.guiscrcpy

#Multimidia
flatpak install -y --noninteractive flathub com.spotify.Client
flatpak install -y --noninteractive flathub org.videolan.VLC

#Tools
flatpak install -y --noninteractive flatpak install flathub io.github.prateekmedia.appimagepool
flatpak install -y --noninteractive flatpak install flathub com.ultimaker.cura
flatpak install -y --noninteractive flatpak install flathub cc.arduino.IDE2
flatpak install -y --noninteractive flathub com.virustotal.VirusTotalUploader

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

read

           ;;
             
#-------------------------------------------------------------------------------#
        
        2)

print_centered "Instalando programas do flathub"
echo -e

#LCS
flatpak install -y --noninteractive flatpak install flathub org.gimp.GIMP
flatpak install -y --noninteractive flatpak install flathub org.gimp.GIMP.Plugin.GMic
flatpak install -y --noninteractive flatpak install flathub org.kde.krita
flatpak install -y --noninteractive flatpak install flathub org.inkscape.Inkscape
flatpak install -y --noninteractive flatpak install flathub org.audacityteam.Audacity
flatpak install -y --noninteractive flatpak install flathub org.kde.kdenlive
flatpak install -y --noninteractive flatpak install flathub com.sweethome3d.Sweethome3d
flatpak install -y --noninteractive flatpak install flathub fr.handbrake.ghb
flatpak install -y --noninteractive flatpak install flathub com.github.Bleuzen.FFaudioConverter
#flatpak install -y --noninteractive flatpak install flathub org.ardour.Ardour

#Web
flatpak install -y --noninteractive flatpak install flathub com.brave.Browser
flatpak install -y --noninteractive flathub org.qbittorrent.qBittorrent
flatpak install -y --noninteractive flatpak install flathub com.anydesk.Anydesk
flatpak install -y --noninteractive flathub org.telegram.desktop
flatpak install -y --noninteractive flatpak install flathub com.teamspeak.TeamSpeak

#Tolls
flatpak install -y --noninteractive flatpak install flathub com.poweriso.PowerISO
flatpak install -y --noninteractive flatpak install flathub io.github.peazip.PeaZip
flatpak install -y --noninteractive flatpak install flathub org.freefilesync.FreeFileSync

#Live
flatpak install -y --noninteractive flatpak install flathub com.obsproject.Studio
flatpak install -y --noninteractive flatpak install flathub com.github.wwmm.pulseeffects
flatpak install -y --noninteractive flatpak install flathub io.github.Soundux
flatpak install -y --noninteractive flatpak install flathub in.srev.guiscrcpy

#Multimidia
flatpak install -y --noninteractive flathub com.spotify.Client
flatpak install -y --noninteractive flathub org.videolan.VLC

#Tools
flatpak install -y --noninteractive flatpak install flathub io.github.prateekmedia.appimagepool
flatpak install -y --noninteractive flatpak install flathub com.ultimaker.cura
flatpak install -y --noninteractive flatpak install flathub cc.arduino.IDE2
flatpak install -y --noninteractive flathub com.virustotal.VirusTotalUploader
            ;;

                     

#-------------------------------------------------------------------------------#

        3)
exit
            ;;                      
esac