#!/bin/sh

echo "$RENEWAL_INTERVAL certbot renew" > /etc/crontabs/root

crond
