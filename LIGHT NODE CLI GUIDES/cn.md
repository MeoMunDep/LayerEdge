# Layer Edge 轻节点指南

Layer Edge 网络的轻节点可用于通过零知识证明（ZK Proof）验证 Merkle 树。该客户端会连接网络、获取树数据、通过本地 ZK 证明器验证数据，并提交有效证明以赚取奖励积分。

—

## 🔧 环境要求

在开始之前，请先安装以下内容：

* Go 语言 v1.18 或更高版本 → [https://go.dev/doc/install](https://go.dev/doc/install)
* Rust v1.81 或更高版本 → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* RISC Zero 工具链（用于 ZK 证明）：

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

—

## ⚙️ 设置说明

### 1. 设置环境变量

创建 .env 文件，或手动导出以下变量：

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 请确保 ZK\_PROVER\_URL 与运行 Merkle 证明服务的服务器地址一致。

—

### 2. 编译与运行

#### 步骤 A：启动 ZK 证明服务

```bash
cd risc0-merkle-service
cargo build
cargo run
```

保持该服务运行状态。

#### 步骤 B：运行 Light Node

打开另一个终端窗口：

```bash
go build
./light-node
```

—

## 📋 功能亮点

* 自动发现并验证 Merkle 树
* 本地生成 ZK 证明
* 验证并提交有效证明以赚取积分
* 自动跳过未变更的树（智能休眠）
* 日志输出清晰，便于监控

—

## 🛠 故障排查

遇到问题时，请检查：

1. gRPC 地址是否正确、可访问
2. ZK 证明服务是否已启动并运行
3. 私钥是否有效，格式是否正确
4. 日志输出 – 可以设置 DEBUG=1 查看详细错误信息

更多帮助？请访问 FAQ 和排错指南：
[https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

