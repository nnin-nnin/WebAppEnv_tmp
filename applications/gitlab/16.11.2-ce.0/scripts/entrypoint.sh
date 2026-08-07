#!/usr/bin/env bash
set -Eeuo pipefail

# The official Omnibus wrapper supervises NGINX, Rails, PostgreSQL, Redis,
# Gitaly and the remaining GitLab services inside this one container.
if [[ -n "${GITLAB_INITIAL_ADMIN_PASSWORD:-}" ]]; then
  export GITLAB_ROOT_PASSWORD="$GITLAB_INITIAL_ADMIN_PASSWORD"
fi

/assets/wrapper &
wrapper_pid=$!

configure_admin() {
  local i result
  for i in $(seq 1 240); do
    if curl -fsS --max-time 3 http://127.0.0.1:80/-/health >/dev/null 2>&1; then
      # Omnibus creates the initial root account. Rename it with a direct
      # PostgreSQL update so startup does not need a second Rails boot.
      gitlab-psql -d gitlabhq_production -c "UPDATE users SET username='admin', name='Administrator', admin=true, updated_at=now() WHERE username='root' AND NOT EXISTS (SELECT 1 FROM users WHERE username='admin');" >/dev/null 2>&1 || true
      result="$(gitlab-psql -d gitlabhq_production -tAc "SELECT EXISTS (SELECT 1 FROM users WHERE username='admin' AND admin=true);" 2>/dev/null | tr -d '[:space:]' || true)"
      if [[ "$result" == true ]]; then
        unset GITLAB_INITIAL_ADMIN_PASSWORD GITLAB_ROOT_PASSWORD GITLAB_ADMIN_PASSWORD
        return 0
      fi
    fi
    sleep 5
  done
  return 1
}

configure_admin &
admin_pid=$!

term_handler() {
  kill -TERM "$admin_pid" 2>/dev/null || true
  kill -TERM "$wrapper_pid" 2>/dev/null || true
}
trap term_handler TERM INT

wait "$wrapper_pid"
status=$?
kill -TERM "$admin_pid" 2>/dev/null || true
wait "$admin_pid" 2>/dev/null || true
exit "$status"
