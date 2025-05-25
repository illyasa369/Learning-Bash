#!/bin/bash

# Makes a directory and adds three .txt files
# Checks if a specific file exists within the directory
# If it does, a new direcory is made and the file is moved into it.

set -euo pipefail
rm -rf Battlefield Archive

mkdir Battlefield
touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt
if [ -e "Battlefield/knight.txt" ]; then
	mkdir Archive
	mv Battlefield/knight.txt Archive
	ls Battlefield Archive
fi
