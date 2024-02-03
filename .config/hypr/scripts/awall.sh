#!/bin/bash
wall=$(find ~/Pictures/Wallpapers/Anime -maxdepth 1 -type f | shuf -n 1)
swww img $wall --transition-type wipe --transition-fps 60

CHECK=$(cat ~/.zshrc | grep "Anime_renders")
if ! [[ $CHECK ]]; then
	echo "find /mnt/veracrypt1/0Wallpapers/Anime_renders/ -maxdepth 1 -type f | shuf -n 1 | xargs chafa --align center" >>~/.zshrc
fi
