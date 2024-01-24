#!/bin/bash

CHECK=$(pidof wlsunset)
if [ $CHECK ]; then
	pkill wlsunset &
	notify-send --urgency=low "Gamma filter off"
else
	wlsunset &
	disown
	notify-send --urgency=low "Gamma filter on"
fi
