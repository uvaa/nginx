#!/bin/sh

echo "$RENEWAL_INTERVAL root cronbot renew" > /etc/crontabs/root

crond
