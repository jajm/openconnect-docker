FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
    openconnect \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/

EXPOSE 22
ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
