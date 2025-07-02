#!/bin/bash

mkdir -p data
mkdir -p roundcube

echo "Docker Mailserver for backups"
echo
echo "Access Roundcube at http://localhost:9002"
echo

docker compose -p backup-mailserver -f docker-compose.yaml up --build --force-recreate