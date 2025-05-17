#!/bin/bash

chmod +x arithmeticWithParameters.sh

num1="$1"
num2="$2"

addition=$((num1+num2))
subtraction=$((num1-num2)) 
multiplication=$((num1*num2))
division=$((num1/num2))

echo "The first number is $num1"
echo "The second number is $num2"
echo ""
echo "$num1 add $num2 equals $addition"
echo "$num1 minus $num2 equals $subtraction"
echo "$num1 mutiplied by $num2 equals $multiplication"
echo "$num1 divided by $num2 equals $division"
