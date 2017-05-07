IoPd for Docker
===================

Docker image that runs the IoP daemon

Quick Start
-----------

```bash
docker run \
  -d \
  -v /some/directory:/iopd \
  -p 8333:8333 \
  -p 8332:8332 \
  -p 4877:4877 \
  -e DISABLEWALLET=0 \
  --name=iopd \
  guggero/iopd
```

Start mining
------------

To start mining, edit your IoP.conf (should be in /some/directory/.IoP/ following the docker run command example above):

```
testnet=0
server=1
printtoconsole=1
rpcuser=ioprpc
rpcpassword=<SOMELONGRANDOMPASSWORD>
mine=1
minewhitelistaddr=<YOUR_PUBLIC_IOP_ADDRESSS>
mineto=<YOUR_PUBLIC_IOP_ADDRESSS>
```

Where `<YOUR_PUBLIC_IOP_ADDRESSS>` is the public IoP address that has been whitelisted.
