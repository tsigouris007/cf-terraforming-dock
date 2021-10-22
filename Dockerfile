ARG VERSION=fix_cf_provider

FROM golang:1.17.2-alpine3.14 AS build

ENV GO111MODULE=on

RUN apk update

RUN apk add ca-certificates && update-ca-certificates

RUN apk add git \
    && git clone https://github.com/tsigouris007/cf-terraforming.git /cf-terraforming \
    && cd /cf-terraforming \
    && git checkout $VERSION \
    && go build -o cf-terraforming cmd/cf-terraforming/main.go

FROM alpine:3.14.2

COPY --from=build /cf-terraforming/cf-terraforming /usr/local/bin/cf-terraforming

ENTRYPOINT ["/usr/local/bin/cf-terraforming"]
