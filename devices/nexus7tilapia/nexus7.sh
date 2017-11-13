#!/bin/bash
chmod +x . ./devices/nexus7tilapia/ubuntu/*.sh
chmod +x . ./devices/nexus7tilapia/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Nexus 7 2012 3G - tilapia"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1]  Install Ubuntu 13.04 Desktop"
echo ""
echo ""
echo "Android: "
echo ""
echo "[2]  Install Cyanogenmod"
echo ""
echo "[3] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[0] Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/nexus7tilapia/ubuntu/ubuntu.sh
;;
2)
  . ./devices/nexus7tilapia/android/cm.sh
;;
3)
  . ./devices/nexus7tilapia/android/bootloader.sh
;;
0)
  . ./launcher.sh
;;
*)
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting magic-device-tool. Bye Bye"
  exit
;;
esac

