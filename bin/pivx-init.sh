#!/bin/bash

set -ex

# This shouldn't be in the Dockerfile or containers built from the same image
# will have the same credentials.
if [ ! -e "$HOME/.pivx/pivx.conf" ]; then
    mkdir -p $HOME/.pivx

    echo "Creating pivx.conf"

    # Seed a random password for JSON RPC server
    cat <<EOF > $HOME/.pivx/pivx.conf
printtoconsole=${PRINTTOCONSOLE:-1}
rpcuser=${RPCUSER:-pivxrpc}
rpcpassword=${RPCPASSWORD:-`dd if=/dev/urandom bs=33 count=1 2>/dev/null | base64`}
EOF

fi

cat $HOME/.pivx/pivx.conf

echo "Initialization completed successfully"
