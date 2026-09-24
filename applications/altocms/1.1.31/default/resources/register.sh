#!/usr/bin/env bash
set -euo pipefail

NEW_USER="${1:-${USER_USERNAME:-testuser}}"
NEW_PASS="${2:-${USER_PASSWORD:-benchmark-only}}"
NEW_EMAIL="${3:-${USER_EMAIL:-${NEW_USER}@example.com}}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Calculate salted password hash: 0x: + md5(sha1(password + '::' + salt_pass))
SALT_PASS="pass_salt_12345678901234567890123456789012345678901234567890"
PASS_HASH=$(python3 -c "import hashlib; s=('${NEW_PASS}::${SALT_PASS}').encode('utf-8'); sha=hashlib.sha1(s).hexdigest(); md5=hashlib.md5(sha.encode('utf-8')).hexdigest(); print('0x:' + md5)")

APP_CONTAINER=$(docker compose -f "${APP_DIR}/docker/compose.yaml" ps -q app 2>/dev/null | head -n 1 || echo "")

if [ -z "$APP_CONTAINER" ]; then
    APP_CONTAINER=$(docker ps --filter "name=app" --filter "status=running" -q | head -n 1 || echo "")
fi

if [ -z "$APP_CONTAINER" ]; then
    echo "ERROR: Unable to locate running application container."
    exit 1
fi

docker exec -i "$APP_CONTAINER" php -r "
\$m = new mysqli('db', 'altocms', 'altocms_pass', 'altocms');
if (\$m->connect_error) { die('DB error: ' . \$m->connect_error . \"\n\"); }

\$u = \$m->real_escape_string('${NEW_USER}');
\$p = \$m->real_escape_string('${PASS_HASH}');
\$e = \$m->real_escape_string('${NEW_EMAIL}');

\$q1 = \"INSERT INTO prefix_user (user_login, user_password, user_mail, user_date_register, user_activate, user_role, user_ip_register) VALUES ('\$u', '\$p', '\$e', NOW(), 1, 1, '127.0.0.1') ON DUPLICATE KEY UPDATE user_password='\$p', user_activate=1\";
if (!\$m->query(\$q1)) { die('Insert user error: ' . \$m->error . \"\n\"); }

\$res = \$m->query(\"SELECT user_id FROM prefix_user WHERE user_login='\$u'\");
if (\$row = \$res->fetch_assoc()) {
    \$uid = \$row['user_id'];
    \$q2 = \"INSERT INTO prefix_blog (user_owner_id, blog_title, blog_description, blog_type, blog_date_add, blog_limit_rating_topic) VALUES (\$uid, 'Blog by \$u', 'This is your personal blog.', 'personal', NOW(), -1000.000) ON DUPLICATE KEY UPDATE blog_title='Blog by \$u'\";
    \$m->query(\$q2);
}
" >/dev/null

echo "User ${NEW_USER} created successfully."
exit 0
