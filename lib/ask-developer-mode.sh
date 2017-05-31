#!/bin/sh

echo "Please enable developer mode on the device"
echo "this is located in system-settings → About → Developer Mode"
echo ""
echo "Please confirm the pairing dialog on the device"
echo ""
sleep 1
echo -n "Did you enable developer mode ? [Y] "; read developermode
if [ "$developermode"==Y -o "$developermode"==y -o "$developermode"=="" ]; then
  clear
  echo ""
  echo "Detecting device"
  echo ""
  sleep 1
  adb devices > /tmp/AttachedDevices
fi

