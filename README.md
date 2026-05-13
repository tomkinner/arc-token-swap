# Arc Network Token Swap Smart Contracts

This repository contains Solidity smart contracts for token swapping on the **Arc Network Testnet**.

## 🚀 Contracts Included

### 1. ARCtest.sol (Basic Calculator)
A simple contract to calculate swap amounts based on a fixed rate.
- **Goal:** Logic testing and basic deployment.
- **Deployed Address:** `0xC8F83732efeeD1dAaa2E3508859A70818dE169d1`

### 2. ArcSwapPro.sol (Advanced Swap)
A professional swap contract with actual ERC20 token transfer logic.
- **Features:** Liquidity checks, Ownership control, and Event logging.
- **Requirement:** Needs `approve()` call from the token contract before swapping.
- **Deployed Address:** `0x63A4FD6B2f5679AbaCB204A341645053e07c3ceB`

## 🛠 Tech Stack
- **Language:** Solidity (^0.8.0)
- **Tools:** Remix IDE, MetaMask
- **Network:** Arc Network Testnet

## 📄 License
This project is licensed under the MIT License.
