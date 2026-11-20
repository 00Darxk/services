#!/usr/bin/env bash

source .env

yes | cp -i prometheus/config/prometheus.yml.example prometheus/config/prometheus.yml

IP=$(ip address show dev enp2s0 | grep -oP '(?:\b\.?(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){4}' | head -1) HOSTNAME=$(hostname) docker compose up -d $1
