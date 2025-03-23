#!/bin/bash

set -e

usage() {
    echo "Usage: $(basename "$0") [-v] volume_name backup_dir"
}

v=""
while getopts "hv" o; do
    case "$o" in
        h) usage; exit 0 ;;
        v) v="v" ;;
        *) usage >&2; exit 1 ;;
    esac
done
shift $((OPTIND-1))

if [ $# -ne 2 ]; then
    usage >&2
    exit 1
fi

VOLUME="$1"
ARCHIVE="$2/$VOLUME.tar.gz"

echo "Backing up $VOLUME to $ARCHIVE"
mkdir -p $(dirname "$ARCHIVE")
podman run --rm -v "$VOLUME":/from -v $(dirname "$ARCHIVE"):/to alpine tar cz${v}f /to/$(basename "$ARCHIVE") -C /from .
echo "Done."