#!/bin/bash

# Source the .env file to load variables
if [ ! -f .env ]; then
  echo "ERROR: .env file not found."
  exit 1
fi

source .env

# Check if DATA_DIRECTORY is set in .env
if [ -z "$DATA_DIRECTORY" ]; then
  echo "ERROR: DATA_DIRECTORY is not set in .env file."
  exit 1
fi

# Define the directory structure
BASE_DIR="$DATA_DIRECTORY"
MEDIA_DIR="$BASE_DIR/media"
MOVIES_DIR="$MEDIA_DIR/movies"
RANDOM_DIR="$MEDIA_DIR/random"
TV_DIR="$MEDIA_DIR/tv"
TORRENTS_DIR="$BASE_DIR/torrents"

mkdir -p "$BASE_DIR" "$MOVIES_DIR" "$RANDOM_DIR" "$TV_DIR" "$TORRENTS_DIR"
