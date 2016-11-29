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
echo "[3]  Screencast"
echo ""
echo ""
echo "Android: "
echo ""
echo "[4]  Install Cyanogenmod"
echo "[5]  Install Sailfish OS"
echo "[6]  Install Phoenix OS"
echo "[7]  Install Factory Image"
echo "[8]  Install TWRP recovery"
echo "[9]  Back Up your Android device"
echo ""
echo "[10] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[11] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/nexus7/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./devices/generic/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
  . ./devices/nexus7/ubuntu/screencast.sh
elif [ "$option" = "4" ]; then
  . ./devices/nexus7/android/cm.sh
elif [ "$option" = "5" ]; then
  . ./devices/nexus7/android/sailfishos.sh
elif [ "$option" = "6" ]; then
  . ./devices/nexus7/android/phoenixos.sh
elif [ "$option" = "7" ]; then
  . ./devices/nexus7/android/factoryimage.sh
elif [ "$option" = "8" ]; then
  . ./devices/nexus7/android/twrp.sh
elif [ "$option" = "9" ]; then
  . ./devices/generic/android/backup.sh
elif [ "$option" = "10" ]; then
  . ./devices/nexus7/android/bootloader.sh
elif [ "$option" = "11" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
