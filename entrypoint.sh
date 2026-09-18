#!/bin/bash
set -e

# verify that the EULA has been accepted
if [ "${EULA}" = "true" ] || [ "${EULA}" = "TRUE" ]; then
    echo "EULA accepted via environment variable."
    echo "eula=true" > eula.txt
else
    echo "ERROR: You must accept the Minecraft EULA to start the server."
    echo "Please set environment variable EULA=true in your docker-compose.yaml."
    exit 1
fi

# execute the command passed to the entrypoint
exec "$@"