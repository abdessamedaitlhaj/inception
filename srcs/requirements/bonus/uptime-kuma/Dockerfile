# Dockerfile for Uptime Kuma (Debian Bullseye based)
FROM debian:bullseye

RUN apt-get update && apt-get install -y git curl

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get install -y nodejs \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/louislam/uptime-kuma.git

WORKDIR /uptime-kuma

RUN npm run setup

ENTRYPOINT ["node", "server/server.js"]
