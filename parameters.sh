#!/bin/bash

chmod +x parameters.sh

echo "First parameter you passed: $1"
echo "Second parameter you passed: $2"
echo ""
echo "All parameters that were passed v"
echo $@
