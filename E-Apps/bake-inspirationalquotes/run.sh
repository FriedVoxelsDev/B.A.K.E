#!/usr/bin/env bash

#-----------------------------------------------------------------------------------------------------------------------------

set -e

cd -- "$(dirname -- "$0")"

trap 'kill $(jobs -p) 2>/dev/null || true' EXIT INT TERM # stops all foreground & background processes

#-----------------------------------------------------------------------------------------------------------------------------

if command -v fbink >/dev/null 2>&1; then #checks if fbink exists
    kindle_exists=1 lua ./src/main.lua #runs main.lua when run.sh is ran & defines the kindle's existence with the kindle_exists state
else
    lua ./src/main.lua & #runs main.lua when run.sh is ran
    lua ./src/emulator.lua # runs emulator.lua when run.sh is ran
fi

#-----------------------------------------------------------------------------------------------------------------------------
