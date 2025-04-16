#!/bin/bash

# Check if the user provided a topic as a command-line argument
if [ -z "$1" ]; then
  echo "Please provide a topic as an argument."
  exit 1
fi

# Get the topic from the command-line argument
SEARCH_TERM="$1"

# Replace with your Unsplash API Access Key
ACCESS_KEY="RxGiRfHSy8bbx40h9hz770aFKkzWUlr1v-fKsTxfKuQ"

# Unsplash API URL
API_URL="https://api.unsplash.com/search/photos"

# Output file for the image
OUTPUT_FILE="$SEARCH_TERM.jpg"

# Fetch the first image URL
IMAGE_URL=$(curl -s -G "$API_URL" \
  -d "query=$SEARCH_TERM" \
  -d "client_id=$ACCESS_KEY" \
  -d "page=1" \
  -d "per_page=1" \
  -d "orientation=landscape" | \
  jq -r '.results[0].urls.small')

# Check if IMAGE_URL is not empty
if [ -z "$IMAGE_URL" ]; then
  echo "No image found for the search term '$SEARCH_TERM'."
  exit 1
fi

# Download the image
curl -s "$IMAGE_URL" -o "assets/images/$OUTPUT_FILE"

# Confirm the download
# if [ $? -eq 0 ]; then
#   echo "Image saved as $OUTPUT_FILE."
# else
#   echo "Failed to download the image."
#   exit 1;
# fi

echo "assets/images/$OUTPUT_FILE"