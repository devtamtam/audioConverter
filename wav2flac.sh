#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

# Check if input directory exists
if [ ! -d "$1" ]; then
    echo "Error: Input directory '$1' not found."
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$2"

# Loop through all WAV files in the input directory and convert them to FLAC
for file in "$1"/*.wav; do
    if [ -f "$file" ]; then
        filename=$(basename -- "$file")
        filename_no_extension="${filename%.*}"
        ffmpeg -i "$file" -c:a flac "$2/${filename_no_extension}.flac"
    fi
done

echo "Conversion completed. FLAC files are saved in '$2' directory."



