set -e

cd -- "$(dirname -- "$0")"

if command -v kterm &> /dev/null; then #Checks if kterm is installed

    kterm -e "./bin/lua ./src/main.lua"  # if it is, runs on kindle

else

    lua ./src/main.lua # if it isn't, runs on lua

fi
