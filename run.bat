@echo off
title LayerEdge Bot by @MeoMunDep
color 0A

cd %~dp0

echo Checking for bot updates...
git pull origin main > nul 2>&1
echo Bot updated!

echo Checking configuration files...

@if not exist configs.json (
    echo {>"configs.json"
    echo   "rotateProxy": false,>>"configs.json"
    echo   "skipInvalidProxy": true,>>"configs.json"
    echo   "proxyRotationInterval": 2,>>"configs.json"
    echo   "delayEachAccount": [1, 1],>>"configs.json"
    echo   "timeToRestartAllAccounts": 300,>>"configs.json"
    echo   "howManyAccountsRunInOneTime": 1,>>"configs.json"
    echo   "doReferer": true,>>"configs.json"
    echo   "referralCode": ["EKajLIJW", "M60tDdYm"],>>"configs.json"
    echo   "getToken": {>>"configs.json"
    echo     "maxCaptchaAttempts": 20,>>"configs.json"
    echo     "2captchaApiKey": [""],>>"configs.json"
    echo     "capsolverApiKey": [""],>>"configs.json"
    echo     "capmonsterApiKey": [""],>>"configs.json"
    echo     "yescaptchaApiKey": [""],>>"configs.json"
    echo     "omniApiKey": [""]>>"configs.json"
    echo   }>>"configs.json"
    echo }>>"configs.json"
    echo Created configs.json
)

(for %%F in (tokens.txt privateKeys.txt proxies.txt) do (
    if not exist %%F (
        type nul > %%F
        echo Created %%F
    )
))

echo Configuration files checked.

echo Checking dependencies...
if exist "..\node_modules" (
    echo Using node_modules from parent directory...
    cd ..
    CALL npm install --no-audit --no-fund --prefer-offline --force user-agents axios meo-forkcy-colors meo-forkcy-utils https-proxy-agent socks-proxy-agent ethers web3 ws 
    cd %~dp0
) else (
    echo Installing dependencies in current directory...
    CALL npm install --no-audit --no-fund --prefer-offline --force user-agents axios meo-forkcy-colors meo-forkcy-utils https-proxy-agent socks-proxy-agent ethers web3 ws 
)
echo Dependencies installation completed!



echo Starting the bot...
node meomundep

pause
exit
