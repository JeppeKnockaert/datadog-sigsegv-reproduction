FROM alpine:3.17

WORKDIR /opt/local/test/

RUN apk add --no-cache -U \
    curl \
    valgrind \
    gdb
RUN apk add --no-cache -U --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community  \
    php82-dbg \
    php82 \
    php82-opcache \
    php82-fpm

ADD https://github.com/DataDog/dd-trace-php/releases/download/0.83.0/datadog-setup.php /tmp/datadog-setup.php
RUN php82 /tmp/datadog-setup.php --php-bin=all

COPY ./index.php index.php
COPY ./php-fpm.conf /etc/php82/php-fpm.conf

EXPOSE 9000