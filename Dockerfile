FROM golang:1.26-alpine

RUN apk add --no-cache protobuf protobuf-dev git
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.36.11
RUN go install github.com/twitchtv/twirp/protoc-gen-twirp@v8.1.3

RUN mkdir /cmd
COPY entrypoint.sh /cmd/entrypoint.sh
RUN chmod 555 /cmd/entrypoint.sh
ENTRYPOINT [ "/cmd/entrypoint.sh" ]
