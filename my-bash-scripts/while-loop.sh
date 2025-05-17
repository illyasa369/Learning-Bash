#!/bin/bash
num="$1"
if [ "$num" -lt 50 ]; then
	while [ "$num" -lt 101 ]
	do
		echo "$num"
		((num++))
	done
elif [ "$num" -ge 50 ]; then 
	while [ "$num" -gt -1  ]
	do	
	echo "$num"
		((num--))
	done
fi
