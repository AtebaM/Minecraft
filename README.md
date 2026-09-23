# Custom Minecraft Server Container

This project provides a fully containerized setup to run a custom Minecraft Java Edition server using Docker and Docker Compose. 

The primary goal of this repository is to offer a minimal, reliable, and persistent game server deployment without relying on pre-packaged third-party Minecraft images. It compiles a clean Java runtime environment, automatically retrieves the official server executable, handles EULA compliance via environment variables, and persists all game states.

## Table of Contents
- [Description](#description)
- [Repository Content](#repository-content)
- [Quickstart](#quickstart)
- [Usage](#usage)




## Quickstart

### Prerequisites
Before running the server, ensure you have the following installed on your host system:
* [Docker Engine](https://docs.docker.com/get-docker/) (v20.10.0 or higher)
* [Docker Compose](https://docs.docker.com/compose/install/) (v2.0.0 or higher)

### Starting the Server
1. Clone this repository to your machine or Cloud VM:
   ```bash
   git clone `https://github.com/AtebaM/Minecraft.git`
   cd `Minecraft`

2. Ensure you have python installed

   sudo apt update && sudo apt install -y python3-pip

2. Ensure entrypoint.sh is executable

   chmod +x entrypoint.sh

3. Build and launch the container

   docker compose up -d --build

4. Verify container status
   
   docker ps


5. Monitor startup logs

   docker logs -f minecraft_server

## Usage

This section details how to configure, customize, and manage the Minecraft server container.

## Repository Content
Every file included in this repository serves a specific purpose:

* **`.gitignore`**: Defines patterns to exclude local data directories, environment files, and temporary logs from Git tracking.
* **`Dockerfile`**: Configures the base Java environment (`eclipse-temurin:21-jre-alpine`), installs system dependencies, downloads the official Minecraft server JAR, and defines default environment variables.
* **`entrypoint.sh`**: A shell script executed at container startup that dynamically generates the EULA configuration and initiates the Minecraft server process.
* **`docker-compose.yaml`**: Orchestrates the `mc-server` service, managing port forwarding, environment variables, restart policies, and persistent storage volumes.
* **`README.md`**: Project documentation providing setup instructions, technical details, and usage guides.
* **`.dockerignore`**: Prevents unnecessary files and directories from being sent to the Docker build context.
* **`.env.example`**: Template listing all required environment variables without exposing sensitive values or IP addresses.
* **`CHECKLIST.md`**: Formal compliance document verifying all project evaluation requirements.
* **`test_server.py`**: Python verification script utilizing the `mcstatus` library to test external server connectivity over port 8888.

---


### Environment Variables

1. Create your environment configuration file from the template `` .env.example ``
2. Build and launch the container in detached mode

The server behavior is controlled by environment variables defined in your `.env` file or `docker-compose.yaml`:

| Variable | Default | Description |
| :--- | :--- | :--- |
| `SERVER_ADDRESS` | `YOUR_SERVER_IP_HERE` | The target IP address or hostname used for connectivity checks and server binding. |
| `SERVER_PORT` | `8888` | The external port mapped to the server on the host machine. |
| `SERVER_MIN_RAM` | `1024M` | Initial memory allocation assigned to the Java Virtual Machine (`-Xms`). |
| `SERVER_MAX_RAM` | `2048M` | Maximum memory allocation assigned to the Java Virtual Machine (`-Xmx`). |
| `EULA`           | `TRUE`  | Explicit acceptance of the End User License Agreement (must be set to `true` to start the server). |


3. Modifying Performance (RAM)
To scale server performance for a larger player base, adjust the RAM limits inside your .env file:

`SERVER_MIN_RAM=2048M`
`SERVER_MAX_RAM=4096M`

4. Modifying Server Ports

To run multiple Minecraft instances or avoid port collisions on your host machine, change ``SERVER_PORT`` in .env

`SERVER_PORT=25565`

After editing .env, restart the container setup:

`docker compose up -d --build`

