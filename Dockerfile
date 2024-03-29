FROM caddy:2.7.5-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/ueffel/caddy-brotli \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/route53 \
    --with github.com/caddyserver/transform-encoder \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security \
    --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:2.7.5

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
