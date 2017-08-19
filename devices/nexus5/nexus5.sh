#!/bin/bash
chmod +x . ./devices/nexus5/ubuntu/*.sh
chmod +x . ./devices/nexus5/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Nexus 5 - hammerhead"
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
echo ""
echo "Android:"
echo ""
echo "[4]  Install Lineage OS"
echo "[5]  Install Maru OS"
echo "[6]  Install Sailfish OS"
echo "[7]  Install Factory Image"
echo "[8]  Install TWRP recovery"
echo "[9]  Back Up your Android device"
echo ""
echo "[10]  Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[11] Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/nexus5/ubuntu/ubuntu.sh
;;
2)
  . ./devices/generic/ubuntu/openstore.sh
;;
3)
  . ./devices/generic/ubuntu/ubports-backup.sh
;;
4)
  . ./devices/nexus5/android/los.sh
;;
5)
  . ./devices/nexus5/android/maru.sh
;;
6)
  . ./devices/nexus5/android/sailfishos.sh
;;
7)
  . ./devices/nexus5/android/factoryimage.sh
;;
8)
  . ./devices/nexus5/android/twrp.sh
;;
9)
  . ./devices/generic/android/backup.sh
;;
10)
  . ./devices/nexus5/android/bootloader.sh
;;
11)
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

