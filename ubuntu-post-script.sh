#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#    Luã Boni <lrapelliboni@gmail.com>
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
    sudo apt-get install ubuntu-restricted-extras -y
    sudo apt-get install git-core -y
    sudo apt-get install compizconfig-settings-manager -y
    sudo apt-get install oracle-java8-installer -y
    
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
