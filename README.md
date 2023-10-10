# Charity Donation Smart Contract

This is a simple Solidity smart contract designed for charitable donations on the Ethereum blockchain. It allows donors to contribute funds to a charitable campaign, tracks donations, and provides the option for donors to request refunds if the campaign does not meet its goal.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Contract Overview](#contract-overview)
- [Usage](#usage)
- [License](#license)

## Prerequisites

Before using this smart contract, make sure you have the following:

- An Ethereum development environment like Remix or Truffle.
- A compatible Ethereum wallet (e.g., MetaMask) for interacting with the contract.
- Some Ethereum cryptocurrency (ETH) for gas fees.

## Getting Started

1. Clone this repository to your local machine or deploy the contract using an Ethereum development environment.

2. Compile and deploy the contract using your chosen development environment.

3. Interact with the contract using your Ethereum wallet to make donations, request refunds, or withdraw funds if the campaign goal is met.

## Contract Overview

The `CharityDonation.sol` contract includes the following features:

- Donors can make donations to a charitable campaign.
- Donations are tracked and displayed publicly on the blockchain.
- Donors can request refunds if the campaign goal is not met by the campaign's end.
- The charity can withdraw the donated funds if the campaign goal is met.

## Usage

1. Initialize the contract by providing the charity's address and the donation goal during deployment.

2. Donors can make donations to the campaign using the `donate()` function, specifying the amount of ETH to donate.

3. When the donation goal is met, or the campaign deadline is reached (whichever comes first), the campaign is marked as ended, and the charity can withdraw the funds using the `withdrawFunds()` function.

4. If the campaign does not meet its goal by the deadline, donors can request refunds using the `getRefund()` function.

## License

This smart contract is open-source and available under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as needed. However, please use caution and ensure proper testing and auditing before deploying it to a production environment.

