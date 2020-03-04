# Dockerfile for openconnect

## Quick start

```sh
docker build -t openconnect .
docker run --cap-add NET_ADMIN --device /dev/net/tun:/dev/net/tun \
    -e OPENCONNECT_URL=example.com \
    -e OPENCONNECT_AUTHGROUP=AGRP \
    -e OPENCONNECT_USER=foobar@example.com \
    -e OPENCONNECT_PASSWORD=Secr3t! \
    -e SSH_PUBKEY="ssh-ed25519 ..." \
    -d --name openconnect openconnect

ssh -J root@$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' openconnect) user@host
```
