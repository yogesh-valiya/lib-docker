#!/bin/bash

echo "Connecting to docker shell..."
/usr/bin/docker exec -it $1 bash
