#!/bin/sh
ADDON_DIR="$HOME/.xbmc/addons/emulators.scummvm"
ADDON_HOME="$HOME/.xbmc/userdata/addon_data/emulators.scummvm"

mkdir -p "/storage/emulators/scummvm/roms"

export LD_LIBRARY_PATH=$ADDON_DIR/bin/

chmod a+rx "$ADDON_DIR/bin/scummvm"
"$ADDON_DIR/bin/scummvm"

sleep 7
killall -STOP xbmc.bin

while [ $(pidof scummvm) ];do
usleep 200000
done;
killall -CONT xbmc.bin
