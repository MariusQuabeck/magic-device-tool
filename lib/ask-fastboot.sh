#!/bin/sh
# The script require two parameter:
# 	$1 is the name of the smartphone, ex. E5 HD
#	$2 is the sequence of the buttons, ex. Power & Volume Up (+)
echo "Please boot your $1 into bootloader/fastboot mode by pressing $2"
echo "and select fastboot mode"
echo ""
sleep 1
echo -n "Is your $1 in bootloader/fastboot mode now? [Y] "; read bootloadermode
if [ "$bootloadermode"==Y -o "$bootloadermode"==y -o "$bootloadermode"=="" ]; then
  clear
  echo ""
  echo "Detecting device"
  echo ""
  sleep 1
  fastboot devices >/tmp/AttachedDevices
fi

