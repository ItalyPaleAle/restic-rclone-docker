# restic-rclone-docker

Container images for [restic](https://restic.net/) with [rclone](https://rclone.org/) bundled.

## Image

Published on GitHub Container Registry:

- `ghcr.io/italypaleale/restic-rclone:<restic-version>:<rclone-version>`
- `ghcr.io/italypaleale/restic-rclone:<restic-version>` (tracks latest rclone)
- `ghcr.io/italypaleale/restic-rclone:latest`

## Build details

- Based on alpine
- `restic` binary copied from official container image `ghcr.io/restic/restic`
- `rclone` binary copied from official container image `ghcr.io/rclone/rclone`
- Includes `openssh-client`
- Built as multi-arch image for `linux/amd64` and `linux/arm64`

## Automation

The GitHub Actions workflow runs daily and on manual dispatch.

It rebuilds/publishes only when needed:

1. New `restic` release
2. New `rclone` release
3. `alpine:latest` digest changed compared to the last published combo tag
