#!/bin/bash

# Load environment variables from .env file
[ -f .env ] && source .env || { echo ".env file not found!"; exit 1; }

# Check if the user provided a topic as a command-line argument
if [ -z "$1" ]; then
  echo "Please provide a topic as an argument."
  exit 1
fi

# Get the topic from the command-line argument
TOPIC="$1"

CHARCOUNT=450

# Prompt for ChatGPT
PROMPT="Generate a description for an article with the topic '$TOPIC' in no more than $CHARCOUNT characters."

# Make the API request
response=$(curl -s -X POST https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${CHATGPT_API_KEY}" \
  -d '{
    "model": "gpt-4",
    "messages": [{"role": "user", "content": "'"$PROMPT"'"}],
    "max_tokens": 150
  }')



# Extract the response content
description=$(echo $response | jq -r '.choices[0].message.content')

# Output the description
echo "$description"
