#!/bin/bash

set -e

function define-colors {

  # Using tput will eliminate the usage of "-e" in echo, and can be used anywhere
  ## Color Palet
  ## Should exist in every script
  RED="$(tput setaf 1)" # ${RED}
  GREEN="$(tput setaf 2)" # ${GREEN}
  YELLOW="$(tput setaf 3)" # ${YELLOW}
  BLUE="$(tput setaf 123)" # ${BLUE}
  END="$(tput setaf 7)" # ${END
}

function check(){

    # failsafe check
    File=ledokku 
    if [ -f "$File" ]; then  
    echo "${YELLOW}Removing Old Files${END}"
    rm -rf ledokku  
    fi 
}

function main(){

    echo "${YELLOW}Downloading Script${END}"
    wget https://raw.githubusercontent.com/akhil-naidu/ledokku/new/ledokku-cli/ledokku
    wait
    echo "${YELLOW}Installing Ledokku CLI${END}"
    sudo cat ledokku > /usr/local/bin/ledokku
    wait
    echo "${YELLOW}Making Executable${END}"
    sudo chmod +x /usr/local/bin/ledokku
    wait
    rm -rf ledokku
    wait
    echo -e "${YELLOW}Run ${BLUE}exec $ \bSHELL${YELLOW} in your Terminal to finish the installation${END}"
    # Allowing user to run exec $SHELL would be better => It should never be a part of the script.
}

define-colors
check
if [ "$(whoami)" == "root" ] ; then
    main
else
    echo "${RED}Warning! ${YELLOW}Run the script with ${BLUE}root${YELLOW} permissions${END}"
    exit
fi
