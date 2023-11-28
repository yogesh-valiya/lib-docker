#!/bin/bash

echo "Starting docker container..."
for var in "$@"; do
  echo "Starting $var..."
  /usr/bin/docker-compose -f /magento/dockers/docker/envs/$var/compose.yml down
  /usr/bin/docker-compose -f /magento/dockers/docker/envs/$var/compose.yml up -d
done
