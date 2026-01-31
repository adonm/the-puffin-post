#!/bin/bash
set -e

mkdir -p dist

echo 'Compiling story.ink...'
inklecate -o dist/story.json story.ink

echo 'Compiling scene files...'
for f in scenes/*.ink; do
  if [ -f "$f" ]; then
    name=$(basename "$f" .ink)
    echo "Compiling scenes/$name.ink..."
    inklecate -o "dist/$name.json" "$f" || echo "Warning: Failed to compile $f"
  fi
done

echo 'Build complete!'
ls -la dist/