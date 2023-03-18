#!/bin/bash

set -e
if [ ! -f "cookiecutter.json" ]; then
    echo "Run this script in the same directory as cookiecutter.json"
    exit 1
fi

./scripts/create.sh

./tmp/farp-template-test/scripts/create.sh
./tmp/farp-template-test/scripts/start.sh
./tmp/farp-template-test/scripts/test.sh
./tmp/farp-template-test/scripts/stop.sh
./tmp/farp-template-test/scripts/destroy.sh

./scripts/destroy.sh
