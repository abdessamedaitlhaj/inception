FROM debian:bullseye

RUN apt update && apt install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/data/mariadb
COPY tools/script.sh /app/script.sh

RUN chmod +x /app/script.sh

ENTRYPOINT [ "/app/script.sh" ]