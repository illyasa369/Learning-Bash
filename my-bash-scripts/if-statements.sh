#!/bin/bash

firstNum="$1"
secondNum="$2"

if [ "$firstNum" -gt "$secondNum" ] 
then
	echo "$firstNum is greater than $secondNum"
else
	echo "$secondNum is greater than $firstNum"
fi 
