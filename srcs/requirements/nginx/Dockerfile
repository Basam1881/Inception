FROM debian:buster

# Install dependencies
RUN apt-get update && apt-get install -y nginx \
    tini \
    && rm -rf /var/lib/apt/lists/* 

COPY certs/certificate.pem /etc/ssl/certs/certificate.pem
COPY certs/key.pem /etc/ssl/private/key.pem

# Copy the NGINX configuration
COPY conf/default.conf /etc/nginx/sites-enabled/default

WORKDIR /var/www/html

# Expose port 443 and run NGINX as a non-root user
EXPOSE 443

# USER nginx
ENTRYPOINT [ "tini", "--" ]
CMD ["nginx", "-g", "daemon off;"]
