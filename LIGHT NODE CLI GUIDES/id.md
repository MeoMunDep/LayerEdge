# Panduan Light Node Layer Edge

Light Node digunakan untuk memverifikasi pohon Merkle di jaringan Layer Edge dengan menggunakan Zero-Knowledge Proof (ZK Proof). Klien ini akan terhubung ke jaringan, mengambil data pohon, memverifikasinya menggunakan prover ZK lokal, dan mengirimkan bukti yang valid untuk mendapatkan imbalan.

—

## 🔧 Persyaratan

Sebelum memulai, pastikan Anda telah menginstal:

* Go v1.18 ke atas → [https://go.dev/doc/install](https://go.dev/doc/install)
* Rust v1.81 ke atas → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* RISC Zero Toolchain → Dibutuhkan untuk pembuktian ZK:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

—

## ⚙️ Langkah-Langkah Setup

### 1. Atur Variabel Lingkungan

Buat file .env atau ekspor variabel ini secara manual:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 Pastikan bahwa ZK\_PROVER\_URL sesuai dengan alamat server tempat layanan prover Merkle dijalankan.

—

### 2. Bangun dan Jalankan

#### Langkah A: Jalankan Layanan ZK Prover

```bash
cd risc0-merkle-service
cargo build
cargo run
```

Biarkan layanan ini berjalan.

#### Langkah B: Jalankan Light Node

Buka terminal baru:

```bash
go build
./light-node
```

—

## 📋 Fitur

* Menemukan dan memverifikasi pohon Merkle secara otomatis
* Menghasilkan bukti ZK secara lokal
* Memverifikasi dan mengirimkan bukti yang valid untuk memperoleh poin
* Melewati pohon yang tidak berubah (smart sleep)
* Logging aktivitas dengan jelas untuk monitoring

—

## 🛠 Pemecahan Masalah

Jika terjadi kesalahan, periksa:

1. gRPC URL – Pastikan benar dan dapat diakses
2. Layanan ZK Prover – Harus berjalan sebelum menjalankan node
3. Private Key – Pastikan valid dan formatnya benar
4. Log – Jalankan dengan DEBUG=1 atau periksa output terminal

Perlu bantuan lebih lanjut? Lihat panduan FAQ & Pemecahan Masalah:
[https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

