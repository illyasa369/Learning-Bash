#!/bin/bash

# Prints 1-10 on seperate lines.

set -euo pipefail

for x in $(seq 1 10)
do
	echo "$x"
done
