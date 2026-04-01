#!/bin/bash

#input from user
read -p "Enter directory to backup:" source_dir

#directory checking
if [ ! -d "$source_dir" ]; then
	echo "Directory does not exist!"
	exit 1
fi

#backup directory
backup_dir="$HOME/backups"
mkdir -p "$backup_dir"

#creating timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

#backup file name
backup_file="$backup_dir/backup_$timestamp.tar.gz"

#creating backup
tar -czf "$backup_file" "$source_dir"

echo "Backup created: $backup_file"

#Deleting backup folder older than 7 days
find "$backup_dir" -type f -mtime +7 -exec -rm {};

echo "Old backups cleaned!"


