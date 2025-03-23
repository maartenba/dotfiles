#!/bin/bash

set -e

usage() {
    echo "Usage: $(basename "$0") [-v] volume_name archive"
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
ARCHIVE="$2"

echo "Restoring $VOLUME from $ARCHIVE"
podman run --rm -v $(dirname "$ARCHIVE"):/from -v "$VOLUME":/to alpine tar xz${v}f /from/$(basename "$ARCHIVE") -C /to .
echo "Done."