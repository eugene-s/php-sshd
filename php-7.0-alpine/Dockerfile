FROM php:7.0-alpine
MAINTAINER Eugene Savchenko

ENV PROJECT_PATH /var/www/
ENV SSH_SERVER_KEYS /etc/ssh/host_keys/

#
# Copy rootfs files
#

COPY /rootfs /

#
# Install ssh-server for connect remote python interpreter
#

EXPOSE 22

RUN apk update && \
    apk add bash openssh && \
    mkdir -p ${SSH_SERVER_KEYS} && \
    mkdir ${PROJECT_PATH} && \
    echo -e "HostKey ${SSH_SERVER_KEYS}ssh_host_rsa_key" >> /etc/ssh/sshd_config && \
    echo -e "HostKey ${SSH_SERVER_KEYS}ssh_host_dsa_key" >> /etc/ssh/sshd_config && \
    echo -e "HostKey ${SSH_SERVER_KEYS}ssh_host_ecdsa_key" >> /etc/ssh/sshd_config && \
    echo -e "HostKey ${SSH_SERVER_KEYS}ssh_host_ed25519_key" >> /etc/ssh/sshd_config && \
    sed -i "s/#PermitRootLogin.*/PermitRootLogin\ yes/" /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd && \
    chmod +x /usr/local/bin/entrypoint.sh && \
    rm -rf /var/cache/apk/* /tmp/*

WORKDIR ${PROJECT_PATH}

#
# Saving dev virtualenv and ssh host keys
#

VOLUME ["${SSH_SERVER_KEYS}"]

CMD ["entrypoint.sh"]