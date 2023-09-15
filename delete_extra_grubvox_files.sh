#!/bin/bash

# Check if a folder path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

folder_path="$1"

# Check if the provided path is a directory
if [ ! -d "$folder_path" ]; then
    echo "Error: '$folder_path' is not a valid directory."
    exit 1
fi

# Delete files with the prefix "gruvbox_"
for file in "$folder_path"/gruvbox_*; do
    if [ -f "$file" ]; then
        rm "$file"
        echo "Deleted: $file"
    fi
done

echo "Deletion complete."

