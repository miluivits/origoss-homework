FROM golang:1.21 AS builder
WORKDIR /app
ENV CGO_ENABLED=0 GOOS=linux
COPY . .
RUN go build -o server main.go

FROM gcr.io/distroless/base-debian12
WORKDIR /root
COPY --from=builder /app/server .
EXPOSE 8080
CMD ["./server"]
