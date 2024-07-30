#!/bin/sh
set -e -x -o pipefail

cd $1

git config --global --add safe.directory '*'

protoc -I. --go_out=go protos/*.proto
protoc -I. --go_out=go --twirp_out=go protos/api/*.proto

git diff
git diff-index --quiet HEAD
