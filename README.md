# restic-rclone-docker

Container images for [restic](https://restic.net/) with [rclone](https://rclone.org/) bundled.

## Image

Published on GitHub Container Registry:

- `ghcr.io/italypaleale/restic-rclone:<restic-version>:<rclone-version>`
- `ghcr.io/italypaleale/restic-rclone:<restic-version>` (tracks latest rclone)
- `ghcr.io/italypaleale/restic-rclone:latest`

## Build details

- Final image base: `alpine:latest`
- `restic` binary copied from `ghcr.io/restic/restic`
- `rclone` binary copied from `ghcr.io/rclone/rclone`
- `openssh-client` is included
- Built as multi-arch image for `linux/amd64` and `linux/arm64`
- No explicit `USER` is configured in the image
- Entrypoint is `restic`

## Automation

The GitHub Actions workflow runs:

- daily
- on manual dispatch
- on pushes to `main`

It rebuilds/publishes only when needed:

1. New `restic` release
2. New `rclone` release
3. `alpine:latest` digest changed compared to the last published combo tag

Before pushing, CI builds a local `linux/amd64` image and verifies it can initialize a repository and create a backup from a mounted source directory.
