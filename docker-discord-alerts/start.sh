#!/usr/bin/env bash

source .env

sed -r -i 's|__WEBHOOK_API__|${WEBHOOK_API}|g' config.json
sed -r -i 's|__CONTAINER_NAME__|${CONTAINER_NAME}|g' config.json

docker compose up -d
