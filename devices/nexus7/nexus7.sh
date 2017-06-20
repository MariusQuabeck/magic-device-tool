#!/bin/bash
chmod +x . ./devices/nexus7/ubuntu/*.sh
chmod +x . ./devices/nexus7/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Nexus 7 2013 WiFi - flo"
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
echo "[4]  Screencast"
echo ""
echo ""
echo "Android: "
echo ""
echo "[5]  Install LineageOS"
echo "[6]  Install Sailfish OS"
echo "[7]  Install Maru OS"
echo "[8]  Install Phoenix OS"
echo "[9]  Install Factory Image"
echo "[10]  Install TWRP recovery"
echo "[11] Back Up your Android device"
echo ""
echo "[12] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[0] Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/nexus7/ubuntu/ubuntu.sh
;;
2)
  . ./devices/generic/ubuntu/openstore.sh
;;
3)
  . ./devices/generic/ubuntu/ubports-backup.sh
;;
4)
  . ./devices/nexus7/ubuntu/screencast.sh
;;
5)
  . ./devices/nexus7/android/los.sh
;;
6)
  . ./devices/nexus7/android/sailfishos.sh
;;
7)
  . ./devices/nexus7/android/maru.sh
;;
8)
  . ./devices/nexus7/android/phoenixos.sh
;;
9)
  . ./devices/nexus7/android/factoryimage.sh
;;
10)
  . ./devices/nexus7/android/twrp.sh
;;
11)
  . ./devices/generic/android/backup.sh
;;
12)
  . ./devices/nexus7/android/bootloader.sh
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

