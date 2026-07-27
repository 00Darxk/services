FROM alpine

RUN apk update && apk add --no-cache \
    unbound \
    wget \
    bind-tools \
    dnssec-root


ADD https://www.internic.net/domain/named.root /var/lib/unbound/root.hints
RUN chmod +r /var/lib/unbound/root.hints
# RUN unbound-anchor -a /var/lib/unbound/root.key

# RUN (rc=$(sed -r 's|100.100.100.100|127.0.0.11|g' /etc/resolv.conf) \
#     echo "$rc" > /etc/resolv.conf)

ENTRYPOINT ["unbound", "-d", "-c", "/etc/unbound/unbound.conf"]
