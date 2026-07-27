#!/usr/bin/env bash

IP=$(ip -f inet addr show eth0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') docker compose up -d
