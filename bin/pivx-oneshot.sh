#!/bin/bash

set -ex

# Generate pivx.conf
pivx-init.sh

if [ $# -gt 0 ]; then
    args=("$@")
else
    args=("")
fi

exec pivxd

