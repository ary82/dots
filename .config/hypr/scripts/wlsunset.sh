#!/bin/bash

CHECK=$(pidof wlsunset)
if [ $CHECK ]; then
	pkill wlsunset
	notify-send "Gamma filter off"
else
	wlsunset &
	disown
	notify-send "Gamma filter on"
fi
