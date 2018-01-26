#!/bin/bash
chmod +x . ./devices/mx4/ubuntu/*.sh
chmod +x . ./devices/mx4/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Meizu MX4 - arale"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo "[2] Install OpenStore"
echo ""
echo "[3]  Back Up your UBports device"
echo ""
echo "[4] Screencast"
echo ""
echo ""
echo "Android: "
echo ""
echo "[5] Install Cyanogenmod 13"
echo "[6] Install Cyanogenmod 13 without Gapps"
echo ""
echo "[7] Fix local storage issue"
echo ""
echo "[8] Back Up your Android device"
echo ""
echo "[0] Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/mx4/ubuntu/ubuntu.sh
;;
2)
  . ./devices/generic/ubuntu/openstore.sh
;;
3)
  . ./devices/generic/ubuntu/ubports-backup.sh
;;
4)
  . ./devices/mx4/ubuntu/screencast.sh
;;
5)
  . ./devices/mx4/android/cyanogenmod.sh
;;
6)
  . ./devices/mx4/android/cyanogenmodwogapps.sh
;;
7)
  . ./devices/mx4/android/storagefix.sh
;;
8)
  . ./devices/generic/android/backup.sh
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

