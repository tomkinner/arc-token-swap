# 🔄 Arc Network Token Swap Ecosystem

Welcome to the **Arc Network Token Swap** project. This repository showcases the evolution of a decentralized exchange (DEX) logic, starting from a basic calculator to a professional swap contract with real asset transfer capabilities.

---

## 🛠 Project Structure

### 1. 🐣 ARCtest.sol (Basic Calculator)
This is the **Level 1** contract. It was built to test the mathematical logic of the swap without moving real tokens.
- **Key Feature:** Pure calculation logic.
- **Function:** `getConvertedAmount(uint256 _amount)`
- **Exchange Rate:** 1:100 (Fixed).
- **Status:** Foundational testing complete.

### 2. 💎 ArcSwapPro.sol (Professional Swap)
This is the **Level 2** advanced contract. It handles real ERC20 token transfers and includes production-grade security checks.
- **Key Features:**
    - **Real Transfers:** Moves `tokenIn` from user to contract and `tokenOut` from contract to user.
    - **Liquidity Guard:** Prevents swaps if the contract doesn't have enough tokens.
    - **Ownership:** Only the owner can change the exchange rate.
    - **Event Logs:** Uses `TokensSwapped` to track every transaction on the blockchain.
- **Status:** Ready for Testnet interaction.

---

## 📖 How to Perform a Swap with ArcSwapPro

Follow these steps to test the swap successfully:

### Step 1: Token Approval 🔓
Before calling the swap, you must grant permission. 
1. Go to your **Token A (Input Token)** contract.
2. Call the `approve` function.
3. **Spender:** `0x63A4FD6B2f5679AbaCB204A341645053e07c3ceB` (ArcSwapPro Address).
4. **Amount:** The amount you wish to swap (e.g., 1000000000000000000 for 1 token).

### Step 2: Ensure Liquidity 💰
The `ArcSwapPro` contract must hold enough of **Token B (Output Token)** to pay the user. Send some Token B to the contract address before testing.

### Step 3: Execute Swap 🚀
1. Go to the `ArcSwapPro` contract.
2. Call `swapTokens(tokenIn_address, tokenOut_address, amount)`.
3. Confirm the transaction in MetaMask.

---

## ⚙️ Tech Stack & Network
- **Blockchain:** Arc Network Testnet
- **Language:** Solidity ^0.8.0
- **Tools:** Remix IDE, MetaMask, OpenZeppelin Standards
- **License:** MIT

---

**Developed by [Tomkinner](https://github.com/tomkinner)** 🚀
