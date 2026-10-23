#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
volumes=${JINN_VOLUMES:-"$root/build/jinn/volumes"}
if [ ! -f "$volumes/2068" ]; then
    python3 "$root/tools/build-jinn-volumes.py" --output "$volumes"
fi
python3 "$root/tools/build-jinn-volumes.py" --output "$volumes" --refresh-monitor
run_home="$root/build/jinn/home"
mkdir -p "$run_home"
HOME="$run_home" exec python3 "$root/tools/run-session.py" диал \
    "${DISPAK:-dispak}" --725 --path="$volumes:/usr/local/share/besm6" -q "$@" "$root/jinn.b6"
