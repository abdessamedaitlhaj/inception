FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y curl php \
    php7.4-fpm php-mysql \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app

COPY tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT ["/app/script.sh"]
