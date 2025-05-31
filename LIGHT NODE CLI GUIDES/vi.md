# Hướng Dẫn Chạy Light Node Layer Edge

**Light Node** dùng để xác minh Merkle tree trên **Layer Edge Network** bằng **Zero-Knowledge (ZK) proofs**. Client này kết nối với mạng, lấy dữ liệu cây, xác minh bằng ZK prover cục bộ, và gửi các bằng chứng hợp lệ để nhận thưởng.

---

## 🔧 Yêu Cầu

Trước khi bắt đầu, hãy cài đặt:

* **Go** v1.18+ → [https://go.dev/doc/install](https://go.dev/doc/install)
* **Rust** v1.81+ → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* **RISC Zero Toolchain** → Cần thiết cho ZK proving:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

---

## ⚙️ Hướng Dẫn Cài Đặt

### 1. Thiết Lập Biến Môi Trường

Tạo file `.env` hoặc export thủ công:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 Đảm bảo `ZK_PROVER_URL` đúng với địa chỉ server đang chạy dịch vụ Merkle prover.

---

### 2. Biên Dịch và Chạy

#### Bước A: Khởi Chạy ZK Prover Service

```bash
cd risc0-merkle-service
cargo build
cargo run
```

Giữ tiến trình này đang chạy.

#### Bước B: Chạy Light Node

Mở terminal mới:

```bash
go build
./light-node
```

---

## 📋 Tính Năng

* Tự động tìm và xác minh Merkle tree
* Tạo ZK proof cục bộ
* Xác minh và gửi proof hợp lệ để nhận điểm thưởng
* Bỏ qua cây không thay đổi (ngủ thông minh)
* Ghi log rõ ràng để dễ theo dõi

---

## 🛠 Khắc Phục Sự Cố

Nếu có lỗi, hãy kiểm tra:

1. **gRPC URL** – Đảm bảo chính xác và có thể truy cập
2. **ZK Prover Service** – Phải chạy trước khi khởi động node
3. **Private Key** – Đảm bảo hợp lệ và đúng định dạng
4. **Log** – Chạy với `DEBUG=1` hoặc kiểm tra output console để tìm lỗi

Cần thêm trợ giúp? Xem [Câu hỏi thường gặp & Hướng dẫn khắc phục sự cố](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

