#!/bin/bash

set -euo pipefail


echo "Enter the path of the file you wish to read from."
read filePath

if [ ! -e "$filePath" ]; then
	echo "File not found. Check your file path."
else
	while IFS= read -r line
	do 
		echo "$line"
	done < "$filePath"
fi
