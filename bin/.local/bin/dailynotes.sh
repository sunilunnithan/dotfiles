#!/bin/bash

YEAR=$(date +%Y)
MONTH=$(date +%m)
DIRECTORY="$HOME/notes/work/daily/$YEAR/$MONTH"

if [ ! -d "$DIRECTORY" ]; then
	mkdir -p "$DIRECTORY"
fi

noteFilename="$DIRECTORY/note-$(date +%Y-%m-%d).md"

if [ ! -f $noteFilename ]; then
	echo "# Notes for $(date +%Y-%m-%d)" >$noteFilename
fi

nvim -c "norm Go" \
	-c "norm Go## $(date +%H:%M)" \
	-c "norm G2o" \
	-c "norm zz" \
	-c "startinsert" $noteFilename
