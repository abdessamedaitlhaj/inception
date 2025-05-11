FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vsftpd && \
    mkdir -p /var/run/vsftpd/empty && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/data/ftp

COPY tools/script.sh /

RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]