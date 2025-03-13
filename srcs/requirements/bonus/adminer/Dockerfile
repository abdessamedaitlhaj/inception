FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php \
    php-mysql \
    wget \
    nano \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/index.php

RUN wget https://github.com/vrana/adminer/blob/master/designs/dracula/adminer.css -O /var/www/html/adminer.css

EXPOSE 8080

WORKDIR /var/www/html

CMD ["php", "-S", "0.0.0.0:8080"]