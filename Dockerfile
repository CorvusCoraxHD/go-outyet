FROM golang:1.19 AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /go-outyet

EXPOSE 8080

CMD ["/go-outyet"]
