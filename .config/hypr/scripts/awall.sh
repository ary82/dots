#!/bin/bash
wall=$(find ~/Pictures/Wallpapers/Anime -maxdepth 1 -type f | shuf -n 1)
swww img $wall --transition-type wipe --transition-step 5 --transition-fps 60
