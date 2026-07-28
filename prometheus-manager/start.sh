#!/usr/bin/env sh

source .env

yes | cp -i prometheus/config/prometheus.config.example prometheus/config/prometheus.yml
sed -r -i "s|__archeddar__|${ARCHEDDAR_IP}|g" prometheus/config/prometheus.yml

docker compose up -d
