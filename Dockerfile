FROM golang:1.17.2-alpine3.14 AS build

ENV GO111MODULE=on

RUN apk update
RUN apk add wget unzip bash

RUN wget --quiet https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip \
  && unzip terraform_1.0.9_linux_amd64.zip -d /terraform \
  && rm terraform_1.0.9_linux_amd64.zip

RUN apk add git \
  && git clone https://github.com/cloudflare/cf-terraforming.git /cf-terraforming \
  && cd /cf-terraforming \
  && git checkout master \
  && go build -o cf-terraforming cmd/cf-terraforming/main.go

FROM alpine:3.14.2

RUN apk add ca-certificates && update-ca-certificates

COPY --from=build /cf-terraforming/cf-terraforming /usr/local/bin/cf-terraforming
COPY --from=build /terraform/terraform /usr/local/bin/terraform

COPY provider.tf /provider.tf

RUN /usr/local/bin/terraform init

ENTRYPOINT ["/usr/local/bin/cf-terraforming"]
