# Layer Edge 라이트 노드 가이드

**Light Node**는 **Layer Edge Network**에서 Merkle 트리를 **Zero-Knowledge (ZK) 증명**을 통해 검증하는 노드입니다. 이 클라이언트는 네트워크에 연결하여 트리 데이터를 가져오고, 로컬 ZK prover로 검증한 후, 유효한 증명을 제출하여 보상을 획득합니다.

---

## 🔧 사전 요구 사항

시작하기 전에 다음을 설치하세요:

* **Go** v1.18+ → [https://go.dev/doc/install](https://go.dev/doc/install)
* **Rust** v1.81+ → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* **RISC Zero Toolchain** → ZK 증명에 필요:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

---

## ⚙️ 설정 방법

### 1. 환경 변수 설정

`.env` 파일을 생성하거나 다음 값을 수동으로 export 하세요:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 `ZK_PROVER_URL`이 Merkle prover 서비스를 실행 중인 서버 주소와 일치하는지 확인하세요.

---

### 2. 빌드 및 실행

#### A단계: ZK Prover 서비스 시작

```bash
cd risc0-merkle-service
cargo build
cargo run
```

해당 프로세스는 계속 실행 상태로 유지해야 합니다.

#### B단계: 라이트 노드 실행

새 터미널을 열고 다음을 실행하세요:

```bash
go build
./light-node
```

---

## 📋 주요 기능

* Merkle 트리 자동 탐색 및 검증
* 로컬에서 ZK 증명 생성
* 유효한 증명 제출 시 포인트 획득
* 변경되지 않은 트리는 건너뜀 (스마트 슬리핑)
* 명확한 로그 출력으로 모니터링 용이

---

## 🛠 문제 해결

문제가 발생했다면 다음을 확인하세요:

1. **gRPC URL** – 올바르고 접근 가능한지 확인
2. **ZK Prover 서비스** – 노드를 실행하기 전에 실행되어야 함
3. **Private Key** – 올바른 형식인지 확인
4. **로그** – `DEBUG=1`로 실행하거나 콘솔 출력을 확인

추가 도움이 필요하신가요? [FAQ 및 문제 해결 가이드](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide) 를 확인하세요.
