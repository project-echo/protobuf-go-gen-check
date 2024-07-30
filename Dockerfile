FROM golang:1.20-alpine

RUN apk add --no-cache protobuf protobuf-dev git
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.30.0
RUN go install github.com/twitchtv/twirp/protoc-gen-twirp@latest

RUN mkdir /cmd
COPY entrypoint.sh /cmd/entrypoint.sh
RUN chmod 555 /cmd/entrypoint.sh
ENTRYPOINT [ "/cmd/entrypoint.sh" ]
