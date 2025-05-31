# Guide du Light Node Layer Edge

Un Light Node permet de vérifier des arbres de Merkle sur le réseau Layer Edge à l’aide de preuves Zero-Knowledge (ZK). Ce client se connecte au réseau, récupère les données des arbres, les vérifie via un prouveur ZK local, puis soumet les preuves valides pour obtenir des récompenses.

—

## 🔧 Prérequis

Avant de commencer, installez :

* Go v1.18 ou supérieur → [https://go.dev/doc/install](https://go.dev/doc/install)
* Rust v1.81 ou supérieur → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* RISC Zero Toolchain → Requis pour les preuves ZK :

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

—

## ⚙️ Instructions de configuration

### 1. Définir les variables d’environnement

Créez un fichier .env ou exportez-les manuellement :

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 Assurez-vous que ZK\_PROVER\_URL correspond à l’URL du serveur exécutant le service Merkle prover.

—

### 2. Compiler et exécuter

#### Étape A : Lancer le service ZK Prover

```bash
cd risc0-merkle-service
cargo build
cargo run
```

Laissez ce processus actif.

#### Étape B : Exécuter le Light Node

Dans un nouveau terminal :

```bash
go build
./light-node
```

—

## 📋 Fonctionnalités

* Recherche et vérifie automatiquement les arbres de Merkle
* Génère localement des preuves ZK
* Soumet les preuves valides pour obtenir des points
* Ignore les arbres inchangés (sommeil intelligent)
* Journalisation claire pour le suivi des activités

—

## 🛠 Dépannage

En cas de problème, vérifiez :

1. URL gRPC – Vérifiez qu’elle est correcte et accessible
2. Service ZK Prover – Doit être lancé avant le node
3. Clé privée – Vérifiez sa validité et son format
4. Journaux – Lancez avec DEBUG=1 ou consultez la sortie du terminal

Besoin d’aide supplémentaire ? Consultez le guide FAQ & Dépannage :
[https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

