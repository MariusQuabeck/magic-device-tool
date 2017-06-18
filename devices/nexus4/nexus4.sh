#!/bin/bash
chmod +x . ./devices/nexus4/ubuntu/*.sh
chmod +x . ./devices/nexus4/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Nexus 4 - mako"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1]  Install Ubuntu"
echo "[2]  Install OpenStore"
echo ""
echo "[3]  Back Up your UBports device"
echo ""
echo "[4] Screencast"
echo ""
echo ""
echo "Android: "
echo ""
echo "[5]  Install LineageOS 14.1 "
echo "[6]  Install LineageOS 14.1 without Gapps"
echo "[7]  Install Sailfish OS"
echo "[8]  Install Factory Image"
echo "[9]  Install TWRP recovery"
echo "[10]  Back Up your Android device"
echo ""
echo "[11] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[0] Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/nexus4/ubuntu/ubuntu.sh
;;
2)
  . ./devices/generic/ubuntu/openstore.sh
;;
3)
  . ./devices/generic/ubuntu/ubports-backup.sh
;;
4)
  . ./devices/nexus4/ubuntu/screencast.sh
;;
5)
  . ./devices/nexus4/android/lineageos.sh
;;
6)
  . ./devices/nexus4/android/lineageoswogapps.sh
;;
7)
  . ./devices/nexus4/android/sailfishos.sh
;;
8)
  . ./devices/nexus4/android/factoryimage.sh
;;
9)
  . ./devices/nexus4/android/twrp.sh
;;
10)
  . ./devices/generic/android/backup.sh
;;
11)
  . ./devices/nexus4/android/bootloader.sh
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

