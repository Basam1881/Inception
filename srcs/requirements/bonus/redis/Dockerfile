FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    redis

RUN mkdir -p /run/php

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf

EXPOSE 6379
WORKDIR /var/www/html/wp-content/plugins

ENTRYPOINT [ "bash", "-c" ]
CMD [ "redis-server --protected-mode no" ]