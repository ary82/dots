#!/bin/bash
wall=$(find ~/Pictures/Wallpapers/Anime -type f | shuf -n 1)
swww img $wall --transition-type wipe --transition-step 5 --transition-fps 60
