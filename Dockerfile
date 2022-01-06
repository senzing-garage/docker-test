ARG BASE_IMAGE=senzing/senzing-base:1.6.4
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-01-06

LABEL Name="senzing/test" \
      Maintainer="support@senzing.com" \
      Version="1.0.3"

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
