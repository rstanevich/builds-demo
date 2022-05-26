FROM ubuntu:22.04 as build_stage

# Large Layers
# > 300 MB
RUN apt-get update
RUN apt install -y golang-go git x509-util

# GO dependencies
COPY go.mod go.sum ./
RUN go mod download -x

# Compiling binary
COPY . ./
RUN go build -o app main.go

# Put binary into slim runtime image:
# ~30 MB + binary
FROM ubuntu:22.04 as run_stage
COPY --from=build_stage ./app /app
CMD ["/app"]

