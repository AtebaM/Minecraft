#!/bin/bash
set -e

: "${MIN_RAM:=1024M}"
: "${MAX_RAM:=2048M}"

# verify that the EULA has been accepted
if [ "${EULA,,}" = "true" ]; then
    echo "EULA accepted via environment variable."
    echo "eula=true" > eula.txt
else
    echo "ERROR: You must accept the Minecraft EULA to start the server."
    echo "Please set environment variable EULA=true in your docker-compose.yaml."
    exit 1
fi

# execute the command passed to the entrypoint
exec java -Xms"${MIN_RAM}" -Xmx"${MAX_RAM}" -jar server.jar nogui