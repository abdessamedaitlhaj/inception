FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz -o /tmp/portainer.tar.gz && \
    tar -xzf /tmp/portainer.tar.gz -C /usr/local/bin --strip-components=1 && \
    rm -f /tmp/portainer.tar.gz

EXPOSE 9443

ENTRYPOINT ["portainer"]