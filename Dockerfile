ARG BASE_IMAGE=senzing/senzing-base
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-05-01

LABEL Name="senzing/test" \
      Maintainer="support@senzing.com" \
      Version="1.0.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Make directories.

RUN mkdir -p /opt/senzing

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

WORKDIR /app
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["/app/sleep-infinity.sh"]
