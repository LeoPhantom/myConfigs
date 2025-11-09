#!/bin/bash

# Set the wallpaper directory and file for storing the index
my_wallpaper=($(ls ~/Pictures/))
file="index_bg.txt"

# Get the length of the array
length=${#my_wallpaper[@]}

# Check if the index file exists
if [[ -f "$file" ]]; then
    # Read the current index from the file
    index=$(head -n 1 "$file")
else
    # If the file doesn't exist, start with index 0
    index=0
fi

# Check if the index is within range
if [[ $index -lt $length ]]; then
    # Set the current wallpaper
    current=${my_wallpaper[$index]}
   feh --bg-fill ~/Pictures/$current
    
    # Increment the index and update the file
    ((index++))
    
    # Ensure the index wraps around to 0 if it exceeds the array length
    if [[ $index -ge $length ]]; then
        index=0
    fi

    # Save the new index to the file
    echo "$index" > "$file"
else
    # If the index is out of range, reset to 0 and set the wallpaper
    index=0
    current=${my_wallpaper[$index]}
    feh --bg-fill ~/Pictures/$current
    echo "$index" > "$file"
fi

