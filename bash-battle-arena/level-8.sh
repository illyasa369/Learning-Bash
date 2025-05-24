#!/bin/bash

# Searches for a given word or phrase within a directory
# prints the names of the files which return a result.

set -euo pipefail

if [ "$#" -eq 0 ]; then
	echo "Enter the word or phrase to search:"
	read searchTerm
	if  [ "searchTerm" = "" ]; then
		echo "No word/phrase given."
		exit 1
	fi
	
	echo "Enter the directory to search:"
	read dir
	if [ -d "$dir" ]; then
		grep -l "$searchTerm" "$dir"/*.log
	else
		echo "No directory found."
		exit 1
	fi
else
	grep -l "$1" "$2"/*.log
fi
