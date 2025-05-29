#!/bin/bash

# Takes specified directory and threshold and monitors the size until it exceeds the threshold.

set -euo pipefail

monitorDir () {
	echo -e "\nMonitoring the directory..."
	while true
        do
		set +e
		currentSize=$(du "$1" | awk '{print $1}')
		set -e
		if [ ! -d "$1" ]; then
                	echo -e "\nDirectory has been moved or deleted."
                        exit 1
                elif (( "$currentSize" > "$2" )); then
			echo -e "\nSize of $1 is $currentSize KiB and has exceeded the threshold of $2 KiB."
                        exit 0
        	fi
	done
}


if [ "$#" -eq 0 ]; then
	# Prompt for the directory path.
        echo "Enter the path of the directory you wish to monitor:"
        read searchDir

        if [ ! -d "$searchDir" ]; then
		echo -e "\nValid path not given."
		exit 1
	fi
	# Gets size of directory.
	currentSize=$(du "$searchDir" | awk '{print $1}')
	echo -e "\nSize of $searchDir is $currentSize KiB."
	
	# Prompt for threshold.
	echo -e "\nEnter a threshold greater than the size of the directory:"
	read dirThreshold
	if [ "$dirThreshold" -eq "$dirThreshold" ] && (( "$currentSize" < "$dirThreshold" )); then
		monitorDir "$searchDir" "$dirThreshold"
	else
		echo -e "\nInvalid input given for threshold."
	fi
else
	if [ -d "$1" ] && [ "$2" -gt 0 ]; then
		monitorDir "$1" "$2"
	else
		echo -e "\nInvalid arguments given."
	fi
fi
