#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
  source .env
else
  echo ".env file not found!"
  exit 1
fi

# Check if the user provided a topic as a command-line argument
if [ -z "$1" ]; then
  echo "Please provide a topic as an argument."
  exit 1
fi

# Check if the user provided a path as a command-line argument
if [ -z "$2" ]; then
  echo "Please provide a path as an argument."
  exit 1
fi

# Get the topic from the command-line argument
TOPIC="$1"

# Variables
ARTICLE_URL="https://www.xandermar.com$2"
PAGE_NAME="xandermarllc"
API_KEY="${CHATGPT_API_KEY}"

# Check if OPENAI_API_KEY is set
if [ -z "$API_KEY" ]; then
  echo "Error: OPENAI_API_KEY is not set."
  exit 1
fi

# Define the prompt
PROMPT="Create a Facebook post for the page \"$PAGE_NAME\" announcing an article titled \"$TOPIC\" with the link \"$ARTICLE_URL\". The post should be engaging and highlight the value of the article."

# Escape special characters in the prompt for JSON
ESCAPED_PROMPT=$(echo "$PROMPT" | jq -R '.')

# Make the API call to ChatGPT
RESPONSE=$(curl -s https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d '{
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "system", "content": "You are a helpful assistant."}, {"role": "user", "content": '"$ESCAPED_PROMPT"'}],
    "max_tokens": 150,
    "temperature": 0.7
  }')

# Debug: Display the raw API response
# echo "API Response: $RESPONSE"
# exit

# Extract the generated text from the response
GENERATED_POST=$(echo "$RESPONSE" | jq -r '.choices[0].message.content')

# Check if the response contains a valid post
if [ -z "$GENERATED_POST" ] || [ "$GENERATED_POST" == "null" ]; then
  echo "Error: Failed to generate a Facebook post."
  exit 1
fi


curl --location "https://graph.facebook.com/${XANDERMAR_FB_PAGE_ID}/feed" \
--header "Content-Type: application/x-www-form-urlencoded" \
--data-urlencode "access_token=${FACEBOOK_PAGE_ACCESS}" \
--data-urlencode "message=$GENERATED_POST"