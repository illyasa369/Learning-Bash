#!/bin/bash

# Finds all the .txt files in a directory, sorts them by size
# and returns the filename and size.

set -euo pipefail

if [ "$#" -eq 0 ]; then
	find -maxdepth 1 -type f -name "*.txt" -ls | sort -k 7,7 -h | awk '{print $11, $7}'
else
	find "$1" -maxdepth 1 -type f -name "*.txt" -ls | sort -k 7,7 -h | awk '{print $11, $7}'
fi
