#!/bin/bash

# This Script reads schedule from a tab separated file from $INPUT and prints out the current task
# For use with Waybar
# Format for schedule: <hh:mm> TAB <hh:mm> TAB <todo> TAB <tooltip> TAB <command>
# See also: ./work-command.sh

INPUT="/home/ary/schedule.txt"
TIME=$(date "+%H:%M")
CURRENT_TODO='╮(. ❛ ᴗ ❛.)╭'
TOOLTIP=""

IFS=''
while read -r LINE; do
	START=$(awk -F'\t+' '{print $1}' <<<"$LINE")
	END=$(awk -F'\t+' '{print $2}' <<<"$LINE")
	LINE_TODO=$(awk -F'\t+' '{print $3}' <<<"$LINE")
	LINE_TOOLTIP=$(awk -F'\t+' '{print $4}' <<<"$LINE")

  # If current time between Slots
	if [[ ($TIME > $START && $TIME < $END) ]]; then
		CURRENT_TODO=$LINE_TODO
		TOOLTIP=$LINE_TOOLTIP
		break
  # Midnight Case
	elif [[ ($END < $START && ($TIME > $START || $TIME < $END)) ]]; then
		CURRENT_TODO=$LINE_TODO
		TOOLTIP=$LINE_TOOLTIP
		break
	fi
done <"$INPUT"

printf '{"text": "%s", "tooltip": "%s"}\n' "Current TODO: $CURRENT_TODO" "$TOOLTIP"
