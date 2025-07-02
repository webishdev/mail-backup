FROM mailserver/docker-mailserver:15.0.2

ARG IMAP_USER
ARG LOCAL_IMAP_PASSWORD

RUN setup email add ${IMAP_USER} ${LOCAL_IMAP_PASSWORD}