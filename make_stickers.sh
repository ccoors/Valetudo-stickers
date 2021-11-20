#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

mkdir -p stickers_512

for trace in traced/*.png; do
    t=$(basename -s .png "${trace}")
    out="stickers_512/${t}.png"
    convert "$trace" -scale 512x512 "$out"
    exiftool -all= "$out"
    optipng -o7 "$out"
    if [ -f "${out}_original" ]; then
        rm "${out}_original"
    fi
done
