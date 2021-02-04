#!/bin/sh

if [[ -z "${DOMAIN}" ]]; then
    echo "DOMAIN enviroment variable must be defined." 1>&2
    exit -1
fi

if [[ -z "${EMAIL}" ]]; then
    echo "EMAIL enviroment variable must be defined." 1>&2
    exit -1
fi

certbot certonly --webroot \
  -m $EMAIL \
  --agree-tos \
  --no-eff-email \
  --webroot-path=/data/letsencrypt \
  -d $DOMAIN \
  -n \
  --post-hook /scripts/update_rancher.sh
