#!/bin/bash

echo "Stopping docker container..."

for var in "$@"; do
  echo "Stopping $var..."
  /usr/bin/docker kill $var
done