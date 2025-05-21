#!/bin/bash

set -euo pipefail

recheck=0

checkPath() {

	if grep "$directory$" ~/.bashrc ; then
		if [ "$recheck" -eq 0 ]; then
			echo "Directory already exists in the path variable."
			exit 0
		elif [ "$recheck" -eq 1 ]; then
			echo "Directory has been added to the path variable."
			exit 0
		fi
	else
		if  [ "$recheck" -eq 1 ]; then
			echo "Failed to add the directory to path variable."
			exit 1
		else
			return 0
		fi
	fi

}

addDir () {

	echo "export PATH=$PATH:~/$directory" >> ~/.bashrc
	source ~/.bashrc
	echo ""
	recheck=1

}


echo "Enter the directory to append to PATH variable. (Enter . to use the current directory.)"
read directory
echo ""

if [ "$directory" = "." ]; then
	directory=$(pwd)
	checkPath
	addDir
	checkPath
elif [ -d "$directory" ]; then
	checkPath
	addDir
	checkPath
else
	echo "Directory does not exist."
	exit 1
fi
