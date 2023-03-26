#!/bin/bash

set -e
if [ ! -d "/tmp/web-app-test" ]; then
    echo "Run the create.sh script first before running destroy.sh"
    exit 1
fi

cd /tmp

chmod -R +x web-app-test/scripts/
./web-app-test/scripts/destroy.sh

sudo rm -rf web-app-test
sudo rm -rf postgres-db  # This is the same as postgres_database in cookiecutter.json
