#!/bin/bash 

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCEP[0]}")" && pwd)"
CONFIG_DIR="$SCRIPT_DIR"/config
PARANT_DIR="$(cd "$(dirname "${BASH_SOURCEP[0]}")" && cd ..  && pwd)"
echo -e "=========Install script=========== \n"
echo "Install starting for arch "

#sudo pacman -S curl vim feh alacritty i3blocks nerd-fonts picom ranger vim fastfetch xorg-xrandr  -y

echo -e  "Packeges installed \n"
echo -e  "Making directorys \n"

mkdir -p ~/.config/i3
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/i3blocks
mkdir -p ~/Scripts
mkdir -p ~/.config/fastfetch 
mkdir -p ~/Pictures 


echo -e "Copying config files\n"
echo -e "Config  dir is at  $CONFIG_DIR"
if [ -e ~/.config/i3/config ]; then
    echo -e  "File exists.\n"
    echo -e "Removing i3 config fil and replacing \n"
    rm ~/.config/i3/config
    cp -r configs/i3/config ~/.config/i3/


else
    cp configs/i3/config ~/.config/i3/
 
fi

cp configs/i3blocks/config  ~/.config/i3blocks/ 
cp configs/alacritty/alacritty.toml  ~/.config/alacritty/
cp -r configs/alacritty/themes  ~/.config/alacritty/ 
cp configs/fastfetch/config.jsonc  ~/.config/fastfetch 
cp -r PARANT_DIR/Pictures/ ~/Pictures
cp -r PARANT_DIR/dotFiles/.vimrc  ~/ 
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
	sleep 1 
	if [ $count -eq 0 ]; then
		run=false
	fi
	count=$((count-1))
done

i3-msg restart

echo -e "\033[32mTo apply the resulution change need to exit i3 and log in back \033[0m"

read -p  "  Do you want Oh my bash ? [y/N]" :user_input 

if [[ "$user_input" == "y"]]; then 
	echo -e " Coying bashrc to home dir \n "
	cp $PARANT_DIR/dotFiles/.bashrc  ~/

	echo "==== Installing oh my bash ===="
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
else 
	echo "You choose not to "
	exit 0 
fi 





