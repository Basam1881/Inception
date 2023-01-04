FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd

RUN mkdir -p /var/ftp/pub && mkdir -p /var/run/vsftpd/empty

RUN sed -i '/^#write_enable/s/^#//' /etc/vsftpd.conf
RUN sed -i '/^#local_umask/s/^#//' /etc/vsftpd.conf

COPY tools/setup-ftp.sh /tmp
RUN chmod +x /tmp/setup-ftp.sh

WORKDIR /var/ftp/pub

EXPOSE 20 21

ENTRYPOINT [ "bash", "-c" ]
CMD [ "/tmp/setup-ftp.sh && vsftpd /etc/vsftpd.conf" ]
