FROM amd64/golang:1.14

WORKDIR /go/src/author

COPY go.sum go.mod ./

RUN go mod download

COPY . .

# 배포 환경 설정
ARG AUTHOR_ENV=dev

ENV GO111MODULE=on \
    GOOS=linux \
    GOARCH=amd64 \
    AUTHOR_ENV=$AUTHOR_ENV

# Build the Go app
RUN go build -o main .

# Expose port 9090 to the outside world
EXPOSE 9090

# Command to run the executable
CMD ["./main"]
