![Alt text](./IMAGE/CLI.png)

### 🚀 LayerEdge Bot Setup Guide

Welcome to the bot setup guide! Follow the steps below to install and configure the bot correctly. This guide is designed for new users, with clear explanations for each step.

> 📱 **For Mobile Users (Termux):** [View the guide here](https://github.com/MeoMunDep/Guides-for-using-my-script-on-termux)

---

## Table of Contents

1. [System Requirements](#system-requirements)
2. [Installing the Bot](#installing-the-bot)
3. [Bot Configuration](#bot-configuration)
4. [Running the Bot](#running-the-bot)
5. [Updating the Bot](#updating-the-bot)
6. [Contact & Support](#contact--support)

---

## System Requirements

Before running the bot, make sure you have installed:

- **Node.js** (Version: `22.11.0`)
- **npm** (Version: `10.9.0`)
- **Git**

📥 **Node.js & npm:** [Download](https://t.me/KeoAirDropFreeNe/257/1462)

📥 **Git:** [Download](https://t.me/KeoAirDropFreeNe/257/60831)

---

## Installing the Bot

<details>
<summary><strong>🔧 Install via Git</strong></summary>

```bash
git clone https://github.com/MeoMunDep/LayerEdge.git
cd LayerEdge
npm install --no-audit --no-fund --prefer-offline --force user-agents axios meo-forkcy-colors meo-forkcy-utils https-proxy-agent socks-proxy-agent ethers web3 ws
```

</details>

<details>
<summary><strong>🧰 Manual Installation</strong></summary>

1. Download and extract the bot manually.
2. Run the same `npm install --no-audit --no-fund --prefer-offline --force user-agents axios meo-forkcy-colors meo-forkcy-utils https-proxy-agent socks-proxy-agent ethers web3 ws` command as above.

</details>



---

## Bot Configuration

<details open>
<summary><strong>📜 1. <code>configs.json</code> - Main Configuration</strong></summary>

```json
{
  "rotateProxy": false,
  "skipInvalidProxy": false,
  "proxyRotationInterval": 2,
  "delayEachAccount": [1, 81],
  "timeToRestartAllAccounts": 300,
  "howManyAccountsRunInOneTime": 50,
  
  "doReferer": true,
  "referralCodes": ["EKajLIJW", "M60tDdYm"],
  
  "sendProof": true,
  "verifyNode": true,

  "getToken": {
    "maxCaptchaAttempts": 20,
    "2captchaApiKey": ["your-2captcha-key1", "your-2captcha-key2"],
    "capsolverApiKey": ["your-capsolver-key"],
    "capmonsterApiKey": ["your-capmonster-key"],
    "yescaptchaApiKey": ["your-yescaptcha-key"],
    "omniApiKey": ["your-omni-key"]
  }
}
```

| **Parameter Name**            | **Type**           | **Default**                                    | **Description**                                                 |
|------------------------------|--------------------|------------------------------------------------|-----------------------------------------------------------------|
| `rotateProxy`                | `boolean`          | `false`                                        | Enable proxy rotation between accounts                         |
| `skipInvalidProxy`           | `boolean`          | `false`                                        | Skip the account if its proxy is invalid                       |
| `proxyRotationInterval`      | `number`           | `2`                                            | Minutes between proxy rotations                                |
| `delayEachAccount`           | `[number, number]` | `[1, 81]`                                      | Random delay range (in seconds) between each account           |
| `timeToRestartAllAccounts`   | `number`           | `300`                                          | Time (in seconds) before restarting all accounts               |
| `howManyAccountsRunInOneTime`| `number`           | `50`                                           | Number of accounts to run in parallel                          |
| `doReferer`                  | `boolean`          | `true`                                         | Whether to perform referral registration                       |
| `referralCodes`              | `string[]`         | `["EKajLIJW", "M60tDdYm"]`                     | List of referral codes to use (randomly picked)                |
| `sendProof`                  | `boolean`          | `true`                                         | Whether to send activity proof to LayerEdge                    |
| `verifyNode`                 | `boolean`          | `true`                                         | Whether to automatically verify the node                       |
| `getToken.maxCaptchaAttempts`| `number`           | `20`                                           | Maximum attempts to solve CAPTCHA before failing               |
| `getToken.2captchaApiKey`    | `string[]`         | `["your-2captcha-key1", "your-2captcha-key2"]` | API keys for 2Captcha                                           |
| `getToken.capsolverApiKey`   | `string[]`         | `["your-capsolver-key"]`                       | API keys for CapSolver                                          |
| `getToken.capmonsterApiKey`  | `string[]`         | `["your-capmonster-key"]`                      | API keys for CapMonster                                         |
| `getToken.yescaptchaApiKey`  | `string[]`         | `["your-yescaptcha-key"]`                      | API keys for YesCaptcha                                         |
| `getToken.omniApiKey`        | `string[]`         | `["your-omni-key"]`                            | API keys for OmniCaptcha                                        |

</details>


<details>
<summary><strong>💼 2. <code>privateKeys.txt</code> - Wallet List</strong></summary>

📥 [Generate wallets here](https://github.com/MeoMunDep/Automatic-Ultimate-Create-Wallets-for-Airdrop)
- EVM PrivateKey
```txt
0xabc123...
0xdef456...
...
```

</details>

<details>
<summary><strong>🌐 3. <code>proxies.txt</code> - Proxy List</strong></summary>

📥 [Free proxy from Webshare](https://www.webshare.io/?referral_code=4l5kb3glsce7)

```txt
host:port
http://host:port
socks5://user:pass@host:port
...
```

</details>


---

## Running the Bot

<details open>
<summary><strong>🪟 Run on Windows (.bat)</strong></summary>

1. Double-click `run.bat`
2. It auto-updates, installs dependencies, and runs the bot.

> If it fails, right-click → **Run as Administrator**
> Or run from CMD:

```cmd
run.bat
```

</details>

<details>
<summary><strong>🐧 Run on Linux/macOS (.sh)</strong></summary>

```bash
chmod +x run.sh
./run.sh
```

</details>



---

## Updating the Bot

<details>
<summary><strong>🔄 If installed via Git</strong></summary>

```bash
cd LayerEdge
git pull origin main
npm install
```

</details>


---

## Contact & Support

- **Support me via** 
[LayerEdge Link](https://dashboard.layeredge.io/) - Referral Code: `PQv1wlu7`
- **Donate:** [Donate Here](https://t.me/KeoAirDropFreeNe/312/27801)
- **Contact (Work):** [@MeoMunDep](https://t.me/MeoMunDep)
- **Support Group:** [Join here](https://t.me/KeoAirDropFreeNe)
- **Updates Channel:** [View channel](https://t.me/KeoAirDropFreeNee)
- **YouTube:** [Watch here](https://www.youtube.com/@keoairdropfreene)
- **Instagram:** [Follow](https://www.instagram.com/meomundep)
- **Tiktok:** [Follow](https://www.tiktok.com/@meomundep)

---

⚠️ **Disclaimer**: This code is provided "as is" without any warranties. Use it at your own risk. You are solely responsible for any consequences arising from its use. Redistribution or sale of this code in any form is strictly prohibited.

✨ Thank you for using the bot, hope you earn from my scripts! Good luck! 🚀
