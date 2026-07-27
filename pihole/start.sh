#!/usr/bin/env bash

TS_IP=$(tailscale ip -4) IP=$(ip -f inet addr show eth0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') docker compose up -d
