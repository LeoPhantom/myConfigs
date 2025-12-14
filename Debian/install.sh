#!/bin/bash


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCEP[0]}")" && pwd)"
CONFIG_DIR="$SCRIPT_DIR"/config
PARANT_DIR="$(cd "$(dirname "${BASH_SOURCEP[0]}")" && cd ..  && pwd)"
echo -e "=========Install script=========== \n"
echo " Install Debian config for i3 "

sudo apt install -y lazygit  picom feh nigrogen alacritty fastfetch nala 


echo -e  "Packeges installed \n"
echo -e  "Making directorys \n"

mkdir -p ~/.config/i3
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/picom
mkdir -p ~/Pictures
mkdir -p ~/scripts

echo -e "Copying config files\n"
sleep 3

if [ -e ~/.config/i3/config ]; then
    echo -e  "File exists.\n"
    echo -e "Removing i3 config fil and replacing \n"
    rm ~/.config/i3/config
    cp -r configs/i3/config ~/.config/i3/

 else 
	 cp configs/i3/config ~/.config/i3/
fi

cp configs/alacritty/alacritty.toml  ~/.config/alacritty/
cp -r configs/alacritty/themes  ~/.config/alacritty/
cp -r  ../Pictures/*  ~/Pictures
cp /scripts/* ~/scripts
#Need to install poybar and copy the config , no config gile in the config foldre add them 

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
