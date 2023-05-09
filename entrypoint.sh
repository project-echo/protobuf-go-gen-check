#!/bin/sh
set -e -x -o pipefail

git config --global --add safe.directory '*'

protoc --go_out=go *.proto

git diff
git diff-index --quiet HEAD
