#!/bin/bash

# Takes directory path, creates a backup directory and creates backup and 
# stores them in the backup directory. When the directory has 5 backups it
# removes the oldest backup before creating a new backup.

set -euo pipefail

checkDir () {
	if [ ! -d "$1" ]
	then
		echo "Invalid directory path."
		exit 1
	else
		return
	fi
}

backupDirectory () {

	cd "$1"
	cd ../

	directoryName=$(basename "$1")
	mkdir -p "$directoryName"_backups

	backupCount=$(ls "$directoryName"_backups | wc -l)
	if [ "$backupCount" -eq 5 ]
	then
		echo -e "Backup limit reached.\nRemoving oldest backup."
		oldestBackup=$(ls -l "$directoryName"_backups | sort -k 6,8 | awk '{print $9}' | head -n 1)
		rm -v "$directoryName"_backups/"$oldestBackup"
		tar -czf "$directoryName"_backups/backup_$(date +%Y%m%d_%H%M%S).tar.gz "$1"
		echo "Backup created."
	else
		echo "here"
		tar -czf "$directoryName"_backups/backup_$(date +%Y%m%d_%H%M%S).tar.gz "$1"
		echo "Backup created."
	fi
}

echo "Enter the path of the directory you wish to enable backups for:"
read searchDir

set +e
checkDir "$searchDir"
set -e

echo ""
backupDirectory "$searchDir"
