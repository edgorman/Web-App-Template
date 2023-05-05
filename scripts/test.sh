#!/bin/bash

set -e
if [ ! -f "cookiecutter.json" ]; then
    echo "Run this script in the same directory as cookiecutter.json"
    exit 1
fi

./scripts/create.sh

./tmp/web-app-test/scripts/create.sh
./tmp/web-app-test/scripts/start.sh
./tmp/web-app-test/scripts/test.sh
./tmp/web-app-test/scripts/stop.sh
./tmp/web-app-test/scripts/destroy.sh

./scripts/destroy.sh
