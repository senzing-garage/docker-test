ARG BASE_IMAGE=debian:11.11-slim@sha256:6d3c63184632046054ae709964befc943ecffa140adc697ca955a10002a79c08
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2024-06-24

LABEL Name="senzing/test" \
  Maintainer="support@senzing.com" \
  Version="1.0.11"

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
