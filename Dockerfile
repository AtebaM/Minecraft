FROM eclipse-temurin:21-jre-alpine

# 1. Installation of necessary packages (curl, wget, bash)
RUN apk add --no-cache curl wget bash

# 2. working directory for the Minecraft server data
WORKDIR /data

# 3. Copy the entrypoint script into the container and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 4. Default environment variables
ENV MIN_RAM="1024M"
ENV MAX_RAM="2048M"
ENV EULA="false"

# 5. Download the server.jar file
COPY server.jar server.jar

# 6. Default internal port for Minecraft
EXPOSE 25565

# 7. Definition of the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# 8. Default command passed to the entrypoint script
CMD ["sh", "-c", "java -Xms${MIN_RAM} -Xmx${MAX_RAM} -jar server.jar nogui"]