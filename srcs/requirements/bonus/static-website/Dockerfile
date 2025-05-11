FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y php \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["php", "-S", "0.0.0.0:1111", "tools/index.html"]