#!/bin/bash

set -e
if [ ! -f "cookiecutter.json" ]; then
    echo "Run this script in the same directory as cookiecutter.json"
    exit 1
fi
path=$(pwd)

cd /tmp
sudo rm -rf web-app-test
sudo rm -rf postgres-db  # This is the same as postgres_database in cookiecutter.json

python -m cookiecutter --no-input $path

chmod -R +x ./web-app-test/scripts/
./web-app-test/scripts/create.sh
