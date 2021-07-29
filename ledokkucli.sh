#!/bin/bash


function main(){

    wget https://raw.githubusercontent.com/akhil-naidu/ledokku/new/ledokku-cli/ledokku
    wait
    sudo cat ledokku > /usr/local/bin/ledokku
    wait
    sudo chmod +x /usr/local/bin/ledokku
    wait
    # clear
    wait
    echo "Close and reopen your terminal, for now this is the fastest way for ledokku to work with tab autofill"

}

if [ "$(whoami)" == "root" ] ; then
    main
else
    echo "Please! Run the script with root user"
    exit
fi
