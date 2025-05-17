#!/bin/bash

if [ "$1" -lt 50 ]; then
	while [ "$1" -lt 100 ]
	do
		echo "$1"
		(("$1"++))
	done
elif [ "$1" -ge 50 ]; then 
	while [ "$1" -gt 0  ]
	do	
	echo "$1"
		(("$1"--))
	done
fi
