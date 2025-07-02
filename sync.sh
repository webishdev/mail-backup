#!/bin/bash

ENV_FILE=".env"

if [ ! -f "$ENV_FILE" ]; then
  echo "Error: $ENV_FILE not found." >&2
  exit 1
fi

set -a
source .env
set +a 

echo "Will sync with $REMOTE_IMAP_SERVER for $IMAP_USER"

imapsync --host1 $REMOTE_IMAP_SERVER --user1 $IMAP_USER --password1 $REMOTE_IMAP_PASSWORD --host2 localhost --port2 9003 --delete2 --delete2folders --user2 $IMAP_USER --password2 $LOCAL_IMAP_PASSWORD