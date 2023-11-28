#!/bin/bash

/usr/bin/docker ps --format "table {{.Names}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Ports}}"
