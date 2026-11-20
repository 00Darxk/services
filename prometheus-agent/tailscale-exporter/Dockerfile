FROM alpine:latest

ADD https://github.com/adinhodovic/tailscale-exporter/releases/latest/download/tailscale-exporter-linux-amd64 tailscale-exporter
RUN chmod +x tailscale-exporter \
 && apk add wget

EXPOSE 9250

ENTRYPOINT ./tailscale-exporter --tailscale-tailnet ${TAILSCALE_TAILNET} --tailscale-oauth-client-id ${TAILSCALE_OAUTH_CLIENT_ID} --tailscale-oauth-client-secret ${TAILSCALE_OAUTH_CLIENT_SECRET}
HEALTHCHECK --interval=10s --timeout=15s --start-period=40s --retries=10 \
	CMD [ "wget", "-q", "--spider", "http://localhost:9250" ]
