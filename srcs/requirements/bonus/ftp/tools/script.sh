#!/bin/bash

FTP_PASS=$(cat /run/secrets/ftp_password)

if [ ! -d "/home/$FTP_USER" ]; then
    useradd -m "$FTP_USER"
else
    useradd -d "/home/$FTP_USER" "$FTP_USER"
fi

echo "$FTP_USER:$FTP_PASS" | chpasswd

vsftpd /etc/vsftpd.conf
