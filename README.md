# 📘 LAB 1: Foundations of Blockchain – Simulating a Chain & Deploying an Immutable Poll

**Duration:** 1 hour  
**Difficulty:** Beginner  
**Alignment:** Course Objectives 1 & 6 (Understand blockchain principles; Build a basic prototype/dApp)  
**Prerequisites:** Basic Python knowledge, ability to install browser extensions, internet connection

---

## 📁 Files Provided

### File 1: `simple_blockchain.py`

### File 2: `SimplePol.sol`

## 🧭 Step-by-Step Lab Guidelines

### 🔧 PART A: Simulate Blockchain Fundamentals (Python)
1. **Install Python** (if not installed): https://python.org/downloads
2. **Run the simulation**:
   ```bash
   python simple_blockchain.py
   ```
3. **Observe Output**:
   - Note how each block's `hash` depends on `previous_hash`
   - Notice the `is_valid()` function returns `False` after tampering
4. **Experiment**:
   - Change `bc.add_block("Vote: YES")` to your name + a short message
   - Re-run and observe how the hash chain updates automatically
5. **Concept Check**:
   - Why does changing one block break the chain?
   - How does this relate to immutability in real blockchains?

### 🌐 PART B: Deploy & Interact on a Live Testnet (Remix + MetaMask)
1. **Install MetaMask**: https://metamask.io/download/
   - Create a wallet (save recovery phrase securely)
   - Switch network to **Sepolia Testnet**
2. **Get Test ETH**:
   - Visit: https://sepoliafaucet.com/ or https://faucets.chain.link/sepolia
   - Paste your MetaMask address and request free test ETH
3. **Open Remix IDE**: https://remix.ethereum.org/
   - Create a new file: `SimplePoll.sol`
   - Paste the Solidity code provided above
   - Click **Solidity Compiler** → Select `0.8.20` (or compatible) → Click **Compile**
4. **Deploy**:
   - Go to **Deploy & Run Transactions**
   - Environment: Select `Injected Provider - MetaMask`
   - Confirm connection in MetaMask
   - Click **Deploy** → Approve transaction in MetaMask
5. **Interact**:
   - In the deployed contract panel, expand `createPoll`
   - Input: `_question: "Should we adopt blockchain in our campus?"`
   - `_options: ["Yes", "No"]` → Click `transact`
   - Wait for confirmation (~15 secs)
   - Expand `vote` → Input `_pollId: 0`, `_optionIndex: 0` → Click `transact`
   - Repeat vote with index `1`
   - Expand `getPoll` → Input `0` → Click call to view results
6. **Verify on Etherscan**:
   - Copy contract address from Remix
   - Paste into: https://sepolia.etherscan.io/
   - View transaction hashes, events, and gas usage

---

## 🛠️ Troubleshooting Guide
| Issue | Solution |
|-------|----------|
| `pip install` errors | Use Python 3.10+. No external packages required for this lab. |
| MetaMask not connecting to Remix | Ensure MetaMask is unlocked & set to Sepolia. Refresh Remix after switching networks. |
| "Out of gas" on deployment | Request more test ETH from faucet. Set gas limit to `300000` in Remix advanced settings. |
| `getPoll` returns empty | Wait for transaction confirmation (15–30s). Check Etherscan for pending status. |
| Solidity compiler mismatch | In Remix Compiler tab, select `0.8.0` or higher. Code uses `pragma solidity ^0.8.0;` |

---

## 🔗 Week 1 Tool Integration Map
| Lab Component | Course Tool Used | Concept Demonstrated |
|---------------|------------------|----------------------|
| `simple_blockchain.py` | Python `hashlib` | Hash functions, block linking, immutability |
| `SimplePoll.sol` + Remix | Remix IDE, Solidity | Smart contract structure, on-chain execution |
| MetaMask + Sepolia | MetaMask, Testnet | Wallets, gas, transaction signing, public ledger |
| Etherscan Verification | Blockchain Explorer | Transparency, auditability, real-time verification |

> 💡 **Note**: This lab intentionally avoids complex frontend frameworks or advanced Solidity patterns. It focuses on *experiential learning*: students first simulate blockchain mechanics locally, then interact with a live decentralized network. This bridges Week 1 theory with the hands-on development covered in Weeks 5–7.
