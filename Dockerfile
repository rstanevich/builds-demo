FROM ubuntu:22.04 as base
RUN apt update
RUN apt install -y golang-go
COPY . .
RUN go build -o app main.go

FROM scratch
COPY --from=base app app
CMD ["app"]
