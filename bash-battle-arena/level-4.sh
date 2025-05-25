#!/bin/bash
# Creates a backup directory of Arena and copies all *.txt files to the backup.

set -euo pipefail
rm -rf Backup

mkdir Backup
cp Arena/*.txt Backup
ls Arena Backup
