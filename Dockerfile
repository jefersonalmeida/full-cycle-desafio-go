FROM golang:1.8.3 as builder
WORKDIR /go/src/github.com/jefersonalmeida/full-cycle-go
COPY main.go  .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=builder /go/src/github.com/jefersonalmeida/full-cycle-go/main .
ENTRYPOINT ["./main"]