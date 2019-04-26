ARG BASE_IMAGE=senzing/senzing-base
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-04-12

LABEL Name="senzing/test" \
      Version="1.0.0"

# XXX

RUN mkdir -p /opt/senzing
RUN mkdir -p /tmp/mjd

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

WORKDIR /app
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["/app/sleep-infinitely.sh"]
