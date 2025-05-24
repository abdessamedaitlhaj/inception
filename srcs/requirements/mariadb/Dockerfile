FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY tools/script.sh /

RUN chmod +x script.sh

ENTRYPOINT [ "/script.sh" ]
