FROM phusion/baseimage:0.9.19

MAINTAINER Paul Sore <paul.sore@gmail.com>

RUN apt-get update && apt-get install -y \
        wget \
        libdigest-sha-perl \
        dnsmasq

RUN mkdir /opt/hosts
COPY scripts/update.sh /opt/hosts
COPY conf/dnsmasq.conf /etc/dnsmasq.conf
VOLUME ["/etc/dnsmasq.d"]

RUN /bin/bash /opt/hosts/update.sh

ENTRYPOINT ["dnsmasq", "--no-daemon"]
