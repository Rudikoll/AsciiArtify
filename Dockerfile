FROM quay.io/projectquay/golang:1.20

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod tidy

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -o app .

CMD ["go", "test", "./..."]