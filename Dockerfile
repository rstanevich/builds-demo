FROM ubuntu:22.04 as build_stage
ENV GOPROXY=direct GOFLAGS="-insecure"

# Large Layers
RUN apt update
RUN apt install -y golang-go git

# GO dependencies
COPY go.mod go.sum ./
RUN go mod download -x

# Compiling binary
COPY . ./
RUN go build -o app main.go

# Put binary into slim runtime image
FROM scratch as run_stage
COPY --from=build_stage app app
CMD ["app"]
