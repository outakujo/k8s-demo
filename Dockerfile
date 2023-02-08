FROM golang:latest as build

WORKDIR /go/src/demo

COPY . .

ENV GOPROXY https://goproxy.io,direct

RUN go get

RUN go build

FROM ubuntu:20.04

WORKDIR /opt/demo

COPY --from=build /usr/local/go/lib/time/zoneinfo.zip /opt/demo/zoneinfo.zip

COPY --from=build /go/src/demo/demo  /opt/demo/server

RUN apt update -y

RUN apt install -y --no-install-recommends ca-certificates curl

ENV GIN_MODE release

ENV ZONEINFO /opt/demo/zoneinfo.zip

ENTRYPOINT ["./server"]