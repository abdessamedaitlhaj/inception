FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl php php-redis \
    php7.4-fpm php-mysql \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php
RUN echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/script.sh /

RUN chmod +x script.sh

ENTRYPOINT ["/script.sh"]
