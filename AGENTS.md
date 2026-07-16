# AGENTS.md

A minimal Docker image wrapping [pwgen](https://linux.die.net/man/1/pwgen)
(pinned to `~2.08`), based on Alpine.

## Project Layout

```text
.
├── Dockerfile              # Alpine + apk-installed pwgen
├── docker-entrypoint.sh    # ENTRYPOINT script
├── README.md
├── .pre-commit-config.yaml
├── .markdownlint.json
└── .github/workflows/
    ├── docker-publish.yml  # Build, test, push to Docker Hub + GHCR
    └── shellcheck.yml      # Lints docker-entrypoint.sh
```

## Build / Run Commands

```bash
docker build -t pwgen .
docker run -i --rm pwgen              # generate passwords
docker run -i --rm pwgen -h           # usage
docker run -i --rm pwgen -sync 25     # 25-char secure, symbol-free password
```

## Code Style

- Dockerfile uses `RUN set -ex` and `COPY --link` for cache-friendly layers.
- Pin the `pwgen` apk package version explicitly (`pwgen=~2.08`).
- Pre-commit hooks (`.pre-commit-config.yaml`): actionlint, gitleaks,
  markdownlint-cli2, standard hygiene checks (trailing whitespace, EOF fixer).
- Markdown lint rules in `.markdownlint.json`.

## CI/CD

- `docker-publish.yml`: builds the image, tests it, and pushes to Docker Hub
  (`chorrell/pwgen`) and GHCR (`ghcr.io/chorrell/pwgen`) on merge to `main`.
- `shellcheck.yml`: lints shell scripts on PRs.

## Contributing

1. Branch from `main`.
2. Run `pre-commit run --all-files` before committing.
3. Verify locally: `docker build -t pwgen . && docker run -i --rm pwgen -h`.
4. Open a PR; CI runs the build/test and shellcheck workflows.
