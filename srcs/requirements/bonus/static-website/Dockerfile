FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y php \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY tools/index.html .

EXPOSE 3000

ENTRYPOINT ["php", "-S", "0.0.0.0:3000", "/app/index.html"]