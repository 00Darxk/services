#!/usr/bin/env sh

source .env

yes | cp -i prometheus/config/prometheus.yml.example prometheus/config/prometheus.yml
sed -r -i "s|__archeddar__|${ARCHEDDAR_IP}|g" prometheus/config/prometheus.yml
sed -r -i "s|__fromaggo__|${FROMAGGO_IP}|g" prometheus/config/prometheus.yml

docker compose up -d $1
