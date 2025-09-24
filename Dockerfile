ARG BASE_IMAGE=debian:13.1-slim@sha256:c2880112cc5c61e1200c26f106e4123627b49726375eb5846313da9cca117337
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
