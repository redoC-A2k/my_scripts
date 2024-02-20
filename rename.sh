#!/bin/bash

# Get the list of video and subtitle files
files=(*.mp4)

# Counter to track the new numbering
counter=1

# Iterate through the files
for file in "${files[@]}"; do
    # Extract the current number from the file name
    current_number=$(echo "$file" | grep -oE '[0-9]+' | head -1)
    
    # Generate the new file name
    new_file=$(echo "$file" | sed "s/$current_number/$counter/")

    # Rename the file
    mv "$file" "$new_file"

    # Increment the counter
    ((counter++))
done

echo "Files renamed successfully."

