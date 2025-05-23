#!/bin/bash

set -euo pipefail

echo "Enter the path of the file to view its checksum:"
read filePath

if [ -d "$filePath" ]; then
	echo "$filePath is a directory"
	exit 1
elif [ -e "$filePath" ]; then
	echo ""
	echo "sha256sum:"
	sha256sum "$filePath"
	echo ""
	echo "md5sum:"
	md5sum "$filePath"
else
	echo "File not found."
	exit 1
fi
