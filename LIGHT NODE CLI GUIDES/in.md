# Layer Edge लाइट नोड गाइड

एक Light Node Layer Edge Network पर Merkle पेड़ों को Zero-Knowledge (ZK) प्रमाणों के माध्यम से सत्यापित करता है। यह क्लाइंट नेटवर्क से कनेक्ट होता है, डेटा प्राप्त करता है, स्थानीय ZK प्रोवर से उसकी पुष्टि करता है, और वैध प्रमाण सबमिट करके पुरस्कार अर्जित करता है।

---

## 🔧 आवश्यकताएँ

शुरू करने से पहले इन चीजों को इंस्टॉल करें:

* Go v1.18 या उससे अधिक → [https://go.dev/doc/install](https://go.dev/doc/install)
* Rust v1.81 या उससे अधिक → [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install)
* RISC Zero टूलचेन → ZK प्रमाण के लिए ज़रूरी:

  ```bash
  curl -L https://risczero.com/install | bash
  rzup install
  ```

---

## ⚙️ सेटअप निर्देश

### 1. पर्यावरण वेरिएबल्स सेट करें

`.env` फ़ाइल बनाएँ या इन वैरिएबल्स को मैन्युअली सेट करें:

```env
GRPC_URL=grpc.testnet.layeredge.io:9090
CONTRACT_ADDR=cosmos1ufs3tlq4umljk0qfe8k5ya0x6hpavn897u2cnf9k0en9jr7qarqqt56709
ZK_PROVER_URL=http://127.0.0.1:3001
API_REQUEST_TIMEOUT=100
POINTS_API=http://127.0.0.1:8080
PRIVATE_KEY=your-node-private-key
```

> 📌 सुनिश्चित करें कि ZK\_PROVER\_URL उस सर्वर के URL से मेल खाता हो जहाँ Merkle प्रोवर सेवा चल रही है।

---

### 2. बिल्ड और रन करें

#### चरण A: ZK प्रोवर सेवा चालू करें

```bash
cd risc0-merkle-service
cargo build
cargo run
```

इस प्रक्रिया को चलने दें।

#### चरण B: लाइट नोड को चलाएँ

नई टर्मिनल विंडो खोलें और चलाएँ:

```bash
go build
./light-node
```

---

## 📋 विशेषताएँ

* Merkle पेड़ों को स्वचालित रूप से खोजता और सत्यापित करता है
* स्थानीय रूप से ZK प्रमाण उत्पन्न करता है
* वैध प्रमाण सबमिट कर के पॉइंट्स कमाता है
* अपरिवर्तित पेड़ों को छोड़ता है (स्मार्ट स्लीपिंग)
* लॉग स्पष्ट रूप से दर्शाता है

---

## 🛠 समस्या समाधान

यदि कोई समस्या आए, तो निम्नलिखित जांचें:

1. gRPC URL – सही और एक्सेसिबल होना चाहिए
2. ZK प्रोवर सेवा – नोड से पहले चालू होनी चाहिए
3. प्राइवेट की – वैध और सही फॉर्मेट में होनी चाहिए
4. लॉग्स – `DEBUG=1` के साथ रन करें या कंसोल आउटपुट देखें

अधिक सहायता चाहिए? [FAQ और समस्या समाधान गाइड](https://docs.layeredge.io/introduction/developer-guide/run-a-node/faq-and-troubleshooting-guide) देखें।

