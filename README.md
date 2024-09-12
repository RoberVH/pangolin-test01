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
<br>  
<span style="color:red">_A continuacion boilerplate del proyecto creado con forge init:_</span>


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
