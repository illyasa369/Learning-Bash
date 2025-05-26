#!/bin/bash

# Takes specified directory and threshold and monitors the size until it exceeds the threshold.

set -euo pipefail

parseFile () {
	echo ""
	while IFS='=' read -r key value
	do
		echo -e "Key: $key\nValue: $value\n"
	done < "$1"
	exit 0
}

if [ "$#" -eq 0 ]; then
	# Prompt for the directory path.
        echo "Enter the path of the configuration file you wish to parse:"
        read usrFile

        if [ ! -e "$usrFile" ]; then
		echo -e "Invalid path given."
		exit 1
	else
		parseFile "$usrFile"
	fi

else
	if [ -e "$1" ]; then
		parseFile "$1"
	else
		echo -e "Invalid arguments given, first parameter must be a valid file path."
	fi
fi
