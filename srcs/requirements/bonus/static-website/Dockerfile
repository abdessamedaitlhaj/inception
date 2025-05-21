FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php \
    && rm -rf /var/lib/apt/lists/*

COPY tools/index.html /

EXPOSE 3000

ENTRYPOINT ["php", "-S", "0.0.0.0:3000", "/index.html"]