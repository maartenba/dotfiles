#!/bin/sh

echo "Backing up files..."

ROOT_DIR=/Users/maartenba

mkdir backup
tar -cf backup/files.tar --exclude "node_modules" \
  "$ROOT_DIR/Desktop" \
  "$ROOT_DIR/Library/Application Support/JetBrains/Rider2024.3/options/recentSolutions.xml" \
  "$ROOT_DIR/Library/Application Support/JetBrains/WebStorm2024.3/options/recentSolutions.xml" \
  "$ROOT_DIR/Library/Containers/com.utmapp.UTM/Data/Documents" \
  "$ROOT_DIR/Projects"

sh podman-backup.sh -v caribou_caribou-azurite-storage ./backup
sh podman-backup.sh -v caribou_caribou-mssql-server-linux ./backup

# sh podman-restore.sh caribou_caribou-azurite-storage ./backup/caribou_caribou-azurite-storage.tar.gz 
# sh podman-restore.sh caribou_caribou-mssql-server-linux ./backup/caribou_caribou-mssql-server-linux.tar.gz 
# tar -xvf files.tar
