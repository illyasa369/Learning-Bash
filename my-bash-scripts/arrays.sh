#!/bin/bash

set euo pipefail

count=0

userExit () {

	echo ""
	echo ""
	echo "The contents of your array is:"
	for item in "${myArray[@]}"
	do
		echo "$item"
		echo ""
	done

	exit 0
}

trap "userExit" SIGINT

while true 
do
	echo "Enter the value for position $count in the array. Use Ctrl+c to quit."
	read value
	echo ""
	myArray["$count"]="$value"
	count=$((count+1))
done
