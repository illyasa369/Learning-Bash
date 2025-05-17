#!/bin/bash

chmod +x arithmetic.sh

num1=8
num2=5

addition=$(( num1 + num2 ))
subtraction=$(( num1 - num2 )) 
multiplication=$(( num1 * num2 ))
division=$(( num1 / num2 ))

echo "The first number is $num1"
echo "The second number is $num2"
echo ""
echo "$num1 add $num2 equals $addition"
echo "$num1 minus $num2 equals $subtraction"
echo "$num1 mutiply $num2 equals $multiplication"
echo "$num1 divide $num2 equals $division"
