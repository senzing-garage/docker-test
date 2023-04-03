ARG BASE_IMAGE=debian:11.6-slim@sha256:7acda01e55b086181a6fa596941503648e423091ca563258e2c1657d140355b1
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2023-04-03

LABEL Name="senzing/test" \
      Maintainer="support@senzing.com" \
      Version="1.0.5"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Run as "root" for system installation.

USER root

# Install packages via apt.

# Copy files from repository.

COPY ./rootfs /

# Make non-root container.

USER 1001

# Runtime execution.

WORKDIR /app
CMD ["/app/sleep-infinity.sh"]
