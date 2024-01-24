#!/bin/bash

CHECK=$(lenopow -s | cut --delimiter=" " --fields=3)
if [ "$CHECK" == "ENABLED" ]; then
	sudo lenopow -d
	notify-send "Battery Protection Disabled"
else
	sudo lenopow -e
	notify-send "Battery Protection Enabled"
fi
