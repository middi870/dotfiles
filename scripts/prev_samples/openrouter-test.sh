#!/usr/bin/env bash
set -e

if [ -z "$OPENROUTER_API_KEY" ]; then
  echo "ERROR: OPENROUTER_API_KEY is not set"
  exit 1
fi

curl -s https://openrouter.ai/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -d '{
    "model": "mistralai/mistral-7b-instruct",
    "max_tokens": 256,
    "messages": [
      {
        "role": "user",
        "content": "What is the meaning of life?"
      }
    ]
  }' \
#| jq -r '.choices[0].message.content' 


# // .error.message

