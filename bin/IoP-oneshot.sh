#!/bin/bash

set -ex

# Generate IoPd.conf
IoP-init.sh

if [ $# -gt 0 ]; then
    args=("$@")
else
    args=("-rpcallowip=::/0")
fi

exec IoPd "${args[@]}"
