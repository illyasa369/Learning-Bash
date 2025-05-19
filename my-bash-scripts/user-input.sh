#!/bin/bash

usrName=""
usrAge=-1

while [ "$usrName" = "" ] 
do
	echo "What is your name?"
	read usrName
done

while [ "$usrAge" -lt 0 ] || [ "$usrAge" = "" ]
do
	echo "How old are you in years?"
	read usrAge
done
echo
