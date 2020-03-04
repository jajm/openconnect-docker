#!/bin/sh

mkdir -p /run/sshd

if [ -n "$SSH_PUBKEY" ]; then
    mkdir -p /root/.ssh
    echo "$SSH_PUBKEY" > /root/.ssh/authorized_keys
fi

echo "$OPENCONNECT_PASSWORD" | openconnect -u "$OPENCONNECT_USER" --authgroup "$OPENCONNECT_AUTHGROUP" --passwd-on-stdin $OPENCONNECT_URL -b

exec "$@"
