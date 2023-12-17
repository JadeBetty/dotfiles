#!/bin/bash

# Define the directories to be replaced
dirs=(".config" ".icons" ".local")

# Define the target directory
target_base_dir="/home/$username"

# Loop over each directory
for dir in "${dirs[@]}"; do
    src_dir="./$dir"
    target_dir="$target_base_dir/$dir"

    # Check if the source directory exists
    if [ -d "$src_dir" ]; then
        # Remove the target directory if it exists
        if [ -d "$target_dir" ]; then
            rm -rf "$target_dir"
        fi

        # Copy the source directory to the target location
        cp -r "$src_dir" "$target_dir"
        echo "$dir directory has been replaced successfully."
    else
        echo "There's no $dir directory in the current directory."
    fi
done
