#!/bin/bash

echo "Starting docker container..."
for var in "$@"; do
  echo "Starting $var..."
  /usr/bin/docker-compose -f $(dirname "$0")/../docker/envs/$var/compose.yml down
  /usr/bin/docker-compose -f $(dirname "$0")/../docker/envs/$var/compose.yml up -d
done
