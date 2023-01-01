FROM debian:buster

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    php-fpm\
    php-mysql\
    sendmail \
    sudo \
    tini \
    && rm -rf /var/lib/apt/lists/*


# make sure it's created so 
RUN mkdir -p /run/php

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /tmp && \
    tar xzf /tmp/latest.tar.gz -C /tmp && \
    rm /tmp/latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv /tmp/wordpress/* /var/www/html && \
    rm -rf /tmp/wordpress

# secure php
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini

# pass wordpress conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d

# Download wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp
RUN chmod +x /tmp/wp-cli.phar && \
    mv /tmp/wp-cli.phar /usr/local/bin/wp

# Change working directory
WORKDIR /var/www/html

# Expose the default PHP-FPM port
EXPOSE 9000

# setup wordpress
COPY tools/setup-wordpress.sh /tmp
RUN chmod +x /tmp/setup-wordpress.sh

# Start PHP-FPM
ENTRYPOINT ["tini", "--"];
CMD ["/tmp/setup-wordpress.sh", "/usr/sbin/php-fpm7.3", "-F", "--nodaemonize"]
