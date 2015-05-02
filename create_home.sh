#!/bin/bash

USER=$1
HOME_DIR='/exports/home'
TEMPLATE_DIR='/etc/skel'

if [[ -z $1 ]]
then
    echo "Usage: $0 <username>"
    exit 1
fi

if [[ ! -d $HOME_DIR/$USER ]]
then
    cp -rp $TEMPLATE_DIR $HOME_DIR/$USER
    chmod 700 $HOME_DIR/$USER
    mkdir $HOME_DIR/$USER/.ssh
    vi $HOME_DIR/$USER/.ssh/authorized_keys
    chown -R $USER:users $HOME_DIR/$USER
else
    echo "Home directory already exists. Exiting."
    exit 1
fi
