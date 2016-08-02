#!/bin/bash
chmod +x . ./devices/optimusl90/ubuntu/*.sh
clear
echo ""
echo "LG Optimus L90 - w7"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo ""
echo ""
echo "[2] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/optimusl90/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
