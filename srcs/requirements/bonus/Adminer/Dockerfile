FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    adminer

RUN mkdir -p /run/php

COPY tools/setup-adminer.sh /tmp
RUN chmod +x /tmp/setup-adminer.sh 

WORKDIR /var/www/html

ENTRYPOINT [ "bash", "-c" ]
CMD [ "/tmp/setup-adminer.sh && php-fpm7.3 --nodaemonize" ]