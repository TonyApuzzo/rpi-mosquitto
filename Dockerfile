FROM alpine:3.6
MAINTAINER Tony Apuzzo <tonyapuzzo@yahoo.com>

LABEL Description="Raspberry Pi Eclipse Mosquitto MQTT Broker"

ARG VERSION=1.4.15-r0

RUN apk --no-cache add mosquitto="${VERSION}" && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
