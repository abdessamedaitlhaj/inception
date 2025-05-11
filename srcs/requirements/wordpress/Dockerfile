FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y curl php \
	php7.4-fpm php-mysql mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/data/wordpress
RUN service php7.4-fpm start

COPY tools/script.sh /script.sh

RUN chmod +x script.sh

ENTRYPOINT ["/script.sh"]