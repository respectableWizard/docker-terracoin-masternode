#!/bin/bash
set -x

EXECUTABLE=/opt/terracoin/bin/terracoind
DIR=$HOME/.terracoincore
FILENAME=terracoin.conf
FILE=$DIR/$FILENAME

# create directory and config file if it does not exist yet
if [ ! -e "$FILE" ]; then
    mkdir -p $DIR

    echo "Creating $FILENAME"

    # Seed a random password for JSON RPC server
    cat <<EOF > $FILE
printtoconsole=${PRINTTOCONSOLE:-1}
externalip=${MASTERNODE_IP}
rpcbind=127.0.0.1
rpcallowip=10.0.0.0/8
rpcallowip=172.16.0.0/12
rpcallowip=192.168.0.0/16
server=1
masternode=1
masternodeprivkey=${MASTERNODEGENKEY}
rpcuser=${RPCUSER:-terracoinrpc}
rpcpassword="${RPCPASSWORD:-`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;`}"
EOF

fi

cat $FILE
ls -lah $DIR/

echo "Initialization completed successfully"

exec $EXECUTABLE
