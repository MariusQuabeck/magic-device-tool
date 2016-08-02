#!/bin/bash
chmod +x . ./devices/mx4/ubuntu/*.sh
clear
echo ""
echo "Meizu MX4 - arale"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo ""
echo "[2] Screencast"
echo ""
echo "[3] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/mx4/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./devices/mx4/ubuntu/screencast.sh
elif [ "$option" = "3" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
