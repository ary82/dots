#!/usr/bin/env bash

WP_DIR=~/Pictures/Wallpapers/.anime
OLD_DIR=~/Pictures/Wallpapers/.anime/old/
RENDER_DIR=/mnt/veracrypt1/0Wallpapers/Anime_renders/

wall=$(find $WP_DIR -maxdepth 1 -type f | shuf -n 1)
swww img $wall --transition-type none #wipe --transition-fps 60

# Rofi banner
cat ~/.cache/swww/eDP-1 | xargs -I {} cp {} ~/.config/rofi/images/oimg
convert ~/.config/rofi/images/oimg -resize 40% ~/.config/rofi/images/img

# Display renders on terminal startup
CHECK=$(cat ~/.zshrc | grep "Anime_renders")
if ! [[ $CHECK ]]; then
	echo "find $RENDER_DIR -maxdepth 1 -type f | shuf -n 1 | xargs chafa --align center" >>~/.zshrc
fi

# Move the selected image to old folder
cat ~/.cache/swww/eDP-1 | xargs -I {} mv {} $OLD_DIR

# Move the old images back to the main folder
OLD_FILES=$(find $OLD_DIR -maxdepth 1 -type f | wc -l)
if [[ $OLD_FILES -ge 500 ]]; then
	mv $OLD_DIR $WP_DIR
fi
