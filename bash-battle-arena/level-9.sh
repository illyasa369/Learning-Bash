#!/bin/bash
set -euo pipefail

# This will create a .log file in the pwd for the specified directory and will log
# any creations, updates and removals in the directory.

echo "Enter the directory to monitor:"
read fileName

logFile="$fileName.log"

if [ -d "$fileName" ]; then
	touch "$logFile"
	fswatch -t -x --event=Created --event=Updated --event=Removed "$fileName" >> "$logFile"
else
	echo "Directory not found, check the file path."
	exit 1
fi

