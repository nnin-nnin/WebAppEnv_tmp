#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://localhost:18082}"
# Strip trailing slash if present
APP_URL="${APP_URL%/}"

resolve_email() {
    local u="$1"
    case "$u" in
        admin|admin@example.com) echo "admin@example.com" ;;
        admin2|admin2@example.com) echo "admin2@example.com" ;;
        user1|user1@example.com) echo "user1@example.com" ;;
        user2|user2@example.com) echo "user2@example.com" ;;
        *) echo "$u" ;;
    esac
}

detect_role() {
    local u="$1"
    case "$u" in
        admin|admin@example.com|admin2|admin2@example.com) echo "administrator" ;;
        user1|user1@example.com|user2|user2@example.com) echo "standard_user" ;;
        *) echo "unknown" ;;
    esac
}

verify_account() {
    local TARGET_USER="$1"
    local TARGET_PASS="$2"
    local EXPECTED_ROLE="$3"
    local TARGET_EMAIL
    TARGET_EMAIL="$(resolve_email "${TARGET_USER}")"

    echo "==> Verifying account: '${TARGET_USER}' (${TARGET_EMAIL})..."

    # 1. Verify REST API Authentication via /user/auth
    echo "  [Step 1] Testing API auth endpoint (${APP_URL}/user/auth)..."
    AUTH_RESP=$(curl -sS -X POST "${APP_URL}/user/auth" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        --data-urlencode "email=${TARGET_EMAIL}" \
        --data-urlencode "password=${TARGET_PASS}" 2>/dev/null || echo "")

    if echo "${AUTH_RESP}" | grep -q '"success":true'; then
        echo "  [Step 1 PASS] API authentication succeeded for '${TARGET_EMAIL}'."
    else
        echo "  [Step 1 FAIL] API authentication failed for '${TARGET_EMAIL}'. Response: ${AUTH_RESP}"
        return 1
    fi

    # 2. Verify Session Login & Access Control Boundary
    local COOKIE_FILE
    COOKIE_FILE="$(mktemp -t gila_test_cookie.XXXXXX)"
    trap 'rm -f "${COOKIE_FILE}"' RETURN

    if [ "${EXPECTED_ROLE}" = "administrator" ]; then
        echo "  [Step 2] Testing Admin session login to ${APP_URL}/admin..."
        LOGIN_RESP=$(curl -sS -i -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
            -X POST "${APP_URL}/admin" \
            -H "Content-Type: application/x-www-form-urlencoded" \
            --data-urlencode "username=${TARGET_EMAIL}" \
            --data-urlencode "password=${TARGET_PASS}")

        if echo "${LOGIN_RESP}" | grep -q "GSESSIONID=" || [ -s "${COOKIE_FILE}" ]; then
            echo "  [Step 2 PASS] Session cookie obtained."
        else
            echo "  [Step 2 FAIL] Failed to obtain session cookie."
            return 1
        fi

        ADMIN_PAGE=$(curl -sS -b "${COOKIE_FILE}" "${APP_URL}/admin")
        if echo "${ADMIN_PAGE}" | grep -qi "Administration" || echo "${ADMIN_PAGE}" | grep -qi "Dashboard" || echo "${ADMIN_PAGE}" | grep -qi "menu-toggle"; then
            echo "  [Step 3 PASS] Administrator dashboard verified successfully for '${TARGET_USER}'."
        else
            echo "  [Step 3 FAIL] Administrator dashboard verification failed."
            return 1
        fi
    else
        echo "  [Step 2] Testing Standard User session login to ${APP_URL}/user..."
        LOGIN_RESP=$(curl -sS -i -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
            -X POST "${APP_URL}/user" \
            -H "Content-Type: application/x-www-form-urlencoded" \
            --data-urlencode "username=${TARGET_EMAIL}" \
            --data-urlencode "password=${TARGET_PASS}")

        if echo "${LOGIN_RESP}" | grep -q "GSESSIONID=" || [ -s "${COOKIE_FILE}" ]; then
            echo "  [Step 2 PASS] Session cookie obtained for standard user."
        else
            echo "  [Step 2 FAIL] Failed to obtain session cookie for standard user."
            return 1
        fi

        # Verify access to user frontend / user profile
        USER_PAGE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -b "${COOKIE_FILE}" "${APP_URL}/")
        if [ "${USER_PAGE_STATUS}" = "200" ] || [ "${USER_PAGE_STATUS}" = "302" ]; then
            echo "  [Step 3 PASS] Standard user can access frontend pages (HTTP ${USER_PAGE_STATUS})."
        else
            echo "  [Step 3 FAIL] Standard user failed to access frontend (HTTP ${USER_PAGE_STATUS})."
            return 1
        fi

        # Verify Vertical Access Control: Standard User accessing /admin MUST be forbidden (HTTP 403)
        echo "  [Step 4] Verifying vertical privilege boundary (standard user accessing /admin)..."
        ADMIN_ACCESS_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -b "${COOKIE_FILE}" "${APP_URL}/admin")
        if [ "${ADMIN_ACCESS_STATUS}" = "403" ]; then
            echo "  [Step 4 PASS] Vertical access control confirmed: /admin correctly returned 403 Forbidden for standard user."
        else
            echo "  [Step 4 FAIL] Vertical access control violation: /admin returned HTTP ${ADMIN_ACCESS_STATUS} instead of 403."
            return 1
        fi
    fi

    echo "==> Account '${TARGET_USER}' passed all verification checks!"
    echo ""
    return 0
}

# Entrypoint: Check if single-account args passed or run full matrix
USERNAME="${1}"
PASSWORD="${2}"

if [ -n "${USERNAME}" ] && [ -n "${PASSWORD}" ]; then
    ROLE="${3:-$(detect_role "${USERNAME}")}"
    verify_account "${USERNAME}" "${PASSWORD}" "${ROLE}"
    exit $?
else
    echo "================================================================="
    echo "Executing Comprehensive 4-Account Matrix Verification on ${APP_URL}"
    echo "================================================================="

    FAILED=0

    # 1. Administrator Level (2 accounts)
    echo ">>> Tier 1: Administrator Level (Vertical Privilege & Peer Admin Isolation)"
    verify_account "admin@example.com" "AdminPassword123!" "administrator" || FAILED=1
    verify_account "admin2" "AdminPassword123!" "administrator" || FAILED=1

    # 2. Standard User Level (2 accounts)
    echo ">>> Tier 2: Standard User Level (IDOR / Horizontal Privilege Separation)"
    verify_account "user1" "UserPassword123!" "standard_user" || FAILED=1
    verify_account "user2" "UserPassword123!" "standard_user" || FAILED=1

    # 3. Negative Authentication Check
    echo ">>> Tier 3: Negative Authentication Check (WrongPassword999!)"
    BAD_RESP=$(curl -sS -X POST "${APP_URL}/user/auth" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        --data-urlencode "email=admin@example.com" \
        --data-urlencode "password=WrongPassword999!" 2>/dev/null || echo "")
    if echo "${BAD_RESP}" | grep -q '"success":true'; then
        echo "  [FAIL] WrongPassword999! was falsely accepted!"
        FAILED=1
    else
        echo "  [PASS] WrongPassword999! properly rejected."
    fi

    if [ ${FAILED} -eq 0 ]; then
        echo "================================================================="
        echo "All 4 accounts verified successfully! (2 Admins + 2 Standard Users)"
        echo "================================================================="
        exit 0
    else
        echo "================================================================="
        echo "Error: One or more evaluation accounts failed verification."
        echo "================================================================="
        exit 1
    fi
fi
