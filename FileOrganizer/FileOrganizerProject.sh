File Organizer: Write a script that organizes files in a directory based on their file extensions. The script should create separate directories for different file types and move the corresponding files into their respective directories.

#!/bin/bash

# Read input from the user
read -p "Enter Directory:" specified_directory

# Variable to count total folders or files in a directory
total_file_count=0

# Declare an Associative Array
declare -A file_extension_list   

echo "Print all file types in a given working directory"
echo "========================================================================"

for ind_file in $specified_directory
do

	if [ -d "$ind_file" ]; then
		file_name=$(basename "$ind_file")
		file_extension_list["$file_name"]="directory"
	else
        file_type=$(file -b --mime-type $ind_file)
		file_extension=$(basename $ind_file | cut -d. -f2)
		file_name=$(basename "$ind_file")
		file_extension_list["$file_name"]="$file_extension"
	fi
(( total_file_count++ ))

done

echo
echo "Total Files in a Given Directory is $total_file_count"
echo

for f_name in "${!file_extension_list[@]}"
do
	file_extension="${file_extension_list[$f_name]}"
	echo "$f_name -> $file_extension"
	echo "-------------------------------------------------------------"
	if [ -e "$file_extension" ]
	then
		mv "$f_name" "$file_extension"
	else
		mkdir $file_extension
		mv "$f_name" "$file_extension"
	fi
done
echo
echo "===================================================================="

output=$(ls "$specified_directory")
echo "View list of folders in a specified Directory: $output" 


