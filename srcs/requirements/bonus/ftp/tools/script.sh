#!/bin/bash

FTP_PASS=$(cat /run/secrets/ftp_password)

useradd -m "$FTP_USER"

echo "$FTP_USER:$FTP_PASS" | chpasswd

vsftpd /etc/vsftpd.conf
