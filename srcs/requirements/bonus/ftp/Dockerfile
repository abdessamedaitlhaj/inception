FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vsftpd \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty

WORKDIR /app

COPY tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT ["/app/script.sh"]