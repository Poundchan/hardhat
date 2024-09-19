# DisasterDApp

DisasterDApp is a decentralized application (DApp) that allows users to register and retrieve information about people in the event of a disaster. This project is built using Solidity for the smart contract, Hardhat for development and testing, and JavaScript for the tests.

## Getting Started

### Prerequisites

- Node.js
- npm (Node Package Manager)
- Hardhat

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/disasterdapp.git
    cd disasterdapp
    ```

2. Install the dependencies:
    ```sh
    npm install
    ```

### Usage

1. Compile the smart contracts:
    ```sh
    npx hardhat compile
    ```

2. Run the tests:
    ```sh
    npx hardhat test
    ```

### Project Structure

- `contracts/RegisterDisaster.sol`: The Solidity smart contract for registering and retrieving people.
- `test/Register.js`: JavaScript tests for the smart contract.
- `hardhat.config.js`: Hardhat configuration file.
- `package.json`: Project dependencies and scripts.

### Smart Contract

The smart contract `RegisterDisaster.sol` contains the following functions:

- `registerPerson`: Registers a person with their ID card, first name, last name, and address.
- `getAll`: Retrieves all registered people.
- `getPerson`: Retrieves a person by their index.
- `getID`: Retrieves a person by their ID card.

#### Fill in the Blanks

Students are required to fill in the blank functions in the smart contract `RegisterDisaster.sol`:
