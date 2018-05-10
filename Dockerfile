ARG ALPINE_VER=3.7
FROM alpine:${ALPINE_VER}

MAINTAINER Tony Apuzzo <tonyapuzzo@yahoo.com>
LABEL Description="Raspberry Pi Eclipse Mosquitto MQTT Broker"

ARG MOSQUITTO_VER=1.4.15-r0
RUN apk --no-cache add mosquitto="${MOSQUITTO_VER}" && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
