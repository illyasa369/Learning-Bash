#!/bin/bash
# Counts the number of lines in a file given by the user.

set -euo pipefail

lineCount=0

set +u
filePath="$1"
set -u

if [ "$#" -eq 0 ]; then
	echo "No file provided."
elif [ -e "$filePath" ]; then 
	while IFS= read -r line; do
	lineCount=$((lineCount + 1))
	done < "$filePath"
	echo "$lineCount"
else
	echo "File not found."
	exit 1
fi

