#!/bin/bash
path=$(head -n 1 config)
cd "$path"
git reset --hard
git pull
./bin/license.sh; # accept license agreement
cp ./lib/libsnsr.a ../../ext/lib/
cp ./include/snsr.h ../../ext/include/
cp ./models/*.snsr ../../ext/resources/
cp ./models/spot-alexa-rpi-31000.snsr ../../ext/resources/spot-alexa-rpi.snsr
cd ../../src
make
./wakeWordAgent -e sensory

