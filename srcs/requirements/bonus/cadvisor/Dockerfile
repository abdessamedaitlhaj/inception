FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.52.1/cadvisor-v0.52.1-linux-amd64 -o /usr/bin/cadvisor && \
    chmod +x /usr/bin/cadvisor

ENTRYPOINT ["/usr/bin/cadvisor"]
