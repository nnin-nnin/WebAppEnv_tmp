#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_URL="${APP_URL:-http://localhost:18081}"
USERNAME="${1}"
PASSWORD="${2}"

# Ensure node is available
if ! command -v node >/dev/null 2>&1; then
    echo "Error: Node.js runtime is required for UJCMS SM2/JWT authentication."
    exit 1
fi

# Ensure sm-crypto and crypto-js are available
if ! node -e "require('sm-crypto'); require('crypto-js');" >/dev/null 2>&1; then
    if [ ! -d "/tmp/node_modules/sm-crypto" ] && [ ! -d "${SCRIPT_DIR}/node_modules/sm-crypto" ]; then
        echo "Installing required cryptographic dependencies (sm-crypto, crypto-js)..."
        (cd /tmp && npm install sm-crypto crypto-js --no-save --silent >/dev/null 2>&1) || true
    fi
fi

if [ -n "${USERNAME}" ] && [ -n "${PASSWORD}" ]; then
    echo "Attempting login to ${APP_URL} as '${USERNAME}'..."
    node "${SCRIPT_DIR}/auth_client.js" "${USERNAME}" "${PASSWORD}"
    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        echo "Login succeeded for '${USERNAME}'."
        exit 0
    else
        echo "Login failed for '${USERNAME}'."
        exit 1
    fi
else
    echo "Executing comprehensive multi-dimension login verification on ${APP_URL}..."
    node "${SCRIPT_DIR}/auth_client.js"
    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        echo "All target accounts (administrator & horizontal peer users) verified successfully!"
        exit 0
    else
        echo "Error: One or more target accounts failed authentication."
        exit 1
    fi
fi
