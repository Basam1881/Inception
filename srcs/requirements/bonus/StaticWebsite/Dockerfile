FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    git

RUN git clone https://github.com/Basam1881/Portfolio.git /tmp/portfolio

RUN mkdir -p /run/php

COPY tools/setup-static-website.sh /tmp
RUN chmod +x /tmp/setup-static-website.sh 

WORKDIR /var/www/html

ENTRYPOINT [ "bash", "-c" ]
CMD [ "/tmp/setup-static-website.sh && php-fpm7.3 --nodaemonize" ]