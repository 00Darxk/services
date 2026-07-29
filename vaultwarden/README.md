# Setup

Create a new user

```sh
sudo useradd vaultwarden
sudo passwd vaultwarden
```

Create directories and change ownership

```sh
sudo -s
mkdir -p /opt/vaultwarden/bwdata

cp docker-compose.yml /opt/vaultwarden/
cp -r tailscale-vaultwarden /opt/vaultwarden/
echo 'TS_KEY_VAULTWARDEN=tskey-auth-...' > /opt/vaultwarden/.env

chown -R vaultwarden:vaultwarden /opt/vaultwarden
chmod -R 700 /opt/vaultwarden
```

Start the container

```sh
su - vaultwarden
cd /opt/vaultwarden && docker compose up -d
```
