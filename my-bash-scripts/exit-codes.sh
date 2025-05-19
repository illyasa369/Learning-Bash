#!/bin/bash

#This script checks whether a given command is installed and returns an exit code.

checkCommand () {
	command -v "$usrCommand" 2>/dev/null
	if [ "$?" -eq 0 ]; then 
		echo "The $usrCommand command exists."
		exit 0
	else
		echo "The $usrCommand command does not exist."
		exit 1
	fi

}

if [ "$#" -eq 0 ]; then 
	echo "Enter a command to check:"
	read usrCommand
	checkCommand "$usrCommand"
else
	usrCommand="$1"
	checkCommand "$usrCommand"
fi
