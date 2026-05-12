README.md Token Swap Smart Contract (Arc Network)
This is a simple Token Swap smart contract written in Solidity. It allows users to calculate converted amounts based on a predefined exchange rate. This project was developed and deployed using Remix IDE.

🚀 Features
Exchange Rate: A public variable to store the conversion rate.

Conversion Logic: A function getConvertedAmount to calculate the swap value.

Arc Network Compatibility: Designed to be deployed on the Arc Network Testnet.

🛠 Tech Stack
Language: Solidity (^0.8.0)

Tools: Remix IDE, MetaMask

Network: Arc Network Testnet

📜 Smart Contract Code
Solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenSwap {
    uint256 public exchangeRate = 100;

    function getConvertedAmount(uint256 _amount) public view returns (uint256) {
        return _amount * exchangeRate;
    }
}
📖 How to Deploy
Open Remix IDE.

Create a new file named ARCtest.sol.

Paste the contract code.

Go to the Solidity Compiler tab and click Compile.

Go to the Deploy & Run Transactions tab.

Select Injected Provider - MetaMask (ensure you are on Arc Network).

Click Deploy.

📄 License
This project is licensed under the MIT License. 
