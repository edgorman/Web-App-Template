#!/bin/bash

GITHUB_TOKEN="your_github_token"
REPO_URL="https://api.github.com/repos/{{cookiecutter.repository_owner}}/{{cookiecutter.repository_name}}/hooks"
WEBHOOK_URL="https://your-argocd-server/api/webhook"
SECRET="your_webhook_secret"

curl -H "Authorization: token $GITHUB_TOKEN" \
     -H "Content-Type: application/json" \
     -X POST \
     -d '{
           "name": "web",
           "active": true,
           "events": ["push"],
           "config": {
             "url": "'"$WEBHOOK_URL"'",
             "content_type": "json",
             "secret": "'"$SECRET"'"
           }
         }' \
     $REPO_URL
