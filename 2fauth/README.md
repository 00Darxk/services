# Setup

Create a new user

```sh
sudo useradd 2fauth
sudo passwd 2fauth
```

Optionally add the user to the `docker` group
```sh
sudo usermod -aG docker 2fauth
```

Create directories and change ownership

```sh
sudo -s
mkdir -p /opt/2fauth/2fadata

cp docker-compose.yml /opt/2fauth/
cp -r tailscale-2fauth /opt/2fauth/
echo 'TS_KEY_2FAUTH=tskey-auth-...' > /opt/2fauth/.env

chown -R 2fauth:2fauth /opt/2fauth
chmod -R 700 /opt/2fauth
```

The default image runs as user with id `1000` and group id `1000`, to use the new user `2fauth` [build it locally](https://hub.docker.com/r/2fauth/2fauth#build-the-image)
```sh
docker build --build-arg UID="$(id -u 2fauth)" --build-arg GID="$(id -g 2fauth)" -t 2fauth/2fauth:local https://github.com/Bubka/2FAuth.git#<release-tag>
```


Start the container

```sh
su - 2fauth
cd /opt/2fauth && docker compose up -d
```

***

On update at least backup the db `database.sqlite`
