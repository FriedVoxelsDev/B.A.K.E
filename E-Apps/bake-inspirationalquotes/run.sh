#!/usr/bin/env bash

set -e

cd -- "$(dirname -- "$0")"

trap 'kill $(jobs -p) 2>/dev/null' EXIT INT TERM # stops all foreground & background processes

lua ./src/main.lua & #runs main.lua when run.sh is ran
lua ./src/emulator.lua # runs emulator.lua when run.sh is ran
