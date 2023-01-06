#!/bin/bash
if [ ! -f /tmp/portfolio ];
then
  mkdir -p /var/www/html/$USERNAME 
  mv /tmp/portfolio/* /var/www/html/$USERNAME
  rm -rf /tmp/portfolio
fi