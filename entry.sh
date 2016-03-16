#!/bin/sh

if [ ! -f "~/.authfile" ];then
    if [ "$PASSWORD"x != ""x ];then
        touch ~/.authfile
        echo "root:$PASSWORD" | chpasswd
    else
        echo "Please specified '-e PASSWORD=<your password>' on boot time"
        exit 1
    fi
fi

/usr/sbin/sshd -D
