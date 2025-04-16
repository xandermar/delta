#!/bin/bash

# Load environment variables from .env file
[ -f .env ] && source .env || { echo ".env file not found!"; exit 1; }

# set day
DAY=$(date +"%A")

# Check if the user provided a topic as a command-line argument
TOPIC=${1:-$(./selectTopic.sh)}

# Trim the TOPIC
TOPIC=$(echo "$TOPIC" | xargs)

# Generate description
DESC=$(./generateDescription.sh "$TOPIC")
echo "Generating an article about '$TOPIC'"

# generate article list-image
IMG=$(echo "$TOPIC" | tr ' ' '-')
LIST_IMAGE=$(./generateArticleImage.sh "$IMG")

# Variables
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
API_KEY="${CHATGPT_API_KEY}"

# Define the question you want to ask ChatGPT
QUESTION="Create a long article about $TOPIC in MARKDOWN format, with a minimum of 10 paragraphs, with a minimum of 450 words per paragraph, that does not use bullet points or numbered lists."

# Set the API endpoint
URL="https://api.openai.com/v1/chat/completions"

# Create the JSON payload
PAYLOAD=$(cat <<EOF
{
  "model": "gpt-4",
  "messages": [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "$QUESTION"}
  ],
  "max_tokens": 4096,
  "temperature": 0.7
}
EOF
)

# Make the API request and save the response
response=$(curl -s -X POST $URL \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${API_KEY}" \
  -d "$PAYLOAD")

# Extract the response content from the JSON
article=$(echo $response | jq -r '.choices[0].message.content')

# Output the response (optional)
# echo $response

# today's date
date_today=$(date '+%Y-%m-%d')

# Convert the string to lowercase and replace spaces with hyphens
formatted_string=$(echo "$TOPIC" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Generate filename
filename="${date_today}-${formatted_string}.md"

# Write YAML front matter to the file
echo "---" > "_posts/$filename"
echo "layout: post" >> "_posts/$filename"
echo "title:  \"$TOPIC\"" >> "_posts/$filename"
echo "description: $DESC" >> "_posts/$filename"
echo "date: $date_today" >> "_posts/$filename"
echo "categories: [$categories]" >> "_posts/$filename"
echo "list-image: /$LIST_IMAGE" >> "_posts/$filename"
echo "page-image: image" >> "_posts/$filename"
echo "featured: false" >> "_posts/$filename"
echo "permalink: /blog/${formatted_string}.html" >> "_posts/$filename"
echo "---" >> "_posts/$filename"
# echo "## {{ page.title }}" >> "_posts/$filename"
# echo "---" >> "_posts/$filename"

# Append the article to the file
echo "$article" >> "_posts/$filename"

# echo "Posting to Facebook..."
# FACEBOOK=$(./postToFacebook.sh "$TOPIC" "/blog/${formatted_string}.html")
#echo "./postToFacebook.sh \"$TOPIC\""
# echo "Posting to X..."
# X=$(./postToX.sh "$TOPIC")
# echo "Posting to Instagram..."
# INSTAGRAM=$(./postToInstagram.sh "$TOPIC")

echo "Blog post created: $filename"

git add . && git commit -m "Added article about $TOPIC" && git push
echo "Pushed to GitHub"
echo "Done!"