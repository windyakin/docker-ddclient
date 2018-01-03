#!/bin/bash -xe

# docker-ddclient / entrypoint.sh
# Copyright (c) 2018 windyakin
# Based on Copyright (c) 2017 Denis Gladkikh (https://github.com/outcoldman/docker-ddclient)
# Licensed under MIT

if [ "$1" = "start-service" ]; then
  cat << _CONFIG_ > /etc/ddclient/ddclient.conf
syslog=yes
foreground=yes
verbose=${DDCLIENT_VERBOSE:-yes}
daemon=${DDCLIENT_DAEMON:-1800}

ssl=${DDCLIENT_SSL:-yes}
use=${DDCLIENT_USE:-web}
zone=${DDCLIENT_ZONE:?'DDCLIENT_ZONE is required'}
protocol=${DDCLIENT_PROTOCOL:?'DDCLIENT_PROTOCOL is required'}
server=${DDCLIENT_SERVER:?'DDCLIENT_SERVER is required'}
login=${DDCLIENT_LOGIN:?'DDCLIENT_LOGIN is required'}
password=${DDCLIENT_PASSWORD:?'DDCLIENT_PASSWORD is required'}
${DDCLIENT_HOST?'DDCLIENT_HOST is required'}
_CONFIG_
  ddclient
else
  "$@"
fi
