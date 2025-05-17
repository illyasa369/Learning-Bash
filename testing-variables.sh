#!/bin/bash

# Automatically giving the script execute permissions.
chmod +x testing-variables.sh

# Variables
firstName="John"
lastName="Doe"
fullName="John Bash Doe"
johnAge=45

: ' 
All variables will be echoed to the stdout.
'

echo "First name:"
echo $firstName
echo ""
echo "Last name:"
echo  $lastName
echo ""
echo "Full name:"
echo  $fullName
echo ""
echo "Age:"
echo $johnAge
