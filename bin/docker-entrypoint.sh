#!/bin/bash
set -x

USER=terracoin

chown -R ${USER} .
cron && exec gosu ${USER} "$@"
