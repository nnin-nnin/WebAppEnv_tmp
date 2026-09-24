#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
cd "$DIR"

echo "Loading local images..."
for img in image/*.tar; do
  if [ -f "$img" ]; then
    echo "Loading $img..."
    docker load -i "$img"
  fi
done
echo "All images loaded."
