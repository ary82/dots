#!/bin/bash

WP_DIR=~/Pictures/Wallpapers

wall=$(find $WP_DIR -maxdepth 1 -type f | shuf -n 1)
swww img $wall --transition-type none #wipe --transition-fps 60
sed -i '/Anime_renders/d' ~/.zshrc

# Rofi banner
cat .cache/swww/eDP-1 | xargs -I {} cp {} ~/.config/rofi/images/oimg
convert ~/.config/rofi/images/oimg -resize 40% ~/.config/rofi/images/img
