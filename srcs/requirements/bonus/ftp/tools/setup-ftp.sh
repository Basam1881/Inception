#!/bin/bash
id $FTP_USER
if [ "$?" -ne "0" ]
then
  # create ftp user
  useradd -d /var/ftp -s /bin/bash $FTP_USER
  echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

  # give ftp user access to /var/www/html
  echo "
  userlist_enable=YES
  userlist_file=/etc/vsftpd.user_list
  userlist_deny=NO
  " >> /etc/vsftpd.conf
  echo $FTP_USER > /etc/vsftpd.user_list

  usermod -aG www-data $FTP_USER
  mkdir -p /var/ftp/pub/wp-content/uploads
  chown $FTP_USER:www-data /var/ftp/pub/wp-content/uploads
fi