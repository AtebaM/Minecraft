import sys
from mcstatus import JavaServer

SERVER_ADDRESS = "127.0.0.1"
SERVER_PORT = 8888

def test_minecraft_server(address, port):
    try:
        server = JavaServer.lookup(f"{address}:{port}")
        status = server.status()
        print(f"The server has {status.players.online} players and replied in {status.latency} ms")
    except Exception as e:
        print(f"Failed to connect to the Minecraft server: {e}")

if __name__ == "__main__":
    test_minecraft_server(SERVER_ADDRESS, SERVER_PORT)