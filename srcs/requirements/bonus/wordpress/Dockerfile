FROM debian:buster

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    php-fpm\
    php-mysql\
    sendmail \
    sudo \
    mariadb-client \
    redis

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /tmp && \
    tar xzf /tmp/latest.tar.gz -C /tmp && \
    rm /tmp/latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv /tmp/wordpress/* /var/www/html && \
    rm -rf /tmp/wordpress

# Download wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp
RUN chmod +x /tmp/wp-cli.phar && \
    mv /tmp/wp-cli.phar /usr/local/bin/wp

# make sure it's created 
RUN mkdir -p /run/php

# secure php
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini

# pass wordpress conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d

RUN cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Change permissions for /var/www/html
RUN chmod 775 /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/

# Change working directory
WORKDIR /var/www/html

# Expose the default PHP-FPM port
EXPOSE 9000

# setup wordpress
COPY tools/setup-wordpress.sh /tmp
RUN chmod +x /tmp/setup-wordpress.sh

# Run the setup script and start PHP-FPM
ENTRYPOINT [ "bash", "-c" ]
CMD [ "/tmp/setup-wordpress.sh && php-fpm7.3 -F --nodaemonize"]