#!/bin/bash
set -x

USER=terracoin

chown -R ${USER} .
exec gosu ${USER} "$@"
