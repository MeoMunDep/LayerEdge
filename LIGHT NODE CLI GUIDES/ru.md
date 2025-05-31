# Руководство по запуску Light Node Layer Edge

**Light Node** предназначен для проверки деревьев Меркла в **Layer Edge Network** с использованием **доказательств с нулевым разглашением (Zero-Knowledge, ZK)**. Этот клиент подключается к сети, получает данные дерева, проверяет их локально с помощью ZK prover и отправляет действительные доказательства для получения наград.

---

## 🔧 Требования

Перед началом установите:

* **Go** v1.18+ → [https://go.dev/doc/install](https://go.dev/doc/install)
* **Rust** v1.81+ → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* **RISC Zero Toolchain** → Необходим для создания ZK-доказательств:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

---

## ⚙️ Инструкция по настройке

### 1. Установите переменные окружения

Создайте файл `.env` или экспортируйте переменные вручную:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 Убедитесь, что `ZK_PROVER_URL` соответствует адресу сервера, на котором запущен сервис Merkle prover.

---

### 2. Сборка и запуск

#### Шаг A: Запустите ZK Prover Service

```bash
cd risc0-merkle-service
cargo build
cargo run
```

Оставьте этот процесс активным.

#### Шаг B: Запустите Light Node

Откройте новый терминал:

```bash
go build
./light-node
```

---

## 📋 Возможности

* Автоматически находит и проверяет деревья Меркла
* Локально генерирует ZK-доказательства
* Проверяет и отправляет действительные доказательства для получения очков
* Пропускает неизменённые деревья (умный режим ожидания)
* Подробное логирование для мониторинга

---

## 🛠 Устранение неисправностей

Если что-то не работает, проверьте:

1. **gRPC URL** – Должен быть правильным и доступным
2. **ZK Prover Service** – Должен быть запущен до Light Node
3. **Private Key** – Убедитесь в корректности и правильном формате
4. **Логи** – Запустите с `DEBUG=1` или проверьте вывод в консоли

Нужна помощь? Ознакомьтесь с [FAQ и руководством по устранению неполадок](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

