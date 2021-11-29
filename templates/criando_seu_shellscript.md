<br>

<p align="center">
  <img width="922" height="257" src="/assets/postinstall.png">
</p>

<br>

## <img width="25" height="" src="/assets/icons/linux.png"> Criando seu shellscript através do template.

<br>

~~~javascript

#Variáveis PPA

 PPA_OBS="ppa:obsproject/obs-studio"
|-------| |------------------------| 
    |                  |
    |                  |------ URL do seu PPA
    | 
    |------ Nome da váriavel que você vai usar no passo "#Adicionando PPA"

~~~

<br>

~~~javascript
#Variáveis.deb

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
|-------|  |------------------------------------------------------------------------| 
    |                                          |
    |                                          |------ URL do seu .deb
    | 
    |------ Nome da váriavel que você vai usar no passo "#Download DEB"
~~~

<br>

~~~javascript
#Variáveis AppImage

URL_EMAGE"https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"
|--------| |----------------------------------------------------------------------------------------| 
    |                                                   |
    |                                                   |------ URL do seu .AppImage
    | 
    |------ Nome da váriavel que você vai usar no passo "#Download AppImage"
~~~

<br>

~~~javascript
#Variáveis de pasta

DEB="$HOME/Downloads/DEB"
APPIMAGE="$HOME/Apps"
ICONS="$HOME/.icons"
THEMES="$HOME/.themes"
|-----| |------------|
   |           |
   |           |---Diretorio da pasta no sistema.
   |
   |---Nomes das variáveis
~~~

<br>

~~~javascript
#Adicionando PPA

sudo apt-add-repository "$PPA_OBS" -y
|---------------------| |--------|
             |               |
             |               |--- repositório
             |              
             |-- Comando para adicionar
~~~

<br>

~~~javascript
#Download DEB

O comando mkdir cria uma pasta

mkdir "$DEB"

   wget -c "$URL_CHROME"     -P "$DEB"
 |-------| |-----------|    |-------|
      |            |              |- Local onde o programa vai ser salvo
      |            |
      |            |--- URL do seu programa deb
      |
      |--- Comando para baixar
  
  sudo dpkg -i $DEB/*.deb
  sudo apt-get install -f -y
  |-------------------------|
               |
               |--- Comando que vai vai instalar todos os programas .deb baixados.
~~~

<br>

~~~javascript
#Instala os apps via repositório

#PPA de terceiros             
  sudo apt install obs-studio -y
  |--------------| |-----------|
          |              |
          |              |--- nome do programa que será instalado.
          |
          |-- Comando de instalação
~~~

<br> <br> <br>

### Referências

- [Operações básicas de gestão de pacotes.](https://www.debian.org/doc/manuals/debian-reference/ch02.pt.html#_basic_package_management_operations)
- [Ubuntu Manpage apt command-line interface.](https://manpages.ubuntu.com/manpages/focal/man8/apt.8.html)
- [Whiptail Wiki](https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail)
- [Whiptail Ubuntu Manual](http://manpages.ubuntu.com/manpages/focal/man1/whiptail.1.html)
- [Ubuntu Beginners/BashScripting](https://help.ubuntu.com/community/Beginners/BashScripting)
- [Introdução à programação Shell](http://www.faqs.org/docs/air/tsshell.html)
- [Programando em shell script](http://www.devin.com.br/shell_script/)
- [Shell Scripting Tutorial](https://www.shellscript.sh/)
- [Bash Reference Manual](https://devdocs.io/bash/)

<br><br>