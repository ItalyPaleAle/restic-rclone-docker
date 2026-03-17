# syntax=docker/dockerfile:1.7

ARG ALPINE_IMAGE=alpine:latest
ARG RESTIC_VERSION
ARG RCLONE_VERSION

FROM ghcr.io/restic/restic:${RESTIC_VERSION} AS restic
FROM ghcr.io/rclone/rclone:${RCLONE_VERSION} AS rclone
FROM ${ALPINE_IMAGE}

ARG RESTIC_VERSION
ARG RCLONE_VERSION
ARG ALPINE_DIGEST

LABEL org.opencontainers.image.title="restic-rclone"
LABEL org.opencontainers.image.description="Restic image with bundled rclone binary"
LABEL org.opencontainers.image.base.name="alpine:latest"
LABEL org.opencontainers.image.base.digest="${ALPINE_DIGEST}"
LABEL org.opencontainers.image.version.restic="${RESTIC_VERSION}"
LABEL org.opencontainers.image.version.rclone="${RCLONE_VERSION}"

RUN apk add --no-cache ca-certificates openssh-client

COPY --from=restic /usr/bin/restic /usr/bin/restic
COPY --from=rclone /usr/local/bin/rclone /usr/bin/rclone

ENTRYPOINT ["restic"]
