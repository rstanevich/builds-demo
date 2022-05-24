FROM ubuntu:22.04 as build_stage
RUN apt update
RUN apt install -y golang-go

RUN go env -w GOPROXY=direct GOFLAGS="-insecure"

# Fetch dependencies
COPY go.mod go.mod
COPY go.sum go.sum
RUN go mod download

COPY . .
RUN go build -o app main.go

FROM scratch as run_stage
COPY --from=build_stage app app
CMD ["app"]
