FROM debian:bullseye

RUN apt update && apt install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY tools/script.sh /app/script.sh

RUN chmod +x /app/script.sh

EXPOSE 3306

ENTRYPOINT [ "/app/script.sh" ]