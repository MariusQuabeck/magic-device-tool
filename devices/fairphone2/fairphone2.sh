#!/bin/bash
chmod +x . ./devices/fairphone2/ubuntu/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
clear
echo ""
echo "Fairphone 2 - FP2"
echo ""
echo "PLEASE START THE SNAP WITH SUDO"
echo "sudo magic-device-tool"
echo ""
echo "Otherwise it wont work!"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo ""
echo "[2] Install OpenStore"
echo ""
echo "[3] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. $SNAP/devices/fairphone2/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
. $SNAP/devices/generic/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
  . $SNAP/launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
