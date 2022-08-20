FROM caddy:2.5.2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/ueffel/caddy-brotli \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/transform-encoder \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/kirsch33/realip \
    --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:2.5.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy