FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y vsftpd \
    && rm -rf /var/lib/apt/lists/*


COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY tools/script.sh /

RUN chmod +x script.sh

ENTRYPOINT ["/script.sh"]