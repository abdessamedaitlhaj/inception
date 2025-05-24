FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["php", "-S", "0.0.0.0:3000", "/var/www/html/index.html"]