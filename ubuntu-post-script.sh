#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
# 

#----- FUNCTIONS -----#

function main {
clear
echo ''
echo '#-------------------------------------------#'
echo '# Ubuntu 14.04 Post-Install Script #'
echo ''
echo '# Menu de opcoes '
echo '#-------------------------------------------#'
echo '[i]. Iniciar instalacao dos pacotes.'
echo '[q]. Quit?'
echo ''
read -p 'Escolha sua opção : ' REPLY
case $REPLY in
    [Ii]* ) echo '' && favourites;; # Install favourites applications
    [Qq]* ) echo '' && quit;; # Quit
    * ) clear && echo 'Opcao inexistente, tente novamente.' && main;;
esac
}


# INSTALL APPLICATIONS
function favourites {
clear
echo ''
read -p 'Deseja iniciar a instalacao? (S)im, (N)ão : ' REPLY
case $REPLY in
# Positive action
[Ss]* )
    # Add repository
    sudo add-apt-repository ppa:webupd8team/java

    # Updating repository information...
    sudo apt-get update
    sudo apt-get dist-upgrade -y
    
    # Install applications
    sudo apt-get install ubuntu-restricted-extras -y # Install codecs
    sudo apt-get install git-core -y # Install git
    sudo apt-get install compizconfig-settings-manager -y # Install CCSM
    sudo apt-get install oracle-java8-installer -y # Install java 8

    # Node JS
    sudo apt-get install g++ curl libssl-dev apache2-utils -y  # Install applications utils (to compile Node JS)
    wget -N http://nodejs.org/dist/node-latest.tar.gz && cd node-v* && ./configure # configure Node JS
    sudo make && sudo make install  # Compile Node JS
    
    sudo apt-get install vim tree -y # Install vim tree
    sudo apt-get install mysql-server apache2 libapache2-mod-php5 php5 php5-mysql phpmyadmin -y # Install lamp stack
    sudo apt-get install ruby irb rdoc -y # Install Ruby && Ruby Gems (gem)
    
    # Composer (Package Manager for PHP)
    sudo curl -sS https://getcomposer.org/installer | php 
    sudo mv composer.phar /usr/local/bin/composer
    
    # NPM Packages (Node package modules, -g = Global)
    sudo npm install -g bower # Package manager for web
    sudo npm install -g grunt-cli # Grunt = Javascript Task Runner (Build manager)
    
    # Ruby Gems packages
    sudo gem install sass # SASS
    sudo gem install compass # Compass
    sudo gem install foundation # Foundation Framework
    
    clear
    echo 'Todos os pacotes foram instalados com sucesso.' && quit
    ;;
# Negative action
[Nn]* )
    clear && main
    ;;
# Error
* )
    clear && echo 'Erro ao instalar pacotes, tentando novamente...'
    favourites
    ;;
esac
}

# Quit
function quit {
read -p "Deseja finalizar o script? (S)im, (N)ão :" REPLY
case $REPLY in
    [Ss]* ) exit 99;;
    [Nn]* ) clear && main;;
    * ) clear && echo 'Opcao inexistente, tente novamente.' && quit;;
esac
}

#----- RUN MAIN FUNCTION -----#
main

#END OF SCRIPT
