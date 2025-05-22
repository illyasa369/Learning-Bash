#!/bin/bash

mkdir Battlefield
touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt
if [ -e "Battlefield/knight.txt" ]; then
	mkdir Archive
	mv Battlefield/knight.txt Archive
	ls Battlefield Archive
fi
