# Smart Backup System

## Description

This is a simple Bash script I created to take backups of any folder. It creates a compressed file with date and time so that backups don’t overwrite each other.

## Features

* Takes backup of any directory
* Adds timestamp to backup file
* Compresses backup using tar.gz
* Removes old backups automatically

## How to Run

```bash
chmod +x Smart_Backup_System.sh
./Smart_Backup_System.sh
```

## Example

You just need to enter the folder path, and it will create a backup inside the backups directory.

## Use Case

This can be used to automate backups in Linux systems, especially useful in DevOps and server management.

