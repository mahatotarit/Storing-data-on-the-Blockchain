# Storing Data on the Blockchain

## Description

This project demonstrates storing user information on the blockchain using a Solidity smart contract and interacting with it through a JavaScript application.

## Technologies Used

- Solidity
- Ethereum
- JavaScript
- Node.js
- ethers.js
- JSON-RPC
- Alchemy (or any other Ethereum provider)

## Installation

1. Clone the repository:
```
git clone <repository-url>
```

2. Navigate to the project directory:
 ```
 cd <project-directory>
 ```
3. Install dependencies:
```
npm install
```



## Configuration

Ensure you have a valid Ethereum private key and Alchemy API key. Update the `.env` file with these keys.

## Usage

To interact with the smart contract, use the provided JavaScript functions. For example, to register a user:

```javascript
registerUser('0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99', 1, 1);
```

### Code Structure
 * `Contract.sol`: Contains the Solidity smart contract code.
 * `index.js`: Contains JavaScript code to interact with the smart contract.
 * `ContractABI.json`: Contains the ABI of the smart contract.

#### License
* SPDX-License-Identifier: MIT

#### Contributing
* Contributions are welcome! Please open an issue or submit a pull request.
