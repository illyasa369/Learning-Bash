#!/bin/bash

set euo pipefail

count=0

while true 
do
	echo "Enter the value for position $count in the array."
	read value
	echo ""
	myArray["$count"]="$value"
	count=$((count+1))

	echo "To exit enter y or enter any other key to continue:"
	read response
	echo ""	
	if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
		echo "${myArray[@]}"
		exit 0
	else
		continue
	fi
done
