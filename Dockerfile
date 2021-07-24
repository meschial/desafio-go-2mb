FROM golang:alpine
COPY main.go .
ENV CGO_ENABLED=0
RUN go build main.go

FROM scratch
COPY --from=0 /go/main .
CMD ["./main"]