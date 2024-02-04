#!/bin/bash
COUNT=$(($(wc -l <~/todo.txt)-1))
TODOS=$(cat ~/todo.txt | head -c -1 - | sed -z 's/\n/\\n/g')
printf '{"text": "%s", "tooltip": "%s"}\n' "$COUNT" "$TODOS"
