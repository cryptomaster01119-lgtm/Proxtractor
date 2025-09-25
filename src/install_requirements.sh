#!/bin/bash

SCRIPT="main.py"
if [ ! -f "$SCRIPT" ]; then
    echo "Python script $SCRIPT not found!"
    exit 1
fi

python3 -m pip install --upgrade pip

deps=$(grep -E '^\s*import |^\s*from ' "$SCRIPT" | \
       sed -E 's/^\s*(import|from)\s+([a-zA-Z0-9_]+).*/\2/' | \
       sort -u)

for pkg in $deps; do
    echo "Installing $pkg..."
    python3 -m pip install "$pkg"
done

echo "All dependencies installed!"
