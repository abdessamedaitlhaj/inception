FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

COPY tools/ /usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]