FROM ubuntu:22.04 as base

RUN apt update

RUN apt install -y golang-go

RUN apt install -y libgeos-dev && echo "DONE"

COPY . .

RUN go build -o app main.go

# CMD ["app"]


FROM ubuntu:22.10
COPY --from=base app app
CMD ["app"]
