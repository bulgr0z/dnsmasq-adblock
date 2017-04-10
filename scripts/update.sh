#!/bin/bash

HOSTS_REMOTE_FILE=https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
HOSTS_DIR=/opt/hosts
HOSTS_FILE=${HOSTS_DIR}/hosts
DNS_BLACKLIST_FILE=${HOSTS_DIR}/blacklist
HOSTS_CHECKSUM_FILE=${HOSTS_DIR}/checksum

wget -O ${HOSTS_FILE} ${HOSTS_REMOTE_FILE}

checksum=$(shasum ${HOSTS_FILE})

# if StevenBlack host file has changed
if [[ ! -f ${HOSTS_CHECKSUM_FILE} ]] || [[ $(< ${HOSTS_CHECKSUM_FILE}) != "$checksum" ]]; then
    # convert hosts to dnsmasq.conf
    awk '/^[^#]/ {print "address=/"$2"/0.0.0.0"}' ${HOSTS_FILE} > ${DNS_BLACKLIST_FILE}
    #update checksum
    echo ${checksum} > ${HOSTS_CHECKSUM_FILE}
    echo "Updated hosts file in $DNS_BLACKLIST_FILE using latest $HOSTS_REMOTE_FILE"
fi

