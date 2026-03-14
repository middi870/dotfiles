#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${OPENROUTER_API_KEY:-}" ]]; then
echo "Error: OPENROUTER_API_KEY is not set"
exit 1
fi

curl -s https://openrouter.ai/api/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $OPENROUTER_API_KEY" \
-d '{
"model":"mistralai/mistral-7b-instruct",
"max_tokens":256,
"messages":[
{
"role":"user",
"content":"What is the meaning of life?"
}
]
}'
