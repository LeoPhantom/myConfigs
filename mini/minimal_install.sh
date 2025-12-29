#!/bin/bash

#minimal script ot install i3 , no unsececery config files just the basic i3 config 

sudo apt update -y 
sudo apt install git curl wget feh alacritty -y 

cp -r .config/*  ~/.config/i3
mkdir /home/$USER/wallpaper

cp -r wallpaer/* /home/$USER/wallpaper

wallpapers=($(ls /home/$USER/wallpaper))


len=${#wallpapers[@]}

num=$((RANDOM % len))


feh --bg-fill /home/$USER/wallpaper/${wallpapers[$num]}





