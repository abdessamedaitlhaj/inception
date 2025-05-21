#!/bin/bash

FTP_PASS=$(cat /run/secrets/ftp_password)

useradd -m -d "/home/$FTP_USER/ftp" "$FTP_USER"
echo "$FTP_USER:$FTP_PASS" | chpasswd
chown -R "$FTP_USER:$FTP_USER" /home/"$FTP_USER"/ftp
chmod 755 /home/"$FTP_USER"

exec vsftpd /etc/vsftpd/vsftpd.conf
