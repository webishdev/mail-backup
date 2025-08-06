#!/bin/bash

echo "Docker Mailserver for backups"

ENV_FILE=".env"

if [ ! -f "$ENV_FILE" ]; then
  echo "Error: $ENV_FILE not found." >&2
  exit 1
fi

NETWORK_NAME="mail-backup-network"

if ! docker network inspect "$NETWORK_NAME" >/dev/null 2>&1; then
  echo "Docker network '$NETWORK_NAME' does not exist. Creating it..."
  docker network create "$NETWORK_NAME"
fi

mkdir -p data
mkdir -p roundcube

echo
echo "Access Roundcube at http://localhost:9002"
echo

docker compose -f docker-compose.yaml up --build --force-recreate