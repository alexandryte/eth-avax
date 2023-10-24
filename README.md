# Error Contracts

This is a simple Ethereum smart contract written in Solidity. It demonstrates the use of `require()`, `assert()`, and `revert()` statements.

## Functions

### `setValue(uint256 _newValue)`

Sets a new value, but only if the `_newValue` is greater than the current value. If the condition is not met, it will throw an exception with the specified error message.

### `assertExample(uint256 _input)`

Takes an input and doubles it, but only if the input is not zero. If the input is zero, it will trigger an internal error using `assert()`.

### `revertExample(uint256 a, uint256 b)`

Takes two parameters `a` and `b`. If `a` is equal to `b`, the function will revert the transaction with the specified error message. If the condition is not met, the function will return "Transaction successful".

## Usage

1. Install a Solidity compiler (e.g., Remix, Truffle) to compile and deploy the smart contract.

2. Deploy the contract on an Ethereum testnet or the main network.

3. Interact with the contract using a web3-enabled application or a tool like Remix.
