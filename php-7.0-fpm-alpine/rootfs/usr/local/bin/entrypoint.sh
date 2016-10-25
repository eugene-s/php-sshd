#!/bin/ash

# Generate Host keys, if required
if ! ls /etc/ssh/host_keys/ssh_host_* 1> /dev/null 2>&1; then
    ssh-keygen -A
    mv /etc/ssh/ssh_host_* /etc/ssh/host_keys/

    chmod 600 -R /etc/ssh/host_keys/*
    chmod 700 /etc/ssh/host_keys/
fi

# Run supervisor
exec /usr/bin/supervisord