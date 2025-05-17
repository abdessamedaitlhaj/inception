FROM debian:bullseye

RUN apt update && apt install -y mariadb-server \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*  # Remove cached APT metadata

WORKDIR /app

COPY tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT [ "/app/script.sh" ]
