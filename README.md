# Custom Minecraft Server Container

## Table of Contents
- [Description](#description)
- [Repository Content](#repository-content)
- [Quickstart](#quickstart)


---

## Description
This project provides a fully containerized setup to run a custom Minecraft Java Edition server using Docker and Docker Compose. 

The primary goal of this repository is to offer a minimal, reliable, and persistent game server deployment without relying on pre-packaged third-party Minecraft images. It compiles a clean Java runtime environment, automatically retrieves the official server executable, handles EULA compliance via environment variables, and persists all game states.

---

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

## Quickstart

### Prerequisites
Before running the server, ensure you have the following installed on your host system:
* [Docker Engine](https://docs.docker.com/get-docker/) (v20.10.0 or higher)
* [Docker Compose](https://docs.docker.com/compose/install/) (v2.0.0 or higher)

### Starting the Server
1. Clone this repository to your machine or Cloud VM:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
