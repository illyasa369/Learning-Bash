#!/bin/bash

set euo pipefail

count=0

userExit () {

	echo "${myArray[@]}"
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
