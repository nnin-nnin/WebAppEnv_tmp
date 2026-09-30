#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18842}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-admin}}"
PASSWORD="${ADMIN_PASSWORD:-${ADMIN_PASS:-metersphere}}"

echo "=========================================="
echo "MeterSphere Multi-Tier Login Verification"
echo "Target URL: ${APP_URL}"
echo "User: ${USERNAME}"
echo "=========================================="

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# 1. Web Frontend Access Check
echo "[1/3] Checking MeterSphere Web Frontend..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/" || true)
if [ "$HTTP_CODE" = "200" ]; then
  echo "✓ Web interface accessible (HTTP 200)."
else
  echo "✗ Warning: Root returned HTTP $HTTP_CODE"
  exit 1
fi

# 2. RSA Public Key Check
echo "[2/3] Fetching RSA Public Key (/get-key)..."
KEY_RESP=$(curl -s "${APP_URL}/get-key" || true)
if echo "$KEY_RESP" | grep -q '"code":100200'; then
  echo "✓ RSA Public Key retrieved successfully."
else
  echo "✗ Failed to retrieve RSA Public Key: $KEY_RESP"
  exit 1
fi

# 3. Core REST API Direct Authentication (POST /login & GET /is-login)
echo "[3/3] Authenticating via MeterSphere REST API..."
LOGIN_OUTPUT=$(python3 - "${APP_URL}" "${USERNAME}" "${PASSWORD}" "$TMP_DIR" << 'EOF'
import sys, json, subprocess, base64, urllib.request

app_url = sys.argv[1].rstrip("/")
username = sys.argv[2]
password = sys.argv[3]
tmp_dir = sys.argv[4]

try:
    # 1. Fetch public key
    req_key = urllib.request.Request(f"{app_url}/get-key")
    with urllib.request.urlopen(req_key, timeout=10) as res:
        key_data = json.loads(res.read().decode())
    pubkey = key_data.get("data")
    if not pubkey:
        print("ERROR: Empty public key in response")
        sys.exit(1)

    pem_path = f"{tmp_dir}/pubkey.pem"
    with open(pem_path, "w") as f:
        f.write(f"-----BEGIN PUBLIC KEY-----\n{pubkey}\n-----END PUBLIC KEY-----\n")

    # 2. RSA encrypt username and password
    p1 = subprocess.Popen(["openssl", "pkeyutl", "-encrypt", "-pubin", "-inkey", pem_path],
                          stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    enc_user, err1 = p1.communicate(input=username.encode())
    if p1.returncode != 0:
        print(f"ERROR encrypting username: {err1.decode()}")
        sys.exit(1)

    p2 = subprocess.Popen(["openssl", "pkeyutl", "-encrypt", "-pubin", "-inkey", pem_path],
                          stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    enc_pwd, err2 = p2.communicate(input=password.encode())
    if p2.returncode != 0:
        print(f"ERROR encrypting password: {err2.decode()}")
        sys.exit(1)

    user_b64 = base64.b64encode(enc_user).decode()
    pwd_b64 = base64.b64encode(enc_pwd).decode()

    # 3. POST /login
    login_payload = json.dumps({"username": user_b64, "password": pwd_b64, "authenticate": "LOCAL"}).encode()
    login_req = urllib.request.Request(f"{app_url}/login", data=login_payload, headers={"Content-Type": "application/json"})
    with urllib.request.urlopen(login_req, timeout=15) as login_res:
        auth_token = login_res.headers.get("X-AUTH-TOKEN", "")
        login_body = json.loads(login_res.read().decode())

    if login_body.get("code") != 100200:
        print(f"ERROR: Login failed with code {login_body.get('code')}: {login_body}")
        sys.exit(1)

    session_id = login_body.get("data", {}).get("sessionId", "")
    user_name = login_body.get("data", {}).get("name", username)

    # 4. Verify session persistence via /is-login
    is_login_req = urllib.request.Request(f"{app_url}/is-login", headers={"X-AUTH-TOKEN": auth_token})
    with urllib.request.urlopen(is_login_req, timeout=10) as is_login_res:
        is_login_body = json.loads(is_login_res.read().decode())

    if is_login_body.get("code") == 100200:
        print(f"SUCCESS|{user_name}|{auth_token}|{session_id}")
    else:
        print(f"ERROR: Session verification failed: {is_login_body}")
        sys.exit(1)

except Exception as e:
    print(f"ERROR: {e}")
    sys.exit(1)
EOF
)

if echo "$LOGIN_OUTPUT" | grep -q "^SUCCESS|"; then
  PARTS=$(echo "$LOGIN_OUTPUT" | grep "^SUCCESS|")
  USER_DISPLAY=$(echo "$PARTS" | cut -d'|' -f2)
  TOKEN_VAL=$(echo "$PARTS" | cut -d'|' -f3)
  SESSION_VAL=$(echo "$PARTS" | cut -d'|' -f4)
  echo "✓ MeterSphere Core API authenticated successfully!"
  echo "  User: ${USER_DISPLAY} (${USERNAME})"
  echo "  Auth Token: ${TOKEN_VAL:0:28}..."
  echo "  Session ID: ${SESSION_VAL}"
  echo "=========================================="
  echo "RESULT: MeterSphere ALL login tiers PASSED (Frontend + RSA Encryption + Core REST API)!"
  exit 0
else
  echo "✗ Login verification failed: $LOGIN_OUTPUT"
  echo "=========================================="
  echo "RESULT: MeterSphere login verification FAILED."
  exit 1
fi
