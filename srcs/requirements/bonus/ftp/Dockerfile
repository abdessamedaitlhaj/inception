FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vsftpd

RUN mkdir -p /home/aait-lha/data/ftp

WORKDIR /app

COPY tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT ["/app/script.sh"]