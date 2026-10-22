#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
volumes=${BIBL_VOLUMES:-"$root/build/volumes"}
if [ ! -f "$volumes/2068" ] || [ ! -f "$volumes/2048" ] || [ ! -f "$volumes/2060" ]; then
    python3 "$root/tools/build-volumes.py" --output "$volumes"
fi
run_home="$root/build/home"
mkdir -p "$run_home"
{ printf 'арх библ,40,100\nбибл\n'; cat; } |
    HOME="$run_home" "${DISPAK:-dispak}" --725 --path="$volumes:/usr/local/share/besm6" -q "$@" "$root/bibl.b6"
