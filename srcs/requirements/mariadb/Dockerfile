FROM debian:bullseye

RUN apt update && apt install -y mariadb-server \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/aait-lha/data/mariadb

WORKDIR /app

COPY tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT [ "/app/script.sh" ]