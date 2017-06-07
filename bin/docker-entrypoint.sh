#!/bin/bash
set -ex

USER=pivx

chown -R ${USER} .
exec gosu ${USER} "$@"
