#!/bin/bash

run=true
wait_time=10

while getopts "w:" opt; do
    case "$opt" in
        w) wait_time=$OPTARG ;;  # -w option, sets the wait time
        *) echo "Usage: $0 [-w wait_time]" ; exit 1 ;;
    esac
done

  
my_wallpaper=($(ls ~/Pictures/))
  

while [ "$run" = true ]; do
	for wallpaper in "${my_wallpaper[@]}"; do
		
    		feh --bg-fill /home/silver/Pictures/"$wallpaper"
    		sleep $wait_time
    		#feh --bg-fill /home/silver/Pictures/"$wallpaper"    		
		#sleep $wait_time
	done
done

