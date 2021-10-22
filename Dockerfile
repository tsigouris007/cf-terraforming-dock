ARG VERSION=master

FROM golang:1.17.2-alpine3.14 AS build

ENV GO111MODULE=on

RUN apk add git \
    && git clone https://github.com/cloudflare/cf-terraforming.git /cf-terraforming \
    && cd /cf-terraforming \
    && git checkout $VERSION \
    && go build -o cf-terraforming cmd/cf-terraforming/main.go

FROM alpine:3.14.2

RUN apk add ca-certificates && update-ca-certificates

COPY --from=build /cf-terraforming/cf-terraforming /usr/local/bin/cf-terraforming

ENTRYPOINT ["/usr/local/bin/cf-terraforming"]
