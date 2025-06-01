#!/bin/bash

chmod +x "$0"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' 

echo -ne "\033]0;LayerEdge Bot by @MeoMunDep\007"


print_yellow "Checking for updates..."
git pull origin main >/dev/null 2>&1
if [ $? -eq 0 ]; then
    print_green "Bot is up to date!"
else
    print_red "Failed to update the bot. Please check your internet connection or Git configuration."
fi

print_green() {
    echo -e "${GREEN}$1${NC}"
}

print_yellow() {
    echo -e "${YELLOW}$1${NC}"
}

print_red() {
    echo -e "${RED}$1${NC}"
}

if [ -d "../node_modules" ]; then
    print_green "Found node_modules in parent directory"
    MODULES_DIR=".."
else
    print_green "Using current directory for node_modules"
    MODULES_DIR="."
fi

check_node() {
    if ! command -v node &> /dev/null; then
        print_red "Node.js not found, installing..."
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt update && sudo apt install -y nodejs npm
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            brew install node
        elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" ]]; then
            echo "Please install Node.js manually on Windows."
        fi
        print_green "Node.js installation completed."
    else
        print_green "Node.js is already installed."
    fi
}
check_node

check_git() {
    if ! command -v git &> /dev/null; then
        print_red "Git not found, installing..."
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt update && sudo apt install -y git
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            brew install git
        elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" ]]; then
            echo "Please install Git manually on Windows."
        fi
        print_green "Git installation completed."
    else
        print_green "Git is already installed."
    fi
}
check_git

create_default_configs() {
    cat > configs.json << EOL
{
  "rotateProxy": false,
  "skipInvalidProxy": true,
  "proxyRotationInterval": 2,
  "delayEachAccount": [1, 1],
  "timeToRestartAllAccounts": 300,
  "howManyAccountsRunInOneTime": 1,
  
  "referralCode": ["EKajLIJW", "M60tDdYm"],
  "doReferer": true,

  "getToken": {
    "maxCaptchaAttempts": 20,
    "2captchaApiKey": [""],
    "capsolverApiKey": [""],
    "capmonsterApiKey": [""],
    "yescaptchaApiKey": [""],
    "omniApiKey": [""]
  }
}
EOL
}

check_configs() {
        if ! node -e "try { const cfg = require('./configs.json'); if (!cfg.howManyAccountsRunInOneTime || typeof cfg.howManyAccountsRunInOneTime !== 'number' || cfg.howManyAccountsRunInOneTime < 1) throw new Error(); } catch { process.exit(1); }"; then
        print_red "Invalid configuration detected. Resetting to default values..."
        create_default_configs
        print_green "Configuration reset completed."
    fi
}

print_yellow "Checking configuration files..."
if [ ! -f configs.json ]; then
    create_default_configs
    print_green "Created configs.json with default values"
fi

check_configs

for file in tokens.txt privateKeys.txt proxies.txt; do
    if [ ! -f "$file" ]; then
        touch "$file"
        print_green "Created $file"
    fi
done

print_green "Configuration files have been checked."

print_yellow "Checking dependencies..."
cd "$MODULES_DIR"
npm install --no-audit --no-fund --prefer-offline --force user-agents axios meo-forkcy-colors meo-forkcy-utils https-proxy-agent socks-proxy-agent ethers web3 crypto-js ws 
cd - > /dev/null
print_green "Dependencies installation completed!"



print_green "Starting the bot..."
node meomundep.js
