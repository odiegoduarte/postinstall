#!/bin/bash

#Criado por Diego Duarte 2020
#Esse shellscript criado com base no Linux Mint 20.04 LTS.

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

#PPA_QBITORRENT="ppa:qbittorrent-team/qbittorrent-stable"
#PPA_PEEK="ppa:peek-developers/stable"

#Variáveis.deb --------------------------------------------------------------------------------------------#

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_DISCORD="https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb"
URL_4K="https://dl.4kdownload.com/app/4kvideodownloader_4.12.5-1_amd64.deb"
URL_ANGRYIP="https://github.com/angryip/ipscan/releases/download/3.7.2/ipscan_3.7.2_amd64.deb"
URL_WOEUSB="http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/w/woeusb/woeusb_3.3.1-1~webupd8~focal0_amd64.deb"
URL_PEAZIP="https://sourceforge.net/projects/peazip/files/7.3.2/peazip_7.3.2.LINUX.x86_64.GTK2.deb"
URL_STACER="https://sourceforge.net/projects/stacer/files/v1.1.0/stacer_1.1.0_amd64.deb"

#Variáveis AppImage ---------------------------------------------------------------------------------------#

URL_EMAGE="https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"
URL_SHOWPLAYER="https://github.com/FrancescoCeruti/linux-show-player/releases/download/v0.5.2/LinuxShowPlayer-v0.5.2-x86_64.AppImage"
URL_REAPER="https://dlcf.reaper.fm/6.x/reaper612c_linux_x86_64.tar.xz"
URL_VSXU="https://github.com/vovoid/vsxu/releases/download/v0.6.3/VSXu-0.6.3.glibc2.17.AppImage"

#Variáveis Personalização ---------------------------------------------------------------------------------#

URL_QOGIR="https://uc9f2e379115af6bb0b2efb0d830.dl.dropboxusercontent.com/cd/0/get/A7KJBBJWO5-tmKSStTdfM1a4FW7tqqGjCNASG-RpQETqTZQrLKkTjJDPsJSsTTuMzsMUFRPV_AR9_umoZDgM4JCCCd-SzBRDWd8mxL6aZtZOzB_t6o95hcZJkavte1SPsZ8/file?dl=1#"
URL_PAPIRUS="https://uc192c634ebf7991f214775fcbac.dl.dropboxusercontent.com/cd/0/get/A7IDDHnXq9vsibG9vKpW3qowfu6NHHC3YAQsMhAzXZ5pw9rkFLlM9Cyx5flcfgpDD_Mbs-PqovnAutES2x5-lSbtOeVT0xdowMP2qnXO77K78oTJ0-AJI7d8Ms0zrKH1Ry4/file?dl=1#"

#Variáveis de pasta ---------------------------------------------------------------------------------------#

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"
ICONS="$HOME/.icons"
THEMES="$HOME/.themes"

echo "Adicionando PPA ao Sistema"

#Removendo travas do APT -----------------------------------------------------------------------------------#

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#Adicionando PPA ------------------------------------------------------------------------------------------#

#sudo apt-add-repository "$PPA_QBITORRENT" -y
#sudo apt-add-repository "$PPA_PEEK" -y

#Atualizando o repositório --------------------------------------------------------------------------------#

sudo apt update -y

echo "Baixando temas e icones"

#Personalização --------------------------------------------------------------------------------------------#

wget -c "$URL_QOGIR"     -P "$THEMES"
wget -c "$URL_PAPIRUS"   -P "$ICONS"

echo "Baixando e instalando programas .DEB"

#Download DEB ---------------------------------------------------------------------------------------------#

mkdir "$DEB"

wget -c "$URL_CHROME"     -P "$DEB"
wget -c "$URL_DISCORD"    -P "$DEB"
wget -c "$URL_4K"         -P "$DEB"
wget -c "$URL_ANGRYIP"    -P "$DEB"
wget -c "$URL_WOEUSB"     -P "$DEB"
wget -c "$URL_PEAZIP"     -P "$DEB"
wget -c "$URL_STACER"     -P "$DEB"

sudo dpkg -i $DEB/*.deb
sudo apt-get install -f -y

echo "Baixando e instalando programas APPIMAGE"

#Download App Image ---------------------------------------------------------------------------------------#

mkdir "$APPIMAGE"

wget -c "$URL_EMAGE"       -P "$APPIMAGE"
wget -c "$URL_SHOWPLAYER"  -P "$APPIMAGE"
wget -c "$URL_REAPER"      -P "$APPIMAGE"
wget -c "$URL_VSXU"        -P "$APPIMAGE"

echo "Instalando programas dos PPA's"

#Instala os apps via repositório --------------------------------------------------------------------------#

#PPA de terceiros
#sudo apt-get install qbittorrent -y
#sudo apt-get install peek -y
 
#PPA
sudo apt install linssid -y
sudo apt install SimpleScreenRecorder -y
sudo apt install audacity -y
sudo apt install spotify-client -y
sudo apt install steam -y
sudo apt install mint-meta-codecs -y

echo "Instalando programas em Flatpak"

#Flatpak --------------------------------------------------------------------------------------------------#

flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.gimp.GIMP.Plugin.GMic -y
flatpak install flathub org.inkscape.Inkscape -y
flatpak install flathub org.kde.kdenlive -y
flatpak install flathub net.sourceforge.projectM -y

#Removendo programas --------------------------------------------------------------------------------------#

sudo apt remove transmission -y
sudo apt remove hexchat -y
sudo apt remove thunderbird -y
sudo apt remove drawing -y
sudo apt remove pix -y

#Atualização e limpeza do sistema -------------------------------------------------------------------------#

flatpak update
flatpak uninstall --unused -y

sudo apt update -y
sudo apt autoremove -y
sudo apt autoclean -y

echo "Instalação finalizada !"
