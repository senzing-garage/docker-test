ARG BASE_IMAGE=senzing/senzing-base:1.6.6
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-04-01

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
