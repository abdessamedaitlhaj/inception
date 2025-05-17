FROM debian:bullseye

RUN apt update && apt install -y \
    php php-mysql wget \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/adm.php

WORKDIR /var/www/html

CMD ["php", "-S", "0.0.0.0:8080", "adm.php"]