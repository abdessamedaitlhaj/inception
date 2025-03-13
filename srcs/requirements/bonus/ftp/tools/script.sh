#!/bin/bash

# Set default FTP user and password
FTP_USER=${FTP_USER:-ftpuser}
FTP_PASS=${FTP_PASS:-ftppassword}
FTP_ROOT_DIR=${FTP_ROOT_DIR:-/var/ftp/pub}

# Create the FTP user if it doesn't exist
if ! id "$FTP_USER" &>/dev/null; then
    useradd -d $FTP_ROOT_DIR $FTP_USER
fi

# Set the FTP user's password
echo "$FTP_USER:$FTP_PASS" | chpasswd

# Create the FTP root directory
mkdir -p $FTP_ROOT_DIR
chown -R $FTP_USER:$FTP_USER $FTP_ROOT_DIR

# vsftpd configuration
cat <<EOF > /etc/vsftpd.conf
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_root=$FTP_ROOT_DIR
listen=YES
EOF

# Start vsftpd in the foreground
exec vsftpd /etc/vsftpd.conf