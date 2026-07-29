#!/usr/bin/env bash

IP=$(ip address show dev enp2s0 | grep -oP '(?:\b\.?(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){4}' | head -1) docker compose up -d
