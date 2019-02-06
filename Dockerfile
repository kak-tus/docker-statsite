FROM alpine:3.9 AS build

RUN \
  apk add --no-cache \
    alpine-sdk \
    autoconf \
    automake \
    ca-certificates \
    git \
    libtool  \
    linux-headers \
  \
  && cd / \
  && git clone https://github.com/statsite/statsite.git \
  && cd statsite \
  && ./autogen.sh \
  && ./configure \
  && make

FROM alpine:3.9

RUN \
  apk add --no-cache \
    python

COPY --from=build /statsite/statsite /usr/local/bin/statsite
COPY --from=build /statsite/sinks /var/lib/statsite/sinks

EXPOSE 8125 8125/udp

CMD ["/usr/local/bin/statsite"]
