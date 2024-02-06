#!/bin/bash
wall=$(find ~/Pictures/Wallpapers/Anime -maxdepth 1 -type f | shuf -n 1)
swww img $wall --transition-type wipe --transition-fps 60
cat ~/.cache/swww/eDP-1 | xargs -I {} cp {} ~/.config/rofi/images/oimg
convert ~/.config/rofi/images/oimg -resize 40% ~/.config/rofi/images/img

CHECK=$(cat ~/.zshrc | grep "Anime_renders")
if ! [[ $CHECK ]]; then
	echo "find /mnt/veracrypt1/0Wallpapers/Anime_renders/ -maxdepth 1 -type f | shuf -n 1 | xargs chafa --align center" >>~/.zshrc
fi

# Move the selected image to old folder
cat ~/.cache/swww/eDP-1 | xargs -I {} mv {} ~/Pictures/Wallpapers/Anime/old/

# Move the old images back to the main folder
OLD_FILES=$(find ~/Pictures/Wallpapers/Anime/old -maxdepth 1 -type f | wc -l)
if [[ $OLD_FILES -gt 50 ]]; then
	mv ~/Pictures/Wallpapers/Anime/old/* ~/Pictures/Wallpapers/Anime/
fi
