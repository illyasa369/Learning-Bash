#!/bin/bash

: ' 
This script makes a directory called Arena creates three .txt files within it
and shows the contents of it.
'

set -euo pipefail

rm -rf Arena

mkdir Arena
touch Arena/warrior.txt Arena/mage.txt Arena/archer.txt
ls Arena
