#!/bin/bash
# Disable opcache on Rosetta emulation to prevent futex / SIGSEGV crashes
sudo rm -f /etc/php/*/fpm/conf.d/*opcache* /etc/php/*/cli/conf.d/*opcache* || true
