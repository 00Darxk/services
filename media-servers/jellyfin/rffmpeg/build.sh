#!/bin/sh

if [ -z "${1}" ] || [ -z "${2}" ] || [ -z "${3}" ] || [ -z "${4}" ] ; then
	echo "Missing parameters: build.sh $1 $2 $3 $4"
	echo 'Usage: build.sh <jellyfin-user> <uid> <gid> <rffmpeg-server>'
	exit 1
fi

docker build --build-arg JELLYFIN_USER="$1" --build-arg UID="$2" --build-arg GID="$3" --build-arg RFFMPEG_SERVER="$4" -t jellyfin/jellyfin:latest-rffmpeg .
