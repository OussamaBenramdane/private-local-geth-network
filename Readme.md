# Local Ethereum Network

A set of Docker images to create a local Ethereum network with three nodes and a monitor. This was built to understand how local Ethereum networks have to be set up and to provide a local test environment. **Never use this in a productive environment, as the docker-compose.yml contains hardcoded passwords and private keys for convenience**

The testnet consists out of multiple parts :

- Bootnode - registers existing nodes on the network, discovery service.
- Miner - Also called **sealers** with proof-of-authority. They validate the blocks. No RPC is exposed as they are required to be unlocked.
- Rpc-endpoint - This serves as **transaction relay** and is a fullnode that does not mine, is locked but has RPC exposed

## Usage

Setting up this networks requires you to install Docker. Clone the repository, and run `docker-compose up` from the repository root. The network should start and synchronize without any further configuration. The networks always uses the latest available versions of Ethereum.

## Setup Steps

Access the folder

```
cd dockerApp
```

Next you need to have docker installed and runnig in the background the run the command

Build the image and name in geth-client

```
docker build -t geth-client .
```

then run docker compose to set up the structure

```
docker-compose up -d
```

Hint : -d for the detached mode to make the container run in the background

## The bootnode

The nodes in the network are connecting with the bootnode. This is a special ethereum node, designed to provide a register of the existing nodes in the network. The parameter `nodekeyhex`in the `docker-compose.yml` is needed to derive the `enodeID` which is later passed to the other nodes. The IP needs to be fixed, as the other nodes need to know where to find the bootnode, and DNS is not supported. The bootnode does not participate in synchronization of state or mining.

## Miner / Geth Nodes

There are three nodes that participate in the network. The state is synchronized between them and they are trying to create blocks with mining. Initially they connect to the bootnode with the information derived from the fixed IP and the nodekeyhex. If you want to interact with the network, you need to connect via RPC.

## How to connect to the exposed RPC port via metaMask

First Step : add the metaMask chrom extention and create an account

Second Step : create a local test srver via metaMask then you will be conected to the get local network that we created via metamask using the exposed RPC URI : [http://localhost:8545](http://localhost:8545)

Next step Idunno ...
