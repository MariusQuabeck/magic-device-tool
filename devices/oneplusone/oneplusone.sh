#!/bin/bash
chmod +x . ./devices/oneplusone/ubuntu/*.sh
chmod +x . ./devices/oneplusone/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "OnePlus One - bacon"
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
echo ""
echo "Android: "
echo ""
echo "[4] Install LineageOS 14.1"
echo "[5] Install LineageOS 14.1 without Gapps"
echo ""
echo "[6] Install Sailfish OS"
echo ""
echo "[7] Install TWRP recovery"
echo "[8] Back Up your Android device"
echo "[9] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo ""
echo "[0] Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/oneplusone/ubuntu/ubuntu.sh
;;
2)
  . ./devices/generic/ubuntu/openstore.sh
;;
3)
  . ./devices/generic/ubuntu/ubports-backup.sh
;;
4)
  . ./devices/oneplusone/android/lineageos.sh
;;
5)
  . ./devices/oneplusone/android/lineageoswogapps.sh
;;
6)
  . ./devices/oneplusone/android/sailfishos.sh
;;
7)
  . ./devices/oneplusone/android/twrp.sh
;;
8)
  . ./devices/generic/android/backup.sh
;;
9)
  . ./devices/oneplusone/android/bootloader.sh
;;
0)
  . ./launcher.sh
;;
*)
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
;;
esac
