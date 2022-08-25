#!/bin/sh

echo "$RENEWAL_INTERVAL cronbot renew" > /etc/crontabs/root

crond
