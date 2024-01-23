#!/bin/bash
wall=$(find ~/Pictures/Wallpapers -maxdepth 1 -type f | shuf -n 1)
swww img $wall --transition-type wipe --transition-fps 60
