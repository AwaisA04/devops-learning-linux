#!/usr/bin/env bash

Backup_Script() {

read -p "Enter source directory: " directory
Backup_directory="backup_$(date +"%Y-%m-%d_%H-%M")"
Count=0

if [ ! -d "$directory" ]; then
    echo "This directory does not exist"
    exit 1
else
    mkdir -p "$Backup_directory"
    echo "Backup directory created: $Backup_directory Copying .txt files..."

    for file in "$directory"/*.txt
     do
        if [ -f "$file" ]; then
        cp "$file" "$Backup_directory"
        ((Count++))
        fi
    done

    echo "Backup complete! Files backed up: $Count"

    fi

}

Backup_Script