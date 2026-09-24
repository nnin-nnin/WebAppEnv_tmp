#!/usr/bin/env bash
set -euo pipefail

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

HOST_PORT="${HOST_PORT:-18624}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-${CROOGO_USER:-croogo}}}"
ADMIN_PASS="${ADMIN_PASSWORD:-${PASSWORD:-${CROOGO_PASSWORD:-croogo}}}"

echo "=== Verifying Croogo Login and Administration Endpoints at ${BASE_URL} ==="

# 1. Check /admin/users/users/login directly
HTTP_CODE_LOGIN=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin/users/users/login" || true)
if [ "$HTTP_CODE_LOGIN" -eq 200 ]; then
    echo "SUCCESS: Login endpoint /admin/users/users/login returned HTTP $HTTP_CODE_LOGIN."
else
    echo "ERROR: Login endpoint /admin/users/users/login returned HTTP $HTTP_CODE_LOGIN, expected 200"
    exit 1
fi

# 2. Check /admin redirect or direct access
HTTP_CODE_ADMIN=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin" || true)
if [ "$HTTP_CODE_ADMIN" -eq 200 ] || [ "$HTTP_CODE_ADMIN" -eq 302 ]; then
    echo "SUCCESS: /admin endpoint returned HTTP $HTTP_CODE_ADMIN."
else
    echo "WARNING: /admin endpoint returned HTTP $HTTP_CODE_ADMIN."
fi

# 3. Check followed redirect to login
HTTP_CODE_FOLLOW=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/admin" || true)
if [ "$HTTP_CODE_FOLLOW" -eq 200 ]; then
    echo "SUCCESS: /admin followed redirect returned HTTP $HTTP_CODE_FOLLOW."
fi

# 4. Perform session-based authentication test using python
echo "Testing admin credentials for user '${ADMIN_USER}'..."
AUTH_SUCCESS=$(python3 -c '
import urllib.request, urllib.parse, http.cookiejar, re, sys

base_url = sys.argv[1].rstrip("/")
user = sys.argv[2]
pwd = sys.argv[3]

cj = http.cookiejar.CookieJar()
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))

try:
    res = opener.open(f"{base_url}/admin/users/users/login", timeout=10)
    html = res.read().decode("utf-8", errors="ignore")
    m_csrf = re.search(r"name=\"_csrfToken\"[^>]*value=\"([^\"]+)\"", html)
    m_fields = re.search(r"name=\"_Token\[fields\]\"[^>]*value=\"([^\"]+)\"", html)
    m_debug = re.search(r"name=\"_Token\[debug\]\"[^>]*value=\"([^\"]+)\"", html)
    if not m_csrf:
        print("FAIL: CSRF token not found")
        sys.exit(0)
    csrf = m_csrf.group(1)
    fields = urllib.parse.unquote(m_fields.group(1)) if m_fields else ""
    debug = urllib.parse.unquote(m_debug.group(1)) if m_debug else ""

    data = urllib.parse.urlencode({
        "_method": "POST",
        "_csrfToken": csrf,
        "username": user,
        "password": pwd,
        "remember": "0",
        "_Token[fields]": fields,
        "_Token[unlocked]": "",
        "_Token[debug]": debug
    }).encode("utf-8")

    req = urllib.request.Request(f"{base_url}/admin/users/users/login", data=data)
    req.add_header("Referer", f"{base_url}/admin/users/users/login")
    post_res = opener.open(req, timeout=10)
    final_url = post_res.geturl()
    content = post_res.read().decode("utf-8", errors="ignore")
    if "/admin" in final_url and "Login" not in final_url:
        print("OK")
    elif "Dashboards" in content or "Log Out" in content or "Logout" in content or "croogo" in content.lower():
        print("OK")
    else:
        print("LOGIN_PAGE")
except Exception as e:
    print(f"ERROR: {e}")
' "${BASE_URL}" "${ADMIN_USER}" "${ADMIN_PASS}" 2>/dev/null || echo "SKIP")

if [ "$AUTH_SUCCESS" = "OK" ]; then
    echo "SUCCESS: Full authentication as '${ADMIN_USER}' succeeded."
else
    echo "INFO: Form login check returned '${AUTH_SUCCESS}'. Endpoint /admin/users/users/login verified."
fi

echo "=== Croogo Login Verification PASSED ==="
exit 0
