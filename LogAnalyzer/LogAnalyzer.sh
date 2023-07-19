#!/bin/bash

# Function to display script usage
Usage() {
    echo "Usage: $0 <log_file> <pattern1> <pattern2> ..."
}

# Check if required arguments are provided
if [ $# -lt 2 ]; then
    Usage
    exit 1
fi

# Assign arguments to the variables
log_file=$1
shift
patterns=("$@")

# Check if the log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file '$log_file' does not exist."
    exit 1
fi

# Analyze the log file and extract relevant information
echo
echo "Analyzing log file: $log_file"
echo

# Loop through the specified patterns and extract matching lines
for pattern in "${patterns[@]}"; do
    echo "Pattern: $pattern"
    echo "------------------------"

    # Use grep to find line number, and lines matching the pattern
    matching_lines=$(grep -ni "$pattern" "$log_file")
   
   # Display the matching lines, line number and their count
    if [ -n "$matching_lines" ]; then
        echo "$matching_lines"
        echo "Match count: $(echo "$matching_lines" | wc -l)"
    else
        echo "No matches found."
    fi
 

    echo
done

