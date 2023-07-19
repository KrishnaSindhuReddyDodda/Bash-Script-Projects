File Backup: Create a script that takes a directory path and destination path as input and automates the process of backing up the files from the specified directory to the backup destination.


#!/bin/bash

# Function to display script usage
display_usage() {
    echo "Usage: $0 <source_directory> <backup_destination> [compression_format]"
	exit 1
}

# Check if required arguments are provided
if [ $# -lt 2 ]; then
	echo "Insufficient arguments"
    display_usage
fi

# Assign arguments to variables
source_directory=$1
backup_directory=$2


# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
	echo
    echo "Error: Source path '$source_directory' does not exist."
    exit 1
elif [ ! -d "$backup_directory" ]; then 
	echo
	echo "Error: destination path '$backup_directory' does not exist."
	echo "==========================================================="
	echo "Creating a backup directory"
	mkdir -p "$backup_directory"
else
	:
fi

echo "Copy all files from source path to the destination path"
echo "=========================================================================="
cp -r "$source_directory"/* "$backup_directory"
	

# Check if backup creation was successful
if [ $? -eq 0 ]; then
    echo "Backup created successfully."
else
    echo "Backup creation failed."
fi


