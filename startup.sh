#!/bin/bash

# prepare ssh server
mkdir -p /var/run/sshd
sed -i '/PermitRootLogin/c PermitRootLogin yes' /etc/ssh/sshd_config
if [ ! $SSHPW ]; then  
    SSHPW=`pwgen -c -n -1 12`
fi
echo "root:$SSHPW" | chpasswd
echo "ssh login password: $SSHPW"

if [ -n "$RESOLUTION" ]; then
    sed -i "s/1024x768/$RESOLUTION/" /root/supervisord.conf
fi

# start up supervisord, all daemons should launched by supervisord.
/usr/bin/supervisord -c /root/supervisord.conf

# start a shell
/bin/bash
