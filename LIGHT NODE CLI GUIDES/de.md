# Layer Edge Light Node Anleitung

Ein Light Node zur Verifizierung von Merkle-Bäumen im Layer Edge Netzwerk unter Verwendung von Zero-Knowledge-Proofs (ZK). Dieser Client verbindet sich mit dem Netzwerk, ruft Baumdaten ab, prüft sie mithilfe eines lokalen ZK-Provers und sendet gültige Nachweise, um Belohnungen zu erhalten.

—

## 🔧 Voraussetzungen

Installiere vor dem Start:

* Go Version 1.18 oder höher → [https://go.dev/doc/install](https://go.dev/doc/install)
* Rust Version 1.81 oder höher → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* RISC Zero Toolchain → Erforderlich für ZK-Nachweise:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

—

## ⚙️ Einrichtungsanleitung

### 1. Umgebungsvariablen festlegen

Erstelle eine .env-Datei oder exportiere diese Variablen manuell:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 Stelle sicher, dass ZK\_PROVER\_URL mit der Adresse des Servers übereinstimmt, auf dem der Merkle Prover Dienst läuft.

—

### 2. Kompilieren und Ausführen

#### Schritt A: Starte den ZK Prover Dienst

```bash
cd risc0-merkle-service
cargo build
cargo run
```

Lasse diesen Dienst dauerhaft laufen.

#### Schritt B: Starte den Light Node

Öffne ein neues Terminal:

```bash
go build
./light-node
```

—

## 📋 Funktionen

* Erkennt und prüft automatisch Merkle-Bäume
* Erstellt lokale ZK-Proofs
* Sendet gültige Nachweise zur Punktegewinnung
* Überspringt unveränderte Bäume (intelligentes Warten)
* Protokolliert Aktivitäten zur einfachen Überwachung

—

## 🛠 Fehlerbehebung

Wenn Probleme auftreten, überprüfe:

1. gRPC-URL – Stelle sicher, dass sie korrekt und erreichbar ist
2. ZK Prover Dienst – Muss vor dem Node laufen
3. Privater Schlüssel – Stelle sicher, dass er gültig und korrekt formatiert ist
4. Logs – Starte mit DEBUG=1 oder überprüfe die Konsolenausgabe

Weitere Hilfe findest du im FAQ- und Fehlerbehebungsleitfaden:
[https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

