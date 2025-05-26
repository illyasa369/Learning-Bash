#!/bin/bash

# Takes a file path as input, parses the file and prints the fields.

set -euo pipefail

parsingOperators=("=" ":" ";" "," "|")
valid=false

parseFile () {
	echo ""
	while IFS="$2" read -r key value
	do
		echo -e "Key: $key\nValue: $value\n"
	done < "$1"
	exit 0
}

checkFilepath () {
	if [ ! -e "$1" ]
	then
		echo "Invalid file path provided."
		exit 1
	fi
}

checkOperator () {
        for x in "${parsingOperators[@]}"
        do
                if [ "$1" = "$x" ]
                then
                        return
		fi
        done
	echo "Invalid operator provided."
	exit 1
}


if [ "$#" -eq 0 ]; then
	# Prompt for the directory path.
        echo "Enter the path of the configuration file you wish to parse:"
        read usrFile
	checkFilepath "$usrFile"

	echo -e "\nEnter the operator you wish to parse the file with:"
	read usrOperator
	checkOperator "$usrOperator"	

	parseFile "$usrFile" "$usrOperator"
	
else
	checkFilepath "$1"
	checkOperator "$2"
	parseFile "$1" "$2"
fi
