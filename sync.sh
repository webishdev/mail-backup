#!/bin/bash

ENV_FILE=".env"

if [ ! -f "$ENV_FILE" ]; then
  echo "Error: $ENV_FILE not found." >&2
  exit 1
fi

NETWORK_NAME="mail-backup-network"

if ! docker network inspect "$NETWORK_NAME" >/dev/null 2>&1; then
  echo "Docker network '$NETWORK_NAME' does not exist. Use ./start.sh to start the environment"
  exit 1
fi

set -a
source .env
set +a 

echo "Will sync with $REMOTE_IMAP_SERVER for $IMAP_USER"

mkdir -p imapsync

docker run --rm --network=$NETWORK_NAME -v ${PWD}/imapsync:/log gilleslamiral/imapsync:2.306 imapsync -log --logdir /log --host1 $REMOTE_IMAP_SERVER --user1 $IMAP_USER --password1 $REMOTE_IMAP_PASSWORD --host2 mail-server --delete2 --delete2folders --user2 $IMAP_USER --password2 $LOCAL_IMAP_PASSWORD