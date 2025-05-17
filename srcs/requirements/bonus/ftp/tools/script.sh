#!/bin/bash

FTP_USER="$FTP_USER"
FTP_PASS=$(cat /run/secrets/ftp_password)
FTP_ROOT_DIR="$FTP_ROOT_DIR"

useradd -m -d "$FTP_ROOT_DIR" "$FTP_USER"

mkdir -p "$FTP_ROOT_DIR"
chown -R "$FTP_USER:$FTP_USER" "$FTP_ROOT_DIR"


echo "$FTP_USER:$FTP_PASS" | chpasswd


cat <<EOF > /etc/vsftpd.conf
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=2000
pasv_max_port=2100
pasv_address=ftp
ftpd_banner="Welcome to FTP."
local_root=$FTP_ROOT_DIR
EOF

exec vsftpd /etc/vsftpd.conf
