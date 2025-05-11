#!/bin/bash

FTP_USER="$FTP_USER"
FTP_PASS=$(cat /run/secrets/ftp_password)
FTP_ROOT_DIR="$FTP_ROOT_DIR"

useradd -m -d "$FTP_ROOT_DIR" "$FTP_USER"

echo "$FTP_USER:$FTP_PASS" | chpasswd

mkdir -p "$FTP_ROOT_DIR"
chown -R "$FTP_USER:$FTP_USER" "$FTP_ROOT_DIR"

cat <<EOF > /etc/vsftpd.conf
listen=YES
anonymous_enable=NO
local_enable=YES
listen_ipv6=NO
write_enable=YES
local_umask=022
allow_writeable_chroot=YES
connect_from_port_20=YES
pasv_enable=YES
pasv_min_port=2000
pasv_max_port=2100
ftpd_banner=Welcome to my FTP service.
local_root=$FTP_ROOT_DIR
EOF

exec vsftpd /etc/vsftpd.conf
