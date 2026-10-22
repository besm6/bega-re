#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
volumes=${BEGA_VOLUMES:-"$root/build/bega/volumes"}
if [ ! -f "$volumes/2068" ]; then
    python3 "$root/tools/build-bega-volumes.py" --output "$volumes"
elif [ ! -f "$volumes/kalah.bin" ]; then
    python3 "$root/tools/build-bega-volumes.py" --output "$volumes" --upgrade
fi
run_home="$root/build/bega/home"
mkdir -p "$run_home"
{ printf 'арх игра,40,100\nигра\n'; cat; } |
    HOME="$run_home" "${DISPAK:-dispak}" --725 --path="$volumes:/usr/local/share/besm6" -q "$@" "$root/bega.b6"
