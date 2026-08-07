#!/usr/bin/env bash
set -Eeuo pipefail

docker run -d --name gitlab-16.11.2-ce.0 \
  -p 18527:80 \
  -v gitlab-16.11.2-ce.0-config:/etc/gitlab \
  -v gitlab-16.11.2-ce.0-logs:/var/log/gitlab \
  -v gitlab-16.11.2-ce.0-data:/var/opt/gitlab \
  asteriskax001/sop-gitlab:16.11.2-ce.0
