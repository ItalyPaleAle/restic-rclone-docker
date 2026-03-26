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

The repository keeps version metadata in `versions.json`.

- `check-version-updates` runs every 2 days (and on manual dispatch) to detect new `restic`, `rclone`, or `alpine:latest` digest values.
- If there is a change, the workflow opens a pull request updating `versions.json`.
- `build-and-publish` runs only on commits to `main` (or manual dispatch), reads versions from `versions.json`, then builds/tests/publishes images.
