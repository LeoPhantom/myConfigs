#!/bin/bash

CONFIGFILE="~/.config"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCEP[0]}")" && pwd)"
CONFIG_DIR="$SCRIPT_DIR"/config
PARANT_DIR="$(cd "$(dirname "${BASH_SOURCEP[0]}")" && cd ..  && pwd)"
echo -e "=========Install script=========== \n"
echo " Install Debian config for i3 "

sudo apt install -y lazygit  picom feh nigrogen alacritty fastfetch nala polybar


echo -e  "Packeges installed \n"
echo -e  "Making directorys \n"

if [[ ! -f "${CONFIGFILE}"]]
	echo -e "No .config found \n"
	echo -e  "Making directory .config \n"
	mkdir -p ~/.config/
fi

echo -e "Copying config files to .config directory"
cp -r .config/* ~/.config
echo -e "Copying config files to .config directory"

if [[ ! -f "home/$USER/Pictures"]]
	echo -e "No Pictures directory found \n"
	echo -e  "Making directory Pictures directory \n"
	mkdir -p ~/Pictures/
fi

cp -r  ../Pictures/*  ~/Pictures

echo -e "Making scripts directory"
mkdir ~/scripts
cp -r /scripts/* ~/scripts


echo "The script for i3lock-colors is in config/scripts , manually paset it if u will use i3lock-color"
sleep 3 

echo -e "Restarting I3 !!"

run=true
count=3
while [ $run = true ]; do
	echo " in $count ..."
	sleep 1
	if [ $count -eq 0 ]; then
		run=false
	fi
	count=$((count-1))
done

i3-msg restart
