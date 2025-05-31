# Guía del Nodo Ligero de Layer Edge

Un Nodo Ligero para verificar árboles de Merkle en la red Layer Edge utilizando pruebas de conocimiento cero (Zero-Knowledge o ZK). Este cliente se conecta a la red, obtiene datos de los árboles, los verifica localmente con un generador de pruebas ZK y envía pruebas válidas para ganar recompensas.

—

## 🔧 Requisitos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

* Go v1.18 o superior → [https://go.dev/doc/install](https://go.dev/doc/install)
* Rust v1.81 o superior → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* Herramientas de RISC Zero → Requerido para generar pruebas ZK:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

—

## ⚙️ Instrucciones de Configuración

### 1. Configura las Variables de Entorno

Crea un archivo .env o exporta las variables manualmente:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=tu-clave-privada-del-nodo
```

> 📌 Asegúrate de que ZK\_PROVER\_URL coincida con la dirección del servidor que ejecuta el servicio del generador de pruebas Merkle.

—

### 2. Compilar y Ejecutar

#### Paso A: Iniciar el Servicio del Generador ZK

```bash
cd risc0-merkle-service
cargo build
cargo run
```

Mantén este proceso en ejecución.

#### Paso B: Ejecutar el Nodo Ligero

Abre otra terminal:

```bash
go build
./light-node
```

—

## 📋 Funcionalidades

* Detecta y verifica automáticamente árboles de Merkle
* Genera pruebas ZK localmente
* Verifica y envía pruebas válidas para obtener puntos
* Omite árboles sin cambios (modo inteligente de espera)
* Registra la actividad de forma clara para su monitoreo

—

## 🛠 Solución de Problemas

Si algo falla, revisa lo siguiente:

1. URL de gRPC – Asegúrate de que sea correcta y esté disponible
2. Servicio del Generador ZK – Debe estar en ejecución antes del nodo
3. Clave privada – Asegúrate de que sea válida y esté en el formato correcto
4. Logs – Ejecuta con DEBUG=1 o revisa la salida en consola para ver errores

¿Necesitas más ayuda? Consulta la guía de preguntas frecuentes y solución de problemas:
[https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide)

