#!/bin/bash

echo 'Checking story.ink...'
inklecate -c story.ink

for f in scenes/*.ink; do
  if [ -f "$f" ]; then
    echo "Checking $f..."
    inklecate -c "$f" || echo "Warning: $f has issues"
  fi
done

echo 'Syntax check complete!'