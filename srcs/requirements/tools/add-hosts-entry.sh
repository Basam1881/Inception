#!/bin/bash

HOSTNAME="bnaji.42.fr"
IP_ADDRESS="127.0.0.1"

if ! grep -q "$HOSTNAME" /etc/hosts; then
    echo "$IP_ADDRESS   $HOSTNAME" | sudo tee -a /etc/hosts
fi
