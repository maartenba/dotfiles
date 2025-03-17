#!/bin/sh

echo "Backing up files..."

ROOT_DIR=/Users/maartenba

tar -czf files.tar --exclude "node_modules" \
  "$ROOT_DIR/Desktop" \
  "$ROOT_DIR/Library/Application Support/JetBrains/Rider2024.3/options/recentSolutions.xml" \
  "$ROOT_DIR/Library/Containers/com.utmapp.UTM/Data/Documents" \
  "$ROOT_DIR/Projects"

  # tar -xzvf files.tar