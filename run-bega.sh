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
HOME="$run_home" exec python3 "$root/tools/run-session.py" игра \
    "${DISPAK:-dispak}" --725 --path="$volumes:/usr/local/share/besm6" -q "$@" "$root/bega.b6"
