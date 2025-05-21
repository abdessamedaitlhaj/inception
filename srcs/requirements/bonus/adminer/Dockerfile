FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php php-mysql wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /adm.php

CMD ["php", "-S", "0.0.0.0:8080", "/adm.php"]