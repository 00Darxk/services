FROM jellyfin/jellyfin:latest

ARG JELLYFIN_USER=jellyfin
ARG UID=1000
ARG GID=1000
ARG RFFMPEG_SERVER=localhost

# Create user for jellyfin
RUN useradd ${JELLYFIN_USER} -u ${UID} -g ${GID} -m -s /bin/bash -d /var/lib/jellyfin

# Install rffmpeg dependencies
RUN apt-get update \
 && apt-get install --no-install-recommends --no-install-suggests --yes \
    openssh-client \
    python3-yaml \
    python3-click

# Install rffmpeg
ADD https://raw.githubusercontent.com/joshuaboniface/rffmpeg/master/rffmpeg /usr/local/bin/rffmpeg
RUN chmod 755 /usr/local/bin/rffmpeg \
 && chown ${UID}:${GID} /usr/local/bin/rffmpeg \
 && ln -sf /usr/local/bin/rffmpeg /usr/local/bin/ffmpeg \
 && ln -sf /usr/local/bin/rffmpeg /usr/local/bin/ffprobe

# Initialize rffmpeg
ADD https://raw.githubusercontent.com/joshuaboniface/rffmpeg/master/rffmpeg.yml.sample /etc/rffmpeg/rffmpeg.yml
RUN sed -i "s;#user: jellyfin;user: ${JELLYFIN_USER};g" /etc/rffmpeg/rffmpeg.yml \
 && sed -i "s;#owner: jellyfin;owner: ${JELLYFIN_USER};g" /etc/rffmpeg/rffmpeg.yml \
 && sed -i 's;#args:;args:;g' /etc/rffmpeg/rffmpeg.yml \
 && sed -r -i 's;#(.*)- "-i";\1- "";g' /etc/rffmpeg/rffmpeg.yml \
 && sed -i 's;#persist: 300;persist: 0;g' /etc/rffmpeg/rffmpeg.yml \
 && rffmpeg init --yes \
 && rffmpeg add --weight 1 ${RFFMPEG_SERVER} \
 && chmod 655 /etc/rffmpeg/rffmpeg.yml \
 && chown ${UID}:${GID} /etc/rffmpeg/rffmpeg.yml

# Define new entrypoint with rffmpeg
ENTRYPOINT ["/jellyfin/jellyfin", "--ffmpeg", "/usr/local/bin/ffmpeg"]
