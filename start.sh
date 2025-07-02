#!/bin/bash

ENV_FILE=".env"

if [ ! -f "$ENV_FILE" ]; then
  echo "Error: $ENV_FILE not found." >&2
  exit 1
fi

mkdir -p data
mkdir -p roundcube

echo "Docker Mailserver for backups"
echo
echo "Access Roundcube at http://localhost:9002"
echo

docker compose -p backup-mailserver -f docker-compose.yaml up --build --force-recreate