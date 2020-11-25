#!/bin/bash

#Criado por Diego Duarte 2020
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

#Variáveis PPA --------------------------------------------------------------------------------------------#

PPA_NVIDIA="ppa:graphics-drivers/ppa"
PPA_BT="ppa:blaze/rtbth-dkms"

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_4K="https://dl.4kdownload.com/app/4kvideodownloader_4.13.4-1_amd64.deb"
URL_ANGRYIP="https://github.com/angryip/ipscan/releases/download/3.7.3/ipscan_3.7.3_amd64.deb"
URL_STACER="https://sourceforge.net/projects/stacer/files/v1.1.0/stacer_1.1.0_amd64.deb"
URL_EMAGE="https://github.com/douglasjunior/emage/releases/download/1.1.0/emage_1.1.0_amd64.deb"
URL_DISCORD="https://dl.discordapp.net/apps/linux/0.0.12/discord-0.0.12.deb"
URL_BUTTERCUP="https://github.com/buttercup/buttercup-desktop/releases/download/v1.20.5/buttercup-desktop_1.20.5_amd64.deb"

#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_SHOWPLAYER="https://github.com/FrancescoCeruti/linux-show-player/releases/download/v0.5.2/LinuxShowPlayer-v0.5.2-x86_64.AppImage"
URL_REAPER="https://dlcf.reaper.fm/6.x/reaper615_linux_x86_64.tar.xz"
URL_FONTBASE="https://releases.fontba.se/linux/FontBase-2.13.2.AppImage"

#Variáveis Personalização ---------------------------------------------------------------------------------#

URL_QOGIR="https://raw.githubusercontent.com/vinceliuice/Qogir-theme/releases/Qogir-dark.tar.xz"
URL_PAPIRUS="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/master.zip"

#Variáveis de pasta ---------------------------------------------------------------------------------------#

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"
ICONS="$HOME/.icons"
THEMES="$HOME/.themes"

echo "Adicionando PPA ao Sistema"

#Removendo travas do APT ----------------------------------------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA ------------------------------------------------------------------------------------------#

sudo apt-add-repository "$PPA_NVIDIA" -y
sudo apt-add-repository "$PPA_BT" -y

#Atualizando o repositório --------------------------------------------------------------------------------#

sudo apt update -y

echo "Baixando temas e icones"

#Personalização -------------------------------------------------------------------------------------------#

wget -c "$URL_QOGIR"     -P "$THEMES"
wget -c "$URL_PAPIRUS"   -P "$ICONS"

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
wget -c "$URL_4K"         -P "$DEB"
wget -c "$URL_ANGRYIP"    -P "$DEB"
wget -c "$URL_STACER"     -P "$DEB"
wget -c "$URL_EMAGE"      -P "$DEB"
wget -c "$URL_DISCORD"    -P "$DEB"
wget -c "$URL_BUTTERCUP"  -P "$DEB"

sudo dpkg -i $DEB/*.deb
sudo apt-get install -f -y

echo "Baixando e instalando programas APPIMAGE"

#Download App Image ---------------------------------------------------------------------------------------#

mkdir "$APPIMAGE"

wget -c "$URL_SHOWPLAYER"  -P "$APPIMAGE"
wget -c "$URL_REAPER"      -P "$APPIMAGE"
wget -c "$URL_FONTBASE"    -P "$APPIMAGE"

echo "Instalando programas do repositório"

#Instala os apps via repositório ---------------------------------------------------------------------------#

#PPA de terceiros

sudo apt install rtbth-dkms -y

#PPA

sudo apt install linssid -y
sudo apt install wireshark -y
sudo apt install SimpleScreenRecorder -y
sudo apt install audacity -y
sudo apt install spotify-client -y
sudo apt install steam -y
sudo apt install mint-meta-codecs -y
sudo apt install p7zip-full -y
sudo apt install adb -y
sudo apt install scrcpy -y
#sudo apt install pavucontrol -y

echo "Instalando programas em Flatpak"

#Flatpak --------------------------------------------------------------------------------------------------#

flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.gimp.GIMP.Plugin.GMic -y
flatpak install flathub org.inkscape.Inkscape -y
flatpak install flathub org.kde.kdenlive -y
#flatpak install flathub org.ardour.Ardour -y

#Atualização e limpeza do sistema -------------------------------------------------------------------------#

sudo apt remove hexchat -y
sudo apt remove thunderbird -y
sudo apt remove drawing -y

flatpak update

sudo apt update -y
sudo apt autoclean -y
sudo apt autoremove -y

echo "Instalação finalizada !"