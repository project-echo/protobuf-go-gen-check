#!/bin/sh
set -e -x -o pipefail

cd $1

git config --global --add safe.directory '*'

protoc --go_out=go *.proto

git diff
git diff-index --quiet HEAD
