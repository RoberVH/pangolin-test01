#  Hackacthon de OpenWeb Frutal Web House ETH Mexico
Este proyecto se presenta al Hackacthon de OpenWeb Frutal Web House ETH Mexico en linea y presencial en Merida [link](https://lu.ma/3xn4r8o2)

## Equipo Gubbi App



## Test contratos Pangolin en Avalanche

Testnet Fuji
Direcciones de Pangolin en Fuji Testnet

-    **Factory**: 0x2a496ec9e9bE22e66C61d4Eb9d316beaEE31A77b
-    **Router**: 0x2D99ABD9008Dc933ff5c0CD271B88309593aB921
-    **PNG Token**: 0x83080D4b5fC60e22dFFA8d14AD3BB41Dde48F199

**Instalación de contratos Pangolin:**

- forge install OpenZeppelin/openzeppelin-contracts

- forge install pangolindex/exchange-contracts/tree/main/contracts/pangolin-core

- forge install pangolindex/exchange-contracts/tree/main/contracts/pangolin-periphery  

#### Deployed to Avalanche Fuji Testnet
Command: ``forge script script/DeployGubbiContract.s.sol --rpc-url $RPC_TEST --private-key $PVTE_KEY --broadcast``
<br>
Data: 
- [Success]Hash: 0x7e961fd4a9739af18353b98d76058fab884057c757a668e17423566b00c2c837
- Contract Address: **0x3AF1B118857551a33be9604C93C2f5316f15b2Cb**
- Block: 35835224
- Paid: 0.0182817 ETH (609390 gas * 30 gwei)

<br>

<br>  
<span style="color:red">A continuacion boilerplate del proyecto creado con forge init:</span>

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
