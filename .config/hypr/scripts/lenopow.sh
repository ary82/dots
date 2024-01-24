#!/bin/bash

CHECK=$(lenopow -s | cut --delimiter=" " --fields=3)
if [ "$CHECK" == "ENABLED" ]; then
	sudo lenopow -d
	notify-send --urgency=low "Battery Protection Disabled"
else
	sudo lenopow -e
	notify-send --urgency=low "Battery Protection Enabled"
fi
