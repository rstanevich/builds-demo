FROM ubuntu:22.04

RUN apt update

RUN apt install -y golang-go

RUN apt install -y libgeos-dev && echo "DONE"

COPY . .

RUN go build -o app main.go

CMD ["app"]
