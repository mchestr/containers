FROM alpine AS builder
ARG VERSION
WORKDIR /snapcast

RUN apk add curl npm alpine-sdk cmake boost-dev alsa-lib-dev flac-dev
RUN npm install --silent --save-dev -g typescript@4.3
RUN curl -L https://github.com/badaix/snapweb/archive/refs/tags/v0.2.0.tar.gz | tar xz --directory / && cd /snapweb-0.2.0 && make

RUN curl -L https://github.com/badaix/snapcast/archive/refs/tags/v${VERSION}.tar.gz | tar xz --directory /
WORKDIR /snapcast-${VERSION}/build
RUN cmake .. -DBUILD_SERVER=ON -DBUILD_CLIENT=OFF -DBUILD_WITH_PULSE=OFF && cmake --build .

FROM alpine:edge

ARG VERSION
ARG WEB_VERSION

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk add --no-cache gdb librespot dbus avahi avahi-compat-libdns_sd flac-dev

COPY --from=builder /snapweb-0.2.0/dist /usr/share/snapserver/snapweb
COPY --from=builder /snapcast-${VERSION}/bin/snapserver /usr/bin/snapserver
COPY apps/snapserver/snapserver.conf /etc/snapserver.conf
COPY apps/snapserver/startup.sh startup.sh

EXPOSE 1704 1705 1780
ENTRYPOINT [ "./startup.sh" ]

LABEL org.opencontainers.image.source="https://github.com/badaix/snapcast"
