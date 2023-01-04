#!/bin/bash
if [ ! -f /tmp/portfolio ];
then
  mkdir -p /var/www/html/bnaji 
  mv /tmp/portfolio/* /var/www/html/bnaji
  rm -rf /tmp/portfolio
fi