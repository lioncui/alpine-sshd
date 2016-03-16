FROM alpine:latest

MAINTAINER lioncui@163.com

ADD localtime /etc/localtime

RUN apk --update add bash openssh && \
    mkdir -p ~root/.ssh && chmod 700 ~root/.ssh/ && \
    echo -e "Port 22\n" >> /etc/ssh/sshd_config && \
    ssh-keygen -A && \
    echo "Asia/Shanghai" >> /etc/timezone && \
    sed -i "s/\\\\h:\\\\w\\\\\\$/[\\\\u@\\\\h \\\\w]\\\\$/" /etc/profile && \
    rm -rf /var/cache/apk/*

EXPOSE 22/tcp

ADD entry.sh /etc/entry.sh

RUN chmod +x /etc/entry.sh

ENTRYPOINT ["/etc/entry.sh"]
