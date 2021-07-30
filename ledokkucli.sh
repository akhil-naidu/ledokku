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


function main(){

    echo "${YELLOW}Downloading Script${END}"
    wget https://raw.githubusercontent.com/akhil-naidu/ledokku/new/ledokku-cli/ledokku
    wait
    echo "${YELLOW}Installing Ledokku CLI${END}"
    sudo cat ledokku > /usr/local/bin/ledokku
    wait
    echo "${BLUE}Making Executable${END}"
    sudo chmod +x /usr/local/bin/ledokku
    wait
    echo "${YELLOW}Getting Ready For Ledokku Terminal Command${END}"
    exec $SHELL
    wait
    # Cleaning up will ensure that the script always download the latest version(ledokkuCLI) without any conflicts in file name.
    sudo rm -rf ledokku
}

define-colors
if [ "$(whoami)" == "root" ] ; then
    main
else
    echo "${RED}Warning! ${YELLOW}Run the script with ${BLUE}root${YELLOW} permissions ${END}"
    exit
fi
