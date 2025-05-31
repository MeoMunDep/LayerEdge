# Guia do Light Node da Layer Edge

Um Light Node para verificar árvores de Merkle na rede Layer Edge usando provas de Zero-Knowledge (ZK). Este cliente conecta-se à rede, busca dados de árvores, verifica localmente usando um provador ZK e envia provas válidas para ganhar recompensas.

—

## 🔧 Requisitos

Antes de começar, instale:

* Go v1.18 ou superior → [https://go.dev/doc/install](https://go.dev/doc/install)
* Rust v1.81 ou superior → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* RISC Zero Toolchain → Necessário para geração de provas ZK:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

—

## ⚙️ Instruções de Configuração

### 1. Defina Variáveis de Ambiente

Crie um arquivo .env ou exporte manualmente:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=seu-chave-privada-do-node
```

> 📌 Verifique se o ZK\_PROVER\_URL corresponde ao endereço do servidor onde o serviço de provador Merkle está em execução.

—

### 2. Compilar e Executar

#### Passo A: Inicie o Serviço do Provador ZK

```bash
cd risc0-merkle-service
cargo build
cargo run
```

Deixe esse terminal aberto e em execução.

#### Passo B: Execute o Light Node

Abra um novo terminal:

```bash
go build
./light-node
```

—

## 📋 Funcionalidades

* Localiza e verifica automaticamente árvores Merkle
* Gera provas ZK localmente
* Verifica e envia provas válidas para acumular pontos
* Ignora árvores que não sofreram alterações (modo inteligente de espera)
* Registra as atividades no terminal de forma clara

—

## 🛠 Solução de Problemas

Se algo der errado, verifique:

1. URL do gRPC – Certifique-se de que está correta e acessível
2. Serviço do Provador ZK – Deve estar rodando antes do node
3. Chave Privada – Verifique se está válida e no formato correto
4. Logs – Rode com DEBUG=1 ou verifique a saída do console

Precisa de mais ajuda? Veja o Guia de FAQ e Solução de Problemas:
[https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

