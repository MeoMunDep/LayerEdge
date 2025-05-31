# Layer Edge ライトノードガイド

**Light Node** は **Layer Edge Network** 上の Merkle ツリーを **ゼロ知識証明（Zero-Knowledge, ZK）** を使って検証するためのノードです。このクライアントはネットワークに接続し、ツリーデータを取得してローカルの ZK プルーバーで検証し、有効な証明を提出して報酬を得ます。

---

## 🔧 必要なもの

始める前に、以下をインストールしてください：

* **Go** v1.18以上 → [https://go.dev/doc/install](https://go.dev/doc/install)
* **Rust** v1.81以上 → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* **RISC Zero Toolchain** → ZK証明に必要です：

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

---

## ⚙️ セットアップ手順

### 1. 環境変数を設定する

`.env` ファイルを作成するか、以下を手動でエクスポートしてください：

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 `ZK_PROVER_URL` は Merkle プルーバーサービスが実行されているサーバーのアドレスと一致している必要があります。

---

### 2. ビルドと実行

#### ステップ A：ZK プルーバーサービスを起動

```bash
cd risc0-merkle-service
cargo build
cargo run
```

このプロセスはバックグラウンドで実行されたままにしてください。

#### ステップ B：ライトノードを実行

新しいターミナルを開いて以下を実行：

```bash
go build
./light-node
```

---

## 📋 機能

* Merkle ツリーを自動で発見・検証
* ローカルで ZK 証明を生成
* 有効な証明を提出してポイントを獲得
* 変更のないツリーはスキップ（スマートスリープ）
* ログ出力が明確でモニタリングしやすい

---

## 🛠 トラブルシューティング

問題が発生した場合は以下を確認してください：

1. **gRPC URL** – 正しく、アクセス可能であること
2. **ZK プルーバーサービス** – ノード起動前に実行されていること
3. **秘密鍵** – 正しい形式であることを確認
4. **ログ** – `DEBUG=1` で実行、またはコンソール出力を確認

さらにサポートが必要ですか？[FAQ・トラブルシューティングガイド](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide) をご覧ください。
