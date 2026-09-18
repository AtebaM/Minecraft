FROM eclipse-temurin:21-jre-alpine

# 1. Install necessary packages
RUN apk add --no-cache curl wget bash

# 2. Working directory for Minecraft server files
WORKDIR /data

# 3. Environment variables for RAM allocation
ENV MIN_RAM="1024M"
ENV MAX_RAM="2048M"

# 4. Direct link to the actual server.jar file
RUN wget -O server.jar https://meta.fabricmc.net/v2/versions/loader/1.20.4/0.15.7/1.0.0/server/jar

# 5. Acceptance of the EULA
RUN echo "eula=true" > eula.txt

# 6. Default internal port for Minecraft (25565)
EXPOSE 25565

# 7. Launch command
CMD java -Xms${MIN_RAM} -Xmx${MAX_RAM} -jar server.jar nogui