# Media Server Setup

This repository contains the configuration files for setting up a media server using Docker Compose. The services included are:

- NordVPN (Gluetun)
- qBittorrent
- Radarr
- Sonarr
- Lidarr
- Prowlarr
- Overseerr
- Homarr

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone this repository to your local machine.
2. Navigate to the repository directory.
3. Create a `docker.env` file with your NordVPN credentials and other necessary environment variables.
4. Use [NordVPN WireGuard Config Generator](https://github.com/mustafachyi/NordVPN-WireGuard-Config-Generator) to get your WireGuard key from the NordVPN dashboard.
5. Run the provided PowerShell script to create the necessary directories and set permissions:

    ```sh
    .\setup_directories.ps1
    ```
6. Update the file paths in `docker-compose.yml` to match your system's directory structure if needed.
7. Run the following command to start the services:

    ```sh
    docker-compose up -d
    ```

## Volumes

The following volumes are used to persist data:

- `E:\media-server\qbittorrent\config:/config`
- `E:\media-server\downloads:/downloads`
- `E:\media-server\radarr\config:/config`
- `E:\Plex\Movies:/movies`
- `E:\media-server\sonarr\config:/config`
- `E:\Plex\TV:/tv`
- `E:\media-server\lidarr\config:/config`
- `E:\Plex\Music:/music`
- `E:\media-server\prowlarr\config:/config`
- `E:\media-server\overseerr\config:/app/config`
- `E:\media-server\homarr\config:/config`

## Network

A custom bridge network named `vpn` is used to route traffic through the NordVPN container.

## Ports

The following ports are exposed for the web UIs of the services:

- qBittorrent: `8080`
- Radarr: `7878`
- Sonarr: `8989`
- Lidarr: `8686`
- Prowlarr: `9696`
- Overseerr: `5055`
- Homarr: `7575`

## Restart Policy

All services are configured to restart unless stopped.

## License

This project is licensed under the MIT License.
