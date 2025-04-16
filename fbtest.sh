# #!/bin/bash

# # Load environment variables from .env file
# if [ -f .env ]; then
#   source .env
# else
#   echo ".env file not found!"
#   exit 1
# fi

# # Set your access token and page ID
# MESSAGE="This is a test"

# curl --location "https://graph.facebook.com/${XANDERMAR_FB_PAGE_ID}/feed" \
# --header "Content-Type: application/x-www-form-urlencoded" \
# --data-urlencode "access_token=${FACEBOOK_PAGE_ACCESS}" \
# --data-urlencode "message=$MESSAGE"

function greet() {
  local name=$1  # The first argument passed to the function
  echo "Hello, $name!"
}

# Call the function with a variable
user_name="Alice"
RESPONSE=$(greet "$user_name")

echo $RESPONSE
