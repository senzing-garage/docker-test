ARG BASE_IMAGE=debian:11.7-slim@sha256:c618be84fc82aa8ba203abbb07218410b0f5b3c7cb6b4e7248fda7785d4f9946
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2023-09-29

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
