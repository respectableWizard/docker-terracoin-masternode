#!/bin/bash

set -ex

# This shouldn't be in the Dockerfile or containers built from the same image
# will have the same credentials.
if [ ! -e "$HOME/.IoP/IoP.conf" ]; then
    mkdir -p $HOME/.IoP

    echo "Creating IoP.conf"

    # Seed a random password for JSON RPC server
    cat <<EOF > $HOME/.IoP/IoP.conf
disablewallet=${DISABLEWALLET:-1}
printtoconsole=${PRINTTOCONSOLE:-1}
rpcuser=${RPCUSER:-ioprpc}
rpcpassword=${RPCPASSWORD:-`dd if=/dev/urandom bs=33 count=1 2>/dev/null | base64`}
EOF

fi

cat $HOME/.IoP/IoP.conf

echo "Initialization completed successfully"
