#!/bin/bash

# Check if the first argument is provided (network)
if [ -z "$1" ]; then
  echo "Usage: $0 {sepolia|local}"
  exit 1
fi

NETWORK=$1

if [ "$NETWORK" == "sepolia" ]; then
  export NETWORK=sepolia
  export PRIVATE_KEY=0x26437645cd7a270702b816a7603b45bd0c102cd1b56014646df9b40b6c99c476
  RPC_URL=https://sepolia.infura.io/v3/83b590abc9694a188a262d2152756ca9
elif [ "$NETWORK" == "local" ]; then
  export NETWORK=local
  export PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
  RPC_URL=http://localhost:8545
else
  echo "Unknown network: $NETWORK"
  exit 1
fi

forge script script/Deploy.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast