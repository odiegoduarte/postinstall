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

URL_QOGIR="https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTIzMDkxNzkiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6Ijg3OWJiOWViYTY4ZWM5ZjlhMTY3ZWY5ZjMzMjAxNGRhYWE4MGFmZDJhNWVhMzYyMzE4ODZiZjYwOTRkYWM4ZWI5ZDBjMTI3MTkzMzk4ZmNiODhjMTRjZGEyOTcwMDJlOWE2YzI4NmEwNjc3MmVlYzk5ZjFhNjMyMzM5OTY5YzZkIiwidCI6MTU5NDI2MjIxMiwic3RmcCI6IjRmOWEyMWE3ZjQ2YmRiZGQ1NWI1NGRjY2Q2ZDQ1MmU1Iiwic3RpcCI6IjE4Ni4yMjUuMTg2LjcyIn0.gD0YIYkIEUOOpWog1jJZQ_uBNG8ubSROfPVyEdOMkxA/Qogir-dark.tar.xz"
URL_PAPIRUS="https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTM3NDczOTEiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjJhNzlkNjBkZTQ1ZTk1M2UyMTM2MGUxZWFmNjA2N2ZiNTdmMjdjMjVlM2EwYjE0NjU2ZWNmYjBjOGFmYjQ0ZTMyZWNiZjJkZmExNzJjMzBlNDRjNDQ0MDU5YTk2NjhiMTY5ZjU1Mjk2MjUyNDFjZjIxZGM2OGNkNzE1ZGU3YjEzIiwidCI6MTU5NDI2MjM2OCwic3RmcCI6IjRmOWEyMWE3ZjQ2YmRiZGQ1NWI1NGRjY2Q2ZDQ1MmU1Iiwic3RpcCI6IjE4Ni4yMjUuMTg2LjcyIn0.Q45qkfEfGS_BoB3b-ZlOJpQRKJEF1bEhPS_L_eibuyQ/papirus-icon-theme.tar.xz"

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
