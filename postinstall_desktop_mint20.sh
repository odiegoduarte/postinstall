#!/bin/bash

#Criado por Diego Duarte 2020
#Esse shellscript criado com base no Linux Mint 20 LTS.
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

#Variáveis PPA --------------------------------------------------------------------------------------------#

PPA_PULSE_EFFECTS="ppa:mikhailnov/pulseeffects"
PPA_OBS="ppa:obsproject/obs-studio"
PPA_NVIDIA="ppa:graphics-drivers/ppa"

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_OPERA="https://download3.operacdn.com/pub/opera/desktop/73.0.3856.344/linux/opera-stable_73.0.3856.344_amd64.deb"
#URL_TEAMVIEWER="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
#URL_ANYDESK="https://download.anydesk.com/linux/anydesk_6.0.1-1_amd64.deb"
URL_DISCORD="https://dl.discordapp.net/apps/linux/0.0.13/discord-0.0.13.deb"
URL_4K="https://dl.4kdownload.com/app/4kvideodownloader_4.14.3-1_amd64.deb"
URL_ANGRYIP="https://github.com/angryip/ipscan/releases/download/3.7.5/ipscan_3.7.5_amd64.deb"
URL_SKYPE="https://repo.skype.com/latest/skypeforlinux-64.deb"
URL_PEAZIP="https://github.com/peazip/PeaZip/releases/download/7.7.1/peazip_7.7.1.LINUX.x86_64.GTK2.deb"
URL_STACER="https://sourceforge.net/projects/stacer/files/v1.1.0/stacer_1.1.0_amd64.deb"
URL_VSCODE="https://az764295.vo.msecnd.net/stable/622cb03f7e070a9670c94bae1a45d78d7181fbd4/code_1.53.2-1613044664_amd64.deb"
URL_EMAGE="https://github.com/douglasjunior/emage/releases/download/1.1.0/emage_1.1.0_amd64.deb"
URL_BUTTERCUP="https://github.com/buttercup/buttercup-desktop/releases/download/v1.20.5/buttercup-desktop_1.20.5_amd64.deb"
URL_WEBSOCKET"https://github.com/Palakis/obs-websocket/releases/download/4.8.0/obs-websocket-4.8.0-1_amd64.deb"
URL_DECKBOARD"https://github.com/rivafarabi/deckboard/releases/download/v1.9.85/deckboard_1.9.85_amd64.deb"
URL_QLIGHT"https://www.qlcplus.org/downloads/4.12.3/qlcplus_4.12.3_amd64.deb"
URL_DRAWIO"https://github.com/jgraph/drawio-desktop/releases/download/v14.1.8/draw.io-amd64-14.1.8.deb"
URL_LANSHARE"https://github.com/abdularis/LAN-Share/releases/download/1.2.1/lanshare_1.2.1-1_amd64.deb"

#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_SCREENCLOUD="https://github.com/olav-st/screencloud/releases/download/v1.5.3/ScreenCloud-v1.5.3-x86_64.AppImage"
URL_FONTBASE="https://releases.fontba.se/linux/FontBase-2.14.0.AppImage"
URL_SHOWPLAYER="https://github.com/FrancescoCeruti/linux-show-player/releases/download/v0.5.2/LinuxShowPlayer-v0.5.2-x86_64.AppImage"
URL_REAPER="https://www.reaper.fm/files/6.x/reaper623_linux_x86_64.tar.xz"
URL_SWEETHOME3d="https://ufpr.dl.sourceforge.net/project/sweethome3d/SweetHome3D/SweetHome3D-6.4.2/SweetHome3D-6.4.2-linux-x64.tgz"
URL_FILESYNC="https://freefilesync.org/download/FreeFileSync_11.5_Linux.tar.gz"
URL_GUISCRCPY="https://github.com/srevinsaju/guiscrcpy/releases/download/v4.9.0/guiscrcpy-4.9.0.dev.r.glibc2.27-x86_64.AppImage"
URL_ASF="https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/5.0.3.2/ASF-linux-x64.zip"

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

echo "Adicionando PPA ao Sistema"

#Removendo travas do APT -----------------------------------------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA ------------------------------------------------------------------------------------------#

sudo apt-add-repository "$PULSE_EFFECTS" -y
sudo apt-add-repository "$PPA_OBS" -y
sudo apt-add-repository "$PPA_NVIDIA" -y

#Atualizando o repositório --------------------------------------------------------------------------------#

sudo apt update -y

echo "Baixando temas e icones"

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

echo "Baixando e instalando programas .DEB"

#Download DEB ---------------------------------------------------------------------------------------------#

mkdir "$DEB"

wget -c "$URL_CHROME"     -P "$DEB"
wget -c "$URL_OPERA"      -P "$DEB"
#wget -c "$URL_TEAMVIEWER" -P "$DEB"
#wget -c "$URL_ANYDESK"    -P "$DEB"
wget -c "$URL_DISCORD"    -P "$DEB"
wget -c "$URL_4K"         -P "$DEB"
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
wget -c "$URL_LANSHARE"   -P "$DEB"

sudo dpkg -i $DEB/*.deb
sudo apt-get install -f -y

echo "Baixando e instalando programas APPIMAGE"

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

echo "Instalando programas dos PPA's"

#Instala os apps via repositório --------------------------------------------------------------------------#

#PPA de terceiros

sudo apt install pulseeffects -y
sudo apt install obs-studio -y

#PPA

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

echo "Iinstalando programas em Flatpak"

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

echo "Instalação finalizada !"