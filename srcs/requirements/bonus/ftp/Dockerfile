FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

COPY tools/script.sh /

RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]