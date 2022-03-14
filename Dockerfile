FROM golang:latest

WORKDIR $GOPATH/src/k8s-demo

COPY . .

ENV GOPROXY https://goproxy.io,direct

ENV GIN_MODE release

RUN go get

RUN go build

ENTRYPOINT ["./k8s-demo"]