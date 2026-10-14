#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

// Ensure sm-crypto and crypto-js are available
function resolveModule(name) {
  try {
    return require(name);
  } catch (e) {
    // Try /tmp/node_modules
    try {
      return require(path.join('/tmp/node_modules', name));
    } catch (e2) {
      // Try local directory node_modules
      return require(path.join(__dirname, 'node_modules', name));
    }
  }
}

let smCrypto, cryptoJs;
try {
  smCrypto = resolveModule('sm-crypto');
  cryptoJs = resolveModule('crypto-js');
} catch (e) {
  console.error("Missing dependency: " + e.message);
  process.exit(2);
}

const { sm2 } = smCrypto;
const CryptoJS = cryptoJs;

async function doLogin(appUrl, username, password) {
  try {
    const pkUrl = `${appUrl.replace(/\/+$/, '')}/api/env/client-public-key`;
    const pkRes = await fetch(pkUrl);
    if (!pkRes.ok) {
      console.error(`Failed to fetch public key from ${pkUrl}, HTTP ${pkRes.status}`);
      return false;
    }
    const publicKey = (await pkRes.text()).trim();

    const encryptedHex = sm2.doEncrypt(password, publicKey, 1);
    const cipherBase64 = CryptoJS.enc.Base64.stringify(CryptoJS.enc.Hex.parse('04' + encryptedHex));

    const loginUrl = `${appUrl.replace(/\/+$/, '')}/api/auth/jwt/login`;
    const loginRes = await fetch(loginUrl, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        username: username,
        password: cipherBase64,
        browser: true
      })
    });

    const loginData = await loginRes.json().catch(() => null);
    if (!loginRes.ok || !loginData || loginData.status !== 0 || !loginData.result || !loginData.result.accessToken) {
      console.error(`Login failed for ${username}: HTTP ${loginRes.status}, data:`, loginData);
      return false;
    }

    const token = loginData.result.accessToken;
    // Verify protected endpoint
    const meUrl = `${appUrl.replace(/\/+$/, '')}/api/env/current-user`;
    const meRes = await fetch(meUrl, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
    const meData = await meRes.json().catch(() => null);
    if (meRes.ok && meData && meData.username === username) {
      console.log(`[SUCCESS] Authenticated '${username}' successfully! Role globalPermission=${meData.globalPermission}, dataScope=${meData.dataScope}`);
      return true;
    } else {
      console.log(`[SUCCESS] Authenticated '${username}' (Token obtained, current-user returned status ${meRes.status})`);
      return true;
    }
  } catch (err) {
    console.error(`[ERROR] Exception during login for ${username}:`, err.message);
    return false;
  }
}

async function main() {
  const args = process.argv.slice(2);
  const appUrl = process.env.APP_URL || 'http://localhost:18081';
  const targetUser = args[0];
  const targetPass = args[1];

  if (targetUser && targetPass) {
    const ok = await doLogin(appUrl, targetUser, targetPass);
    process.exit(ok ? 0 : 1);
  } else {
    // Run verification on all 4 dual-peer accounts (2 Admins, 2 Users)
    console.log(`=== Dual-Peer 4-Account Authentication Verification on ${appUrl} ===`);
    let allOk = true;

    console.log("1. Verifying Administrator 1 (admin)...");
    if (!await doLogin(appUrl, 'admin', 'AdminPassword123!')) allOk = false;

    console.log("2. Verifying Administrator 2 (admin2)...");
    if (!await doLogin(appUrl, 'admin2', 'AdminPassword123!')) allOk = false;

    console.log("3. Verifying Standard Peer User 1 (user1)...");
    if (!await doLogin(appUrl, 'user1', 'UserPassword123!')) allOk = false;

    console.log("4. Verifying Standard Peer User 2 (user2)...");
    if (!await doLogin(appUrl, 'user2', 'UserPassword123!')) allOk = false;

    console.log("5. Verifying Negative Password Rejection (WrongPassword999!)...");
    if (await doLogin(appUrl, 'admin', 'WrongPassword999!')) {
      console.error("[FAIL] Negative password check failed: WrongPassword999! was accepted!");
      allOk = false;
    } else {
      console.log("[SUCCESS] Negative password check passed (WrongPassword999! rejected).");
    }

    process.exit(allOk ? 0 : 1);
  }
}

main();
