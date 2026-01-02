This repo is heavily inspired by https://github.com/idukkigold/media-server, I only made smaller changes to fit my use

# Media Server Setup

This repository contains the configuration files for setting up a media server using Docker Compose. The services included are:

- AirVPN (Gluetun)
- qBittorrent
- Radarr
- Sonarr
- Prowlarr
- Bazarr
- Emby

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone this repository to your local machine.
2. Navigate to the repository directory.
3. Create a `.env` file with your AirVPN credentials and other necessary environment variables. You can obtain the AirVPN wireguard config from their portal after logging in. If you wish to use a different VPN provider, check out gluetun docs
4. Run the script `make_dirs.sh` to create the needed directories
5. If using a different PUID, PGID from your own, run:
  ```bash
  source .env && sudo chmod sudo chown -R "$PUID":"$PGID" "$DATA_DIRECTORY"
  ```
6. Run the following command to start the services:
  ```bash
  docker-compose up -d
  ```
7. Now that you have the services running, you need to configure them. The basic idea is this:  
    1. set up qBittorrent auth (if no password is read from configs, qbittorrent creates a single use password - get it using `docker logs qBittorrent` and change it in the ui to something you will remember)
    2. configure Prowlarr with your trackers (you need a token from Sonarr and Radarr for this)
    3. for configuring quality profiles, I used https://trash-guides.info/. Adjust to your liking.
    4. Set up language profiles on Bazarr (don't forget to set some profile as default)
    5. Create the media libraries in emby


## Volumes

It is best to use a single volume for mounting all the data. That way stuff downloaded by your torrent client is used by emby directly - using hardlinks instead of multiple files. This is how the repo is configured - just set up the path to the root directory and you're all set.

## Networking

qBittorrent runs in its own isolated network behind a VPN. All the other services use host networking

## Ports

The following ports are exposed for the web UIs of the services:

- qBittorrent: `8080` (only available on host machine)
- Radarr: `7878`
- Sonarr: `8989`
- Prowlarr: `9696`
- Bazarr: `6767`
- emby: `8096`


## Restart Policy

All services are configured to restart unless stopped.

## License

This project is licensed under the MIT License.
