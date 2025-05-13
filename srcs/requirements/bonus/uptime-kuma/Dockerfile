# Dockerfile for Uptime Kuma (Debian Bullseye based)
FROM debian:bullseye

RUN apt-get update && apt-get install -y git curl \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

RUN git clone https://github.com/louislam/uptime-kuma.git

WORKDIR /uptime-kuma

RUN npm run setup

ENTRYPOINT ["node", "server/server.js"]
