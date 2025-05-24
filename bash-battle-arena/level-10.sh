#!/bin/bash

# Makes a directory and adds 5 .txt files with a random number of lines in each.

set -euo pipefail

rm -rf Arena_Boss Victory_Archive

mkdir Arena_Boss
for x in $( seq 1 5 )
do
	touch Arena_Boss/file"$x".txt
	n=$(( RANDOM % 10 + 11))
	for i in $( seq 1 "$n" )
	do
		echo "This is line number $i of this file." >> Arena_Boss/file"$x".txt
	done
	echo "$n lines added to Arena_Boss/file$x.txt"
done

# Finds all the .txt files in Arena_Boss and sorts them by size and prints the list.
echo ""
find Arena_Boss -maxdepth 1 -type f -name "*.txt" -ls | sort -k 7,7 -h | awk '{print $11, $7}'
echo ""


# This will pick a random file in the directory and add the word "Victory" 
y=$((RANDOM % 5 + 1))
echo "Victory" >> Arena_Boss/file"$y".txt
echo "Victory added to file$y.txt"

# Checks all files for the word "Victory" and if a match is found it is added to a new directory.
results=$(grep -li Victory Arena_Boss/* | wc -l)
if [ "$results" -gt 0 ]; then
	mkdir Victory_Archive
	for i in $( seq 1 "$results" )
	do
		file=$(grep -li Victory Arena_Boss/*)
		mv "$file" Victory_Archive
		echo "$file moved to Victory Archive."
	done
fi
