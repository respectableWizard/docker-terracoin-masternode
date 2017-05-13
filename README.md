pivx masternode for docker
===================

Docker image that runs the pivx daemon which can be turned into a masternode with the correct configuration.

Quick Start
-----------

```bash
docker run \
  -d \
  -v /some/directory:/pivx \
  -p 51472:51472 \
  --name=pivx \
  guggero/pivx
```

This will create the folder `.pivx` in `/some/directory` with a bare `pivx.conf`. You might want to edit the `pivx.conf` before running the container because with the bare config file it doesn't do much, it's basically just an empty wallet.

Start as masternode
------------

In general, you should follow a tutorial on how to prepare your masternode (create private key, send PIVX and so on). I suggest [this tutorial](https://pivxmasternode.org/2017/03/08/step-step-guide-setting-masternode/).

To start the masternode functionality, edit your pivx.conf (should be in /some/directory/.pivx/ following the docker run command example above):

```
rpcuser=<SOME LONG RANDOM USER NAME>
rpcpassword=<SOME LONG RANDOM PASSWORD>
rpcallowip=127.0.0.1
listen=1
server=1
daemon=1
logtimestamps=1
maxconnections=256
printtoconsole=1
masternode=1
externalip=<SERVER IP ADDRESS>
bind=<SERVER IP ADDRESS>
masternodeaddr=<SERVER IP ADDRESS>:51472
masternodeprivkey=<MASTERNODE PRIVATE KEY>
```

Where `<SERVER IP ADDRESS>` is the public facing IPv4 or IPv6 address that the masternode will be reachable at.

`<MASTERNODE PRIVATE KEY>` is the private key that you generated earlier (with `pivx-cli masternode genkey`).