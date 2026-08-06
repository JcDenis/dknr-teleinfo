#!/bin/sh

set -e

cd /data
echo "> Preparing credentials"
sed -i -e "s|DKNR_USERNAME|${DKNR_USERNAME}|g" settings.js
sed -i -e "s|DKNR_HASH|$(expr substr "$(echo "${DKNR_PASSWORD}" | node-red admin hash-pw)" 11 100)|g" settings.js
sed -i -e "s|DKNR_SECRET|${DKNR_SECRET}|g" settings.js
echo "> Instaling packages"
npm install --unsafe-perm --no-update-notifier --no-fund --omit=dev
echo "> Running node-red"
cd /usr/src/node-red