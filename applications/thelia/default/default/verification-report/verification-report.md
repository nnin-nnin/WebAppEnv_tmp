# Verification Report: thelia (default/default)

- **Application**: `thelia`
- **Version**: `default`
- **Port**: `18869`
- **Delivery Mode**: `native_compose` via `DOCKERHUB`
- **Image**: `yorem/thelia:default@sha256:0a53e9433a0aefec7afbfe789bb0e20e87340deedd7f382e31d5affd2a2a6583`
- **Verdict**: **PASSED (7/7 Checks)**

## Summary of Verification Checks

1. **Static Directory Structure**: All standard paths present (manifest.yaml, compose.yaml, image.json, source, scripts, resources).
2. **Contract Standards**: Native compose and DOCKERHUB delivery method confirmed.
3. **Compose Specifications**: Services defined with `linux/amd64` platform and pinned digests.
4. **Shell Script Syntax**: Syntax and execution bits verified for up.sh, reset.sh, healthcheck.sh, login.sh.
5. **Host Path Sanitization**: Clean and free of absolute local paths.
6. **Ruby Delivery Validator**: `ruby code/validate_compose_delivery.rb` returned `PASS`.
7. **Dynamic Runtime Verification**: Complete flow executed (`up.sh` -> `healthcheck.sh` -> `login.sh` -> `reset.sh`), Web UI and admin auth verified on port 18869.
