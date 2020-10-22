<br>

<p align="center">
  <img width="922" height="257" src="images/postinstall.png">
</p>

<br>

Esse shellscript foi criado para automatizar a instalação de programas na minha distro linux, nesse repositório você irá encontrar 3 arquivos **postinstall_desktop.sh**, **postinstall_notebook.sh** e **postintall_template.sh** sendo o desktop e notebook criado para meu usso pessoal com uma lista de programas que pode ser bem diferente da que você utiliza.

<br>

postinstall_ | sobre
:------ | :------ 
postintall_template.sh | Template base para você criar seu próprio shellscript automatizado.
postintall_template_simplificado.sh | Template simplificado para você criar seu próprio shellscript automatizado.
postintall_notebook_mint20.sh | Shellscript criado para usso pessoal Mint 20 LTS
postintall_desktop_mint20.sh | Shellscript criado para usso pessoal Mint 20 LTS


<br> <br>

## Criando seu shellscript através do template.

~~~javascript

#Variáveis PPA

 PPA_OBS="ppa:obsproject/obs-studio"
|-------| |------------------------| 
    |                  |
    |                  |------ URL do seu PPA
    | 
    |------ Nome da váriavel que você vai usar no passo "#Adicionando PPA"

~~~
---
~~~javascript
#Variáveis.deb

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
|-------|  |------------------------------------------------------------------------| 
    |                                          |
    |                                          |------ URL do seu .deb
    | 
    |------ Nome da váriavel que você vai usar no passo "#Download DEB"
~~~
---
~~~javascript
#Variáveis AppImage

URL_EMAGE"https://github.com/douglasjunior/emage/releases/download/1.1.0/emage-1.1.0-x86_64.AppImage"
|--------| |----------------------------------------------------------------------------------------| 
    |                                                   |
    |                                                   |------ URL do seu .AppImage
    | 
    |------ Nome da váriavel que você vai usar no passo "#Download AppImage"
~~~
---
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
---
~~~javascript
#Adicionando PPA

sudo apt-add-repository "$PPA_OBS" -y
|---------------------| |--------|
             |               |
             |               |--- repositório
             |              
             |-- Comando para adicionar
~~~
---
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
---
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
- [Whiptail.](https://en.wikibooks.org/wiki/Bash_Shell_Scripting/)

<br>
