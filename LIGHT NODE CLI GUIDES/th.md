# คู่มือ Light Node ของ Layer Edge

Light Node สำหรับตรวจสอบต้นไม้ Merkle บนเครือข่าย Layer Edge โดยใช้ Zero-Knowledge (ZK) proof ไคลเอนต์นี้จะเชื่อมต่อกับเครือข่าย ดึงข้อมูลของต้นไม้ ตรวจสอบโดยใช้ ZK prover ภายในเครื่อง และส่ง proof ที่ถูกต้องเพื่อรับรางวัล

—

## 🔧 ข้อกำหนดเบื้องต้น

ก่อนเริ่มต้น กรุณาติดตั้ง:

* Go เวอร์ชัน 1.18 ขึ้นไป → [https://go.dev/doc/install](https://go.dev/doc/install)
* Rust เวอร์ชัน 1.81 ขึ้นไป → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* RISC Zero Toolchain → จำเป็นสำหรับสร้าง ZK proof:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

—

## ⚙️ ขั้นตอนการติดตั้ง

### 1. ตั้งค่าตัวแปรสภาพแวดล้อม

สร้างไฟล์ .env หรือ export ค่าด้วยตนเอง:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=private-key-ของ-node-คุณ
```

> 📌 ตรวจสอบว่า ZK\_PROVER\_URL ตรงกับ URL ของเซิร์ฟเวอร์ที่รันบริการ Merkle prover

—

### 2. สร้างและรัน

#### ขั้นตอนที่ A: เริ่มต้นบริการ ZK Prover

```bash
cd risc0-merkle-service
cargo build
cargo run
```

ให้หน้าต่างนี้ทำงานค้างไว้

#### ขั้นตอนที่ B: รัน Light Node

เปิดหน้าต่างเทอร์มินัลใหม่:

```bash
go build
./light-node
```

—

## 📋 ฟีเจอร์หลัก

* ตรวจหาและตรวจสอบต้นไม้ Merkle โดยอัตโนมัติ
* สร้าง ZK proof ภายในเครื่อง
* ตรวจสอบและส่ง proof ที่ถูกต้องเพื่อรับคะแนน
* ข้ามต้นไม้ที่ไม่มีการเปลี่ยนแปลง (พักอัจฉริยะ)
* แสดง log กิจกรรมอย่างชัดเจน

—

## 🛠 การแก้ไขปัญหา

หากเกิดปัญหา ตรวจสอบสิ่งต่อไปนี้:

1. URL ของ gRPC – ตรวจสอบว่าใช้งานได้และพิมพ์ถูกต้อง
2. บริการ ZK Prover – ต้องรันอยู่ก่อนเริ่ม node
3. Private Key – ต้องถูกต้องและอยู่ในรูปแบบที่รองรับ
4. Log – เรียกใช้ด้วย DEBUG=1 หรือดูข้อความใน console

ต้องการความช่วยเหลือเพิ่มเติม? ดูคู่มือ FAQ และการแก้ไขปัญหาได้ที่:
[https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

