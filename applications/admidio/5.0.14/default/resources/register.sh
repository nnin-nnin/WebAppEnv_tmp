#!/usr/bin/env bash
set -e

USERNAME="${1}"
PASSWORD="${2}"
EMAIL="${3:-${USERNAME}@example.com}"
FIRST_NAME="${4:-Test}"
LAST_NAME="${5:-User}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"

if [ -z "${USERNAME}" ] || [ -z "${PASSWORD}" ]; then
    echo "Usage: $0 <username> <password> [email] [first_name] [last_name]"
    exit 1
fi

echo "Registering user '${USERNAME}' in Admidio..."

CONTAINER_ID=$(docker ps -q --filter "ancestor=yorem/admidio:5.0.14" 2>/dev/null | head -n 1 || true)

if [ -z "${CONTAINER_ID}" ]; then
    CONTAINER_ID=$(docker compose -f "${COMPOSE_FILE}" ps -q app 2>/dev/null | head -n 1 || true)
fi

if [ -z "${CONTAINER_ID}" ]; then
    echo "Error: Application container is not running."
    exit 1
fi

RESULT=$(docker exec -i "${CONTAINER_ID}" php -r "
ob_start();
\$_SERVER['REMOTE_ADDR'] = '127.0.0.1';
\$_SERVER['HTTP_USER_AGENT'] = 'admidio-register-script';
\$_SESSION = array();
require_once('/var/www/html/system/common.php');
use Admidio\Users\Entity\User;
use Admidio\ProfileFields\ValueObjects\ProfileFields;

try {
    \$username = \$argv[1];
    \$password = \$argv[2];
    \$email = \$argv[3];
    \$firstName = \$argv[4];
    \$lastName = \$argv[5];

    \$gProfileFields = new ProfileFields(\$gDb, 1);
    \$user = new User(\$gDb, \$gProfileFields);
    \$user->setValue('usr_login_name', \$username);
    \$user->setPassword(\$password);
    \$user->setValue('usr_valid', 1);
    \$user->setValue('usr_usr_id_create', 1);
    \$user->setValue('usr_timestamp_create', DATETIME_NOW);
    \$user->save(false);
    \$user->saveChangesWithoutRights();
    \$user->setValue('LAST_NAME', \$lastName);
    \$user->setValue('FIRST_NAME', \$firstName);
    \$user->setValue('EMAIL', \$email);
    \$user->save(false);

    \$sql = 'INSERT INTO ' . TBL_MEMBERS . ' (mem_usr_id, mem_rol_id, mem_begin, mem_usr_id_create, mem_timestamp_create) VALUES (?, (SELECT rol_id FROM ' . TBL_ROLES . ' WHERE rol_administrator = false LIMIT 1), CURDATE(), 1, NOW())';
    \$gDb->queryPrepared(\$sql, array(\$user->getValue('usr_id')));
    echo 'SUCCESS';
} catch (Exception \$e) {
    echo 'ERROR: ' . \$e->getMessage();
}
" -- "${USERNAME}" "${PASSWORD}" "${EMAIL}" "${FIRST_NAME}" "${LAST_NAME}")

if echo "${RESULT}" | grep -q "SUCCESS"; then
    echo "User '${USERNAME}' successfully registered and created!"
    exit 0
else
    echo "Failed to register user '${USERNAME}': ${RESULT}"
    exit 1
fi
