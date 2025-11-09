#!/bin/bash 

echo -e "=========Install script=========== \n"
echo "Install starting for arch "

sudo pacman -S curl alacritty i3blocks nerd-fonts picom ranger vim fastfetch -y

echo -e  "Packeges installed \n"
echo -e  "Making directorys \n"

mkdir -p ~/.config/i3
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/i3blocks
mkdir -p ~/Scripts
mkdir -p ~/.config/fastfetch 

echo -e "Installing Oh my bash "
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

echo -e "Copying config files\n"

if [ -e ~/.config/i3/conf ]; then
    echo -e  "File exists.\n"
    echo -e "Removing i3 config fil and replacing \n"
    rm ~/.config/i3/conf
    cp config/i3/conf ~/.config/i3/


else
    cp config/i3/conf ~/.config/i3/
 
fi

cp configs/i3/blocks/conf  ~/.config/i3blocks/ 
cp configs/alacritty/alacritty.toml  ~/.config/alacritty/
cp -r configs/alacritty/themes  ~/.config/alacritty/ 
cp configs/fastfetch/config.jsonc  ~/.config/fastfetch 


echo -e "Making script excetable and copying it to Scripts folder"

chmod +x bg.sh toggle_bg.sh

cp bg.sh  ~/Scripts
cp index_bg.txt ~/Scripts
cp toggle_bg.sh ~/Scripts 

echo -e "Restarting I3 !!"


run=true
count=3
while [ $run = true ]; do
	echo " in $count ..."
	if [ $count -eq 0 ]; then
		run=false
	fi
	count=$((count-1))
done

i3-msg restart





