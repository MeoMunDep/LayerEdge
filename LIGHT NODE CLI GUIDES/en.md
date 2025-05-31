# Layer Edge Light Node Guide

A **Light Node** for verifying Merkle trees on the **Layer Edge Network** using **Zero-Knowledge (ZK) proofs**. This client connects to the network, fetches tree data, verifies it using a local ZK prover, and submits valid proofs to earn rewards.

---

## 🔧 Requirements

Before you begin, install:

* **Go** v1.18+ → [https://go.dev/doc/install](https://go.dev/doc/install)
* **Rust** v1.81+ → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* **RISC Zero Toolchain** → Required for ZK proving:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

---

## ⚙️ Setup Instructions

### 1. Set Environment Variables

Create a `.env` file or export these manually:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 Make sure the `ZK_PROVER_URL` matches the URL of the server running the Merkle prover service.

---

### 2. Build and Run

#### Step A: Start the ZK Prover Service

```bash
cd risc0-merkle-service
cargo build
cargo run
```

Keep this running.

#### Step B: Run the Light Node

Open a new terminal:

```bash
go build
./light-node
```

---

## 📋 Features

* Automatically finds and verifies Merkle trees
* Generates ZK proofs locally
* Verifies and submits valid proofs to earn points
* Skips trees that haven't changed (smart sleeping)
* Logs activity clearly for monitoring

---

## 🛠 Troubleshooting

If something breaks, check:

1. **gRPC URL** – Make sure it’s correct and accessible
2. **ZK Prover Service** – Must be running before the node
3. **Private Key** – Ensure it's valid and in the correct format
4. **Logs** – Run with `DEBUG=1` or check console output for errors

More help? Check the [FAQ & Troubleshooting Guide](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

