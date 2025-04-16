#!/bin/bash

# Path to the topics file
file="topics.txt"

# Count the total number of lines in the file
lines=$(wc -l < "$file")

# Generate a random number between 1 and the number of lines
random_line=$((RANDOM % lines + 1))

# Select the random topic
random_topic=$(sed -n "${random_line}p" "$file")

# Output the selected topic
echo "$random_topic"

