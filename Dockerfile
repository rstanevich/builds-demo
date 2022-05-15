FROM ubuntu:22.04

RUN apt update

RUN apt install -y golang-go && go version

RUN apt install -y libgeos-dev

COPY main.go .
COPY go.mod .

RUN go build -o app main.go

CMD ["app"]
