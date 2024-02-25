#!/bin/bash
INPUT="/home/ary/todo.txt"
COUNT=$(($(wc -l <"$INPUT") - 1))
TODOS=$(cat $INPUT | head -c -1 - | sed -z 's/\n/\\n/g')
printf '{"text": "%s", "tooltip": "%s"}\n' "$COUNT" "$TODOS"
