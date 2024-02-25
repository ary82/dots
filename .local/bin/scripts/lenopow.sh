#!/bin/bash

CHECK=$(lenopow -s | cut --delimiter=" " --fields=3)

protection_toggle() {
	if [ "$CHECK" == "ENABLED" ]; then
		sudo lenopow -d
		notify-send --urgency=low "Lenopow Disabled"
	else
		sudo lenopow -e
		notify-send --urgency=low "Lenopow Enabled"
	fi
}
protection_status() {
	notify-send --urgency=low "Lenopow status: $CHECK"
}

case "$1" in
"--toggle")
	protection_toggle
	;;
*)
	protection_status
	;;
esac
