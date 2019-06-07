#!/usr/bin/env bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
echo "Setting up wifi connection. Connect to the PFC_EDU-${RESIN_DEVICE_NAME_AT_INIT} access point"
./scripts/run.sh

sleep infinity
