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
  echo "Please provide a 'short-lived access token'."
  exit 1
fi

RESPONSE=$(curl -s --location "https://graph.facebook.com/v16.0/oauth/access_token?grant_type=${longlived_grant_type}&client_id=${longlived_client_id}&client_secret=${longlived_client_secret}&fb_exchange_token=$1")
LONG_LIVED_ACCESS_TOKEN=$(echo $RESPONSE | jq -r '.access_token')

echo $LONG_LIVED_ACCESS_TOKEN