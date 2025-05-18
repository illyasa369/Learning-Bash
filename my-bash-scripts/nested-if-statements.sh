#!/bin/bash

: '
Simple script which takes two operands, the first operand being a name
which it will check if its first letter is in the first
or second half of the alphabet.

The script takes the second parameter as an age and checks if it is 
18 or above which it will then echo they are an adult. If not, it will 
calculate how many years left before the age is an adult age.

'
name="$1"
age="$2"

if [[ "$name" < n ]] ; then 
	echo "Your name $name begins with a letter in the first half of the alphabet."
	if [ "$age" -ge 18 ]; then 
		echo "You are an adult."
	else 
		echo "You are not an adult."
		echo "You have $((18 - age)) year(s) before you are an adult."
	fi
else
	echo "Your name $name begins with a letter in the second half of the alphabet."
	if [ "$age" -ge 18 ]; then 
                echo "You are an adult."
        else 
                echo "You are not an adult."
                yearsLeft=18-"$age"
                echo "You have $((18 - age)) year(s) before you are an adult."
	fi
fi
