#!/bin/bash

# For use with Hyprland Binds
# Closely related to ./schedule.sh
# Format for schedule: <hh:mm> TAB <hh:mm> TAB <todo> TAB <tooltip> TAB <command>
# This Script reads the schedule file from $INPUT and evaluates its last field, i.e., the command

INPUT="/home/ary/schedule.txt"
TIME=$(date "+%H:%M")
CUR_COMMAND="echo nothing"

IFS=''
while read -r LINE; do
	START=$(awk -F'\t+' '{print $1}' <<<"$LINE")
	END=$(awk -F'\t+' '{print $2}' <<<"$LINE")
	LINE_COMMAND=$(awk -F'\t+' '{print $5}' <<<"$LINE")

  # If current time between Slots
	if [[ ($TIME > $START && $TIME < $END) ]]; then
    CUR_COMMAND=$LINE_COMMAND
		break
  # Midnight Case
	elif [[ ($END < $START && ($TIME > $START || $TIME < $END)) ]]; then
    CUR_COMMAND=$LINE_COMMAND
		break
	fi
done <"$INPUT"

eval $CUR_COMMAND
