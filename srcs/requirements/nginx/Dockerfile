FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx openssl -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -new -newkey rsa:4096 -nodes \
                -keyout /etc/nginx/ssl/cert.key \
                -out /etc/nginx/ssl/cert.crt \
                -sha256 -days 365 \
                -subj "/C=MA/ST=KH/L=KH/O=SELF/OU=IT/CN=aait-lha.42.fr"

ENTRYPOINT ["nginx", "-g", "daemon off;"]
