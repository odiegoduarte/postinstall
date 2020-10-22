#!/bin/bash

#Criado por Diego Duarte 2020
#Esse shellscript criado com base no Linux Mint 20 LTS.

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
URL_OPERA="https://download3.operacdn.com/pub/opera/desktop/71.0.3770.171/linux/opera-stable_71.0.3770.171_amd64.deb"
#URL_TEAMVIEWER="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
#URL_ANYDESK="https://download.anydesk.com/linux/anydesk_6.0.0-1_amd64.deb"
URL_DISCORD="https://dl.discordapp.net/apps/linux/0.0.12/discord-0.0.12.deb"
URL_RAMME="https://github.com/terkelg/ramme/releases/download/v3.2.5/Ramme_3.2.5_amd64.deb"
URL_4K="https://dl.4kdownload.com/app/4kvideodownloader_4.13.1-1_amd64.deb"
URL_ANGRYIP="https://github.com/angryip/ipscan/releases/download/3.7.2/ipscan_3.7.2_amd64.deb"
URL_SKYPE="https://repo.skype.com/latest/skypeforlinux-64.deb"
URL_PEAZIP="https://sourceforge.net/projects/peazip/files/7.4.1/peazip_7.4.1.LINUX.x86_64.GTK2.deb"
URL_STACER="https://sourceforge.net/projects/stacer/files/v1.1.0/stacer_1.1.0_amd64.deb"
URL_VSCODE="https://az764295.vo.msecnd.net/stable/58bb7b2331731bf72587010e943852e13e6fd3cf/code_1.49.1-1600299189_amd64.deb"
URL_EMAGE="https://github.com/douglasjunior/emage/releases/download/1.1.0/emage_1.1.0_amd64.deb"

#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_SCREENCLOUD="https://github.com/olav-st/screencloud/releases/download/v1.5.1/ScreenCloud-v1.5.1-x86_64.AppImage"
URL_FONTBASE="https://releases.fontba.se/linux/FontBase-2.13.2.AppImage"
URL_SHOWPLAYER="https://github.com/FrancescoCeruti/linux-show-player/releases/download/v0.5.2/LinuxShowPlayer-v0.5.2-x86_64.AppImage"
URL_REAPER="https://dlcf.reaper.fm/6.x/reaper614_linux_x86_64.tar.xz"
URL_SWEETHOME3d="https://ufpr.dl.sourceforge.net/project/sweethome3d/SweetHome3D/SweetHome3D-6.4.2/SweetHome3D-6.4.2-linux-x64.tgz"
URL_FILESYNC="https://freefilesync.org/download/FreeFileSync_11.1_Linux.tar.gz"
URL_GUISCRCPY="https://github.com/srevinsaju/guiscrcpy/releases/download/v4.7.2/guiscrcpy-4.7.2.r.glibc2.27-x86_64.AppImage"

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
wget -c "$URL_RAMME"      -P "$DEB"
wget -c "$URL_4K"         -P "$DEB"
wget -c "$URL_ANGRYIP"    -P "$DEB"
wget -c "$URL_SKYPE"      -P "$DEB"
wget -c "$URL_PEAZIP"     -P "$DEB"
wget -c "$URL_STACER"     -P "$DEB"
wget -c "$URL_VSCODE"     -P "$DEB"
wget -c "$URL_EMAGE"      -P "$DEB"

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
#sudo apt install pavucontrol -y
sudo apt install adb -y
sudo apt install scrcpy -y

echo "Iinstalando programas em Flatpak"

#Flatpak --------------------------------------------------------------------------------------------------#

flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.gimp.GIMP.Plugin.GMic -y
flatpak install flathub org.inkscape.Inkscape -y
flatpak install flathub org.kde.krita -y
flatpak install flathub org.kde.kdenlive -y
flatpak install flathub org.qbittorrent.qBittorrent -y
flatpak install flathub org.ardour.Ardour -y

#Removendo programas --------------------------------------------------------------------------------------#

sudo apt remove hexchat -y
sudo apt remove thunderbird -y
sudo apt remove drawing -y

#Atualização e limpeza do sistema -------------------------------------------------------------------------#

flatpak update

flatpak uninstall --unused -y

sudo apt update -y
sudo apt autoremove -y
sudo apt autoclean -y

echo "Instalação finalizada !"