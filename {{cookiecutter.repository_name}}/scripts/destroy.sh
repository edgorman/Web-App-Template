#!/bin/bash

path="`dirname -- "$0"`/../"
docker-compose -f "$path/docker-compose.yaml" down -v --remove-orphans --rmi all
