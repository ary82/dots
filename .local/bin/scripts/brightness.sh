#!/bin/bash
# Script for changing backlights using brightnessctl
# For use with waybar

get_backlight() {
	echo $(brightnessctl -m | cut -d, -f4)
}

notify_user() {
	current=$(get_backlight | sed 's/%//')
	notify-send -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:$current -u low "Brightness : $current%"
}

# Change brightness
change_backlight() {
  brightnessctl --exponent=2 set "$1" && notify_user
}

# Execute accordingly
case "$1" in
	"--get")
		get_backlight
		;;
	"--inc")
		change_backlight "+5%"
		;;
	"--dec")
		change_backlight "5%-"
		;;
	*)
		get_backlight
		;;
esac
