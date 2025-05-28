#!/bin/bash

# Interactive user menu

set -euo pipefail

while true
do
	echo -e "\nSelect an option from the following menu by entering the number which corresponds to the action you wish to perform."
	echo -e "\n1 : View system uptime.\n2 : Check disk space.\n3 : Backup Arena directory.\n4 : Parse settings.conf\n5 : Exit.\n"
	read usrChoice

	case "$usrChoice" in
		1)
			echo -e "\nSystem uptime:\n$(uptime)\n"
			;;
		2)
			echo -e "\nDisk space:\n$(df)\n"
			;;
		3)
			directoryName=$(basename "Arena")
		        mkdir -p "Arena"_backups

		        backupCount=$(ls -l "$directoryName"_backups | sed 1d | wc -l)
			if [ "$backupCount" -gt 2 ]
		        then
		                echo -e "\nBackup limit exceeded, removing old backups."
				removeBackups=$(( "$backupCount" - 2 ))
				for x in $( seq 1 "$removeBackups")
				do
		                	oldestBackup=$(ls -l Arena_backups | sort -k 6,8 | sed 1d | awk '{print $9}' | head -n 1)
					rm -v Arena_backups/"$oldestBackup"
					echo -e "Removed $oldestBackup.\n"
		                done
				tar -czf "$directoryName"_backups/backup_$(date +%Y%m%d_%H%M%S).tar.gz Arena
		                echo "Backup created in Arena_backups directory."
		        else
		                tar -czf Arena_backups/backup_$(date +%Y%m%d_%H%M%S).tar.gz Arena
		                echo "Backup created in Arena_backups directory."
		        fi

			;;
		4)
			echo -e "\nParsing settings.conf\n"
			if [ -f settings.conf ]; then
				while IFS='=' read -r key value
				do
					if [[ -z "$key" || "$key" == \#* ]]; then
       						continue
    					fi
					key=$(echo "$key" | xargs)
					value=$(echo "$value" | xargs)
					echo -e "Key - $key\nValue - $value\n"
				done < settings.conf
			else 
				echo "settings.conf not found.\n"
			fi
			;;
		5)
			exit 0
			;;
		*)
			echo -e "\nInvalid option.\n"
	esac
	echo -e "\n====================================================================================================================\n"
done
