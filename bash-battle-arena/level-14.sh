#!/bin/bash

# Interactive user menu

set -euo pipefail

while true
do
	echo -e "\nSelect an option from the following menu by entering the number which corresponds to the action you wish to perform."
	echo -e "\n1 : View system uptime.\n2 : Check disk space.\n3 : View users on the system.\n4 : View groups on the system.\n5 : Locate a file or directory.\n6: Exit.\n"
	read usrChoice

	case "$usrChoice" in
		1)
			echo -e "\nSystem uptime:\n$(uptime)\n"
			;;
		2)
			echo -e "\nDisk space:\n$(df)\n"
			;;
		3)
			echo -e "\nUsers on this system:\n$(cut -f1 -d: /etc/passwd)\n"
			;;
		4)
			echo -e "\nGroups on this system:\n$(cut -f1 -d: /etc/group)\n"
			;;
		5)
			echo -e "\nEnter the file or directory you wish to locate."
			read search

			set +e
			find / -name "$search"  2>/dev/null
			set -e

			echo ""
			;;
		6)
			exit 0
			;;
		*)
			echo -e "\nInvalid option.\n"
	esac
	echo -e "\n====================================================================================================================\n"
done
