#!/bin/bash

set -euo pipefail

earlyExit=0
deleteFile=0
lineNumber=0
fileContent=()
filePath=""
usrChoice=""

trap "userExit" SIGINT


userExit () {
	if [ "$earlyExit" -eq 0 ]; then
		if [ "$deleteFile" -eq 0 ]; then
			rm "$filePath"
		fi
		echo ""
		echo ""
		exit 0
	fi

	if [ "$usrChoice" = "a" ]; then
	        echo ""
	        echo "Appending text to the file..."
	        for item in "${fileContent[@]}"
	        do
	                echo "$item" >> "$filePath"
		done
	        echo ""
	        echo "File has been appended."
		exit 0
	else
	        echo ""
	        echo "Writing to file..."
	        for item in "${fileContent[@]}"
	        do
			if [ "$item" = "${fileContent[0]}" ]; then
				echo "$item" > "$filePath"
	                else
				echo "$item" >> "$filePath"
			fi
		done
	        echo ""
		echo "File has been written to."
		exit 0
	fi
}


getFileContent () {
	echo ""
	echo "Enter the text to write to the file."
	echo "Press enter to enter a new line."
	echo "Use ctrl + c to stop."

	while true 
	do
        	read lineText
		earlyExit=1
		deleteFile=1
        	fileContent["$lineNumber"]="$lineText"
        	lineNumber=$((lineNumber+1))
	done
}


echo "Enter the path of the file you wish to write to."
echo "Current directory: $(pwd)"

read filePath

if [ ! -e "$filePath" ]; then
        set +e
        echo "" > "$filePath"
	exitCode="$?"
        set -e
        if [ "$exitCode" -gt 0 ]; then
                echo "File path invalid, unable to write to file."
        else
		echo "File created. $filePath"
                getFileContent
        fi

elif [ -d "$filePath" ];then 
	echo "This is a directory."
	exit 1

elif [ -e "$filePath" ]; then
	echo "File exists, do you wish to write (w) to or append (a) the file?"
	while true
        do
                read usrChoice
                if [ "$usrChoice" = "w" ] || [ "$usrChoice" = "a" ]; then
			getFileContent
                else
                        echo "Invalid input, use (w) or (a)."
                        continue
                fi
        done
fi
