#!/bin/bash

# Checks if hero.txt exits within the Arena directory
# Prints Hero found! if it does
# Prints Hero missing! if not 

set -euo pipefail

if [ -e "Arena/hero.txt" ]; then
	echo "Hero found!"
else
	echo "Hero missing!"
fi
