#!/bin/bash
wall=$(find ~/Pictures/Wallpapers -maxdepth 1 -type f | shuf -n 1)
swww img $wall --transition-type wipe --transition-fps 60
sed -i '/Anime_renders/d' ~/.zshrc
cat .cache/swww/eDP-1 | xargs -I {} cp {} ~/.config/rofi/images/img
convert ~/.config/rofi/images/oimg -resize 40% ~/.config/rofi/images/img
