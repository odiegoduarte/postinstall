#!/bin/bash

#Criado por Diego Duarte 2020 - 2021
#Esse Shell Script criado com base no Linux Mint 20 LTS.
#Link do projeto no Github https://github.com/odiegoduarte/postinstall

{
    for ((i = 0 ; i <= 100 ; i+=7)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge "Iniciando o postinstall.sh" 6 50 0

if (whiptail --title " Seja bem-vindo(a)$(whoami) " --yesno "PostInstall é um simples shell script que foi criado para fazer instalação automatizada de programas no Linux Mint 20.04.
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

PPA_PULSE_EFFECTS="ppa:mikhailnov/pulseeffects"
PPA_OBS="ppa:obsproject/obs-studio"
PPA_NVIDIA="ppa:graphics-drivers/ppa"

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_OPERA="https://download3.operacdn.com/pub/opera/desktop/74.0.3911.218/linux/opera-stable_74.0.3911.218_amd64.deb"
URL_VIVALDI="https://downloads.vivaldi.com/stable/vivaldi-stable_3.8.2259.40-1_amd64.deb"
URL_TEAMVIEWER="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
URL_ANYDESK="https://download.anydesk.com/linux/anydesk_6.1.1-1_amd64.deb"
URL_NOMACHINE="https://download.nomachine.com/download/7.4/Linux/nomachine_7.4.1_1_amd64.deb"
URL_DISCORD="https://dl.discordapp.net/apps/linux/0.0.14/discord-0.0.14.deb"
URL_ANGRYIP="https://github.com/angryip/ipscan/releases/download/3.7.6/ipscan_3.7.6_amd64.deb"
URL_SKYPE="https://repo.skype.com/latest/skypeforlinux-64.deb"
URL_PEAZIP="https://github.com/peazip/PeaZip/releases/download/7.9.0/peazip_7.9.0.LINUX.x86_64.GTK2.deb"
URL_STACER="https://sourceforge.net/projects/stacer/files/v1.1.0/stacer_1.1.0_amd64.deb"
URL_VSCODE="https://az764295.vo.msecnd.net/stable/cfa2e218100323074ac1948c885448fdf4de2a7f/code_1.56.0-1620166262_amd64.deb"
URL_EMAGE="https://github.com/douglasjunior/emage/releases/download/1.1.0/emage_1.1.0_amd64.deb"
URL_BUTTERCUP="https://github.com/buttercup/buttercup-desktop/releases/download/v1.20.5/buttercup-desktop_1.20.5_amd64.deb"
#URL_WEBSOCKET"https://github.com/Palakis/obs-websocket/releases/download/4.8.0/obs-websocket-4.8.0-1_amd64.deb"
#URL_DECKBOARD"https://github.com/rivafarabi/deckboard/releases/download/v1.9.85/deckboard_1.9.85_amd64.deb"
URL_QLIGHT"https://www.qlcplus.org/downloads/4.12.3/qlcplus_4.12.3_amd64.deb"
URL_DRAWIO"https://github.com/jgraph/drawio-desktop/releases/download/v14.5.1/drawio-amd64-14.5.1.deb"

#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_SCREENCLOUD="https://github.com/olav-st/screencloud/releases/download/v1.5.3/ScreenCloud-v1.5.3-x86_64.AppImage"
URL_FONTBASE="https://releases.fontba.se/linux/FontBase-2.15.3.AppImage"
URL_SHOWPLAYER="https://github.com/FrancescoCeruti/linux-show-player/releases/download/v0.5.2/LinuxShowPlayer-v0.5.2-x86_64.AppImage"
URL_REAPER="https://dlcf.reaper.fm/6.x/reaper628_linux_x86_64.tar.xz"
URL_SWEETHOME3d="https://netactuate.dl.sourceforge.net/project/sweethome3d/SweetHome3D/SweetHome3D-6.5.2/SweetHome3D-6.5.2-linux-x64.tgz"
URL_FILESYNC="https://freefilesync.org/download/FreeFileSync_11.9_Linux.tar.gz"
URL_GUISCRCPY="https://github.com/srevinsaju/guiscrcpy/releases/download/v4.10.0/guiscrcpy-.dev.r.glibc2.27-x86_64.AppImage"
URL_ASF="https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/5.0.6.6/ASF-linux-x64.zip"
URL_POWERISO="https://www.poweriso.com/poweriso-x64-1.1.tar.gz"
URL_ZEROTIER="https://github.com/tralph3/ZeroTier-GUI/releases/download/v1.2.1/ZeroTier-GUI.zip"

#Variáveis Personalização ---------------------------------------------------------------------------------#

URL_QOGIR="https://raw.githubusercontent.com/vinceliuice/Qogir-theme/releases/Qogir-dark.tar.xz"
URL_PAPIRUS="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/master.zip"
#URL_ICONSEX=""

#Variáveis de pasta ---------------------------------------------------------------------------------------#

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"
ICONS="$HOME/.icons"
ICONSEX="$HOME/.icons/Extras"
THEMES="$HOME/.themes"

echo -e

print_centered "-"  "-" 
print_centered "Adicionando PPA ao Sistema"
print_centered "-"  "-" 

echo -e

#Removendo travas do APT -----------------------------------------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA ------------------------------------------------------------------------------------------#

sudo apt-add-repository "$PULSE_EFFECTS" -y
sudo apt-add-repository "$PPA_OBS" -y
sudo apt-add-repository "$PPA_NVIDIA" -y

#Atualizando o repositório --------------------------------------------------------------------------------#

sudo apt update -y

echo -e

print_centered "-"  "-" 
print_centered "Baixando temas e icone"
print_centered "-"  "-" 

echo -e

#Personalização --------------------------------------------------------------------------------------------#

wget -c "$URL_QOGIR"     -P "$THEMES"
wget -c "$URL_PAPIRUS"   -P "$ICONS"
#wget -c "$URL_ICONSEX"   -P "$ICONSEX"

cd "$THEMES"
tar -xvf *.tar.xz
#sudo rm "$THEMES" *.tar.xz

cd "$ICONS"
unzip *.zip
#sudo rm "$THEMES" *.zip

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando programas .DEB"
print_centered "-"  "-" 

echo -e

#Download DEB ---------------------------------------------------------------------------------------------#

mkdir "$DEB"

wget -c "$URL_CHROME"     -P "$DEB"
wget -c "$URL_OPERA"      -P "$DEB"
wget -c "$URL_VIVALDI"    -P "$DEB"
wget -c "$URL_TEAMVIEWER" -P "$DEB"
wget -c "$URL_ANYDESK"    -P "$DEB"
wget -c "$URL_NOMACHINE"  -P "$DEB"
wget -c "$URL_DISCORD"    -P "$DEB"
wget -c "$URL_ANGRYIP"    -P "$DEB"
wget -c "$URL_SKYPE"      -P "$DEB"
wget -c "$URL_PEAZIP"     -P "$DEB"
wget -c "$URL_STACER"     -P "$DEB"
wget -c "$URL_VSCODE"     -P "$DEB"
wget -c "$URL_EMAGE"      -P "$DEB"
wget -c "$URL_BUTTERCUP"  -P "$DEB"
wget -c "$URL_WEBSOCKET"  -P "$DEB"
wget -c "$URL_DECKBOARD"  -P "$DEB"
wget -c "$URL_QLIGHT"     -P "$DEB"
wget -c "$URL_DRAWIO"     -P "$DEB"

sudo dpkg -i $DEB/*.deb
sudo apt-get install -f -y

echo -e

print_centered "-"  "-" 
print_centered "Baixando e instalando programas AppImage"
print_centered "-"  "-" 

echo -e

#Download App Image ---------------------------------------------------------------------------------------#

mkdir "$APPIMAGE"

wget -c "$URL_SCREENCLOUD" -P "$APPIMAGE"
wget -c "$URL_FONTBASE"    -P "$APPIMAGE"
wget -c "$URL_SHOWPLAYER"  -P "$APPIMAGE"
wget -c "$URL_REAPER"      -P "$APPIMAGE"
wget -c "$URL_SWEETHOME3d" -P "$APPIMAGE"
wget -c "$URL_FILESYNC"    -P "$APPIMAGE"
wget -c "$URL_GUISCRCPY"   -P "$APPIMAGE"
wget -c "$URL_ASF"         -P "$APPIMAGE"
wget -c "$URL_POWERISO"    -P "$APPIMAGE"
wget -c "$URL_ZEROTIER"    -P "$APPIMAGE"



echo -e

print_centered "-"  "-" 
print_centered "Instalando programas dos PPA's"
print_centered "-"  "-" 

echo -e

#Instala os apps via repositório --------------------------------------------------------------------------#

#PPA de terceiros

sudo apt install pulseeffects -y
sudo apt install obs-studio -y

#PPA

sudo apt install filezilla -y
sudo apt install SimpleScreenRecorder -y
sudo apt install flameshot -y
sudo apt install darktable -y
sudo apt install audacity -y
sudo apt install spotify-client -y
sudo apt install steam -y
sudo apt install virtualbox -y
sudo apt install mint-meta-codecs -y
sudo apt install gparted -y
sudo apt install p7zip-full -y
sudo apt install psensor -y
sudo apt install hplip-gui -y
sudo apt install adb -y
sudo apt install scrcpy -y
sudo apt install git -y
sudo apt install pavucontrol -y
sudo apt install virt-viewer -y

echo -e

print_centered "-"  "-" 
print_centered "Iinstalando programas em Flatpak"
print_centered "-"  "-" 

echo -e

#Flatpak --------------------------------------------------------------------------------------------------#

flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.gimp.GIMP.Plugin.GMic -y
flatpak install flathub org.inkscape.Inkscape -y
flatpak install flathub org.kde.krita -y
flatpak install flathub org.kde.kdenlive -y
flatpak install flathub org.qbittorrent.qBittorrent -y
flatpak install flathub org.ardour.Ardour -y
flatpak install flathub io.github.Soundux

#Removendo programas --------------------------------------------------------------------------------------#

sudo apt remove hexchat -y
sudo apt remove thunderbird -y
sudo apt remove drawing -y
sudo apt remove hypnotix -y

#Atualização e limpeza do sistema -------------------------------------------------------------------------#

flatpak update

flatpak uninstall --unused -y

sudo apt update -y
sudo apt autoremove -y
sudo apt autoclean -y

echo -e

print_centered "-"  "-" 
print_centered "Instalação finalizada !"
print_centered "-"  "-" 

echo -e

#read