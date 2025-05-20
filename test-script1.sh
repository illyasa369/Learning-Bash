#!/bin/bash

set euo pipefail

echo "Enter the directory to append to PATH variable. (Enter . to use the current directory.)"
read directory

check () {



}

if [ directory = "." ]; then
	currentDir=$(pwd)
	echo "export PATH=$PATH:~/$currentDir" >> ~/.bashrc
        source ~/.bashrc
	echo "$?"
elif [ -d "$directory" ]; then
	grep "$directory" ~/.bashrc
	if [ "$?" -eq  1 ]; then
		echo "export PATH=$PATH:~/$directory" >> ~/.bashrc
        	source ~/.bashrc
		echo "Success: Directory has been added to the path variable."
	else
		echo "Fail: Directory already appended to the path variable." 
else
	echo "Directory does not exist."
	exit 1
fi
