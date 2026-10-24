#!/usr/bin/env sh

source .env

yes | cp -i prometheus/config/prometheus.yml.example prometheus/config/prometheus.yml
sed -r -i "s|__archeddar__|${ARCHEDDAR_IP}|g" prometheus/config/prometheus.yml
sed -r -i "s|__fromaggo__|${FROMAGGO_IP}|g" prometheus/config/prometheus.yml
sed -r -i "s|__archeese__|${ARCHEESE_URL}|g" prometheus/config/prometheus.yml
sed -r -i "s|__ntfy__|${NTFY_BASE_URL}|g" prometheus/config/prometheus.yml

username=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 64)
password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 64)

yes | cp -i alertmanager/alertmanager.yml.example alertmanager/alertmanager.yml
sed -r -i "s|__DEFAULT_NTFY_USERNAME__|${username}|g" alertmanager/alertmanager.yml
sed -r -i "s|__DEFAULT_NTFY_PASSWORD__|${password}|g" alertmanager/alertmanager.yml

yes | cp -i alertmanager/ntfy-alertmanager.example alertmanager/ntfy-alertmanager
sed -r -i "s|__DEFAULT_NTFY_USERNAME__|${username}|g" alertmanager/ntfy-alertmanager
sed -r -i "s|__DEFAULT_NTFY_PASSWORD__|${password}|g" alertmanager/ntfy-alertmanager
sed -r -i "s|__NTFY_BASE_URL__|${NTFY_BASE_URL}|g" alertmanager/ntfy-alertmanager
sed -r -i "s|__PROMETHEUS_BASE_URL__|${PROMETHEUS_BASE_URL}|g" alertmanager/ntfy-alertmanager

docker compose up -d $1
