# Project Evaluation Checklist

## 1. Repository
- [x] **`.gitignore` file present:** Properly ignores runtime data (`data/`), log files, temporary files, and `.env`.
- [x] **`docker-compose.yaml` present:** Fully configured according to project specifications.
- [x] **`README.md` present:** Structure and content adhere strictly to evaluation guidelines.
- [x] **No unexplained files:** All files present in the repository (`Dockerfile`, `docker-compose.yaml`, `entrypoint.sh`, `.env.example`, `.dockerignore`, `CHECKLIST.md`, `test_server.py`) are explicitly documented in `README.md`.

## 2. Dockerfile
- [x] **Custom Docker Image:** Assembles a custom Minecraft server environment using `eclipse-temurin:21-jre-alpine` as base image.
- [x] **No pre-built Minecraft image:** Uses raw Java runtime base image and downloads official binaries.
- [x] **Packages & Utilities Installed:** Essential tools (`curl`, `wget`, `bash`) installed via Alpine package manager (`apk`).
- [x] **Default Environment Variables:** Configured with fallback defaults (`MIN_RAM="1024M"`, `MAX_RAM="2048M"`, `EULA="false"`).
- [x] **Entrypoint Script:** Uses `entrypoint.sh` to dynamically evaluate EULA state before starting the server.

## 3. docker-compose.yaml
- [x] **Defined Service:** Service named `mc-server`.
- [x] **Explicit Build Configuration:** Explicitly defines `context: .` and `dockerfile: Dockerfile`.
- [x] **Environment Configuration:** Injects non-sensitive environment variables (`EULA`, `MIN_RAM`, `MAX_RAM`, `SERVER_NAME`).
- [x] **Port Forwarding:** Internal port `25565` exposed externally on port `8888`.
- [x] **Data Persistence:** Uses persistent named Docker volume (`mc-data:/data`) to preserve game progress upon container restarts.
- [x] **Auto-Healing:** Resiliency configured with `restart: always` to recover from unexpected container failures.

## 4. Documentation & Standards
- [x] **Language:** Entire documentation written in English.
- [x] **Table of Contents:** Table of Contents provided at the top of `README.md`.
- [x] **Repository Description:** Explains core purpose and essential components.
- [x] **Quickstart Section:** Concise instructions for prerequisites, cloning, building, and running.
- [x] **Usage Section:** Detailed explanation of configuration options, port mappings, and persistent storage.

## 5. Security & Naming Conventions
- [x] **No Sensitive Data Stored:** No SSH keys, passwords, tokens, IP addresses, or usernames committed to Git.
- [x] **Environment Variables Format:** Uses `UPPER_CASE_WITH_UNDERSCORE` format.
- [x] **Curly Brace Variable Notation:** All variable references use strictly `${VARIABLE_NAME}` notation.
- [x] **Runtime Configuration:** Uses `.env` file (ignored by Git) and provides `.env.example` template.
- [x] **Docker Ignore:** `.dockerignore` file provided to prevent unnecessary files from being sent to Docker daemon.

## 6. Testing & Validation
- [x] **External Connectivity:** Tested and reachable via Cloud VM public IP on port `8888`.
- [x] **Python Verification Script:** Connection tested using `mcstatus` python script.
- [x] **Data Persistence Verified:** World data remains intact after stopping and restarting containers (`docker compose down && docker compose up -d`).
- [x] **Container Restart Policy:** Resiliency verified with `restart: always`.
- [x] **Loom Video:** Recorded short presentation (under 5 minutes) demonstrating build execution, container status, and live server testing.