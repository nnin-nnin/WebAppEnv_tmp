# WebAppEnv

Reproducible Web application security benchmark environments for empirical security research, automated exploit generation, and autonomous agent evaluation.

The repository provides **132 Web applications** across **146 versioned environments**. All environments are self-contained, pre-seeded with ground-truth credentials, and verified. Pre-built images are hosted on Docker Hub under the `yorem` namespace.

## Index

- [All Applications and Environments (146 Suites)](index/all.md)
- [Black Widow and YuraScanner Paper Baselines](index/listb.md)
- [Packaging and Verification Guide](docs/README.md)

## Directory Conventions

```text
applications/<app-name>/<version>/<variant>/
├── README.md               # Quickstart guide and credentials
├── manifest.yaml           # Metadata index (runtimes, ports, images)
├── source/source.yaml      # Upstream Git repository URL and pinned commit
├── resources/              # Pre-seeded users, roles, and login scripts
├── docker/                 # Dockerfile and compose configurations
├── scripts/                # Operations: up.sh, healthcheck.sh, reset.sh
└── image/image.json        # Pinned image metadata
```

## Quick Start

Select an environment from [index/all.md](index/all.md), enter its directory, and run the startup script:

```bash
cd applications/abantecart/1.4.4/default
./scripts/up.sh
./scripts/healthcheck.sh
```

Or run an all-in-one container directly:

```bash
docker run -d -p 18092:80 yorem/espocrm:8.2.5
```

Refer to each environment's `README.md` for specific access URLs and default credentials.

## Releases

- `release-2026.09.24`: 132 applications, 146 environments, standardized to `yorem/` namespace.
- `release-2026.08.07`: Initial baseline with 27 applications (28 environments) for Black Widow and YuraScanner.
