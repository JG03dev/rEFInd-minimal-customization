#!/bin/bash

# Check if three arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <folder_path> <old_prefix> <new_prefix>"
    exit 1
fi

folder_path="$1"
old_prefix="$2"
new_prefix="$3"

# Check if the provided path is a directory
if [ ! -d "$folder_path" ]; then
    echo "Error: '$folder_path' is not a valid directory."
    exit 1
fi

# Change the prefix of files from old_prefix to new_prefix in the folder
for file in "$folder_path"/*; do
    if [ -f "$file" ]; then
        # Extract the file name without the path
        filename=$(basename "$file")
        
        # Check if the filename starts with the old_prefix
        if [[ "$filename" == "${old_prefix}"* ]]; then
            # Replace old_prefix with new_prefix in the filename
            new_filename="${filename/${old_prefix}/${new_prefix}}"
            
            # Rename the file
            mv "$file" "$folder_path/$new_filename"
            
            echo "Renamed: $filename -> $new_filename"
        fi
    fi
done

echo "Prefix change complete."


