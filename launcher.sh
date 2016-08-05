#!/bin/bash
clear
echo ""
echo "First we have to install the necessary tools:"
sleep 1
echo ""
echo "  → android-tools-adb"
echo ""
echo "  → android-tools-fastboot"
echo ""
echo "  → phablet-tools"
echo ""
echo "  → ubuntu-device-flash"
echo ""
echo "  → mplayer"
echo ""
sleep 1
Ubuntu_SDK=ppa:ubuntu-sdk-team/ppa  # the ppa we are adding

if ! grep ^ -q /etc/apt/sources.list.d/ubuntu-sdk-team-ubuntu-ppa-xenial.list; then

  # commands to add the ppa ...
  sudo add-apt-repository -y ppa:ubuntu-sdk-team/ppa
  sudo apt-get -qq update
  sudo apt-get -qq -y install android-tools-adb android-tools-fastboot ubuntu-device-flash phablet-tools
fi

if [ $(dpkg-query -W -f='${Status}' mplayer 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install mplayer;
fi

clear
echo ""
echo "Choose your device"
echo ""
echo "  [1]  LG Nexus 4 - mako"
echo "  [2]  Asus Nexus 7 2013 (WiFi) - flo"
echo "  [3]  BQ Aquaris E4.5 - krillin"
echo "  [4]  BQ Aquaris E5 HD - vegetahd"
echo "  [5]  BQ Aquaris M10 HD - cooler"
echo "  [6]  BQ Aquaris M10 FHD - frieza"
echo "  [7]  Meizu MX 4 - arale"
echo "  [8]  Meizu Pro 5 - turbo"
echo ""
echo ""
echo "UBports devices"
echo ""
echo "  [9]  OnePlus One - bacon"
echo "  [10] Fairphone 2 - FP2"
echo "  [11] LG Nexus 5 - hammerhead"
echo "  [12] Asus Nexus 7 2013 (LTE) - deb"
echo "  [13] Samsung Nexus 10 - manta"
echo ""
echo ""
echo "  [14]  Quit"
echo ""
sleep 1
echo -n "Enter device number: "; read device
if [ "$device" = "1" ]; then
  . ./devices/nexus4/nexus4.sh
elif [ "$device" = "2" ]; then
  . ./devices/nexus7/nexus7.sh
elif [ "$device" = "3" ]; then
  . ./devices/e45/e45.sh
elif [ "$device" = "4" ]; then
  . ./devices/e5hd/e5hd.sh
elif [ "$device" = "5" ]; then
  . ./devices/m10hd/m10hd.sh
elif [ "$device" = "6" ]; then
  . ./devices/m10fhd/m10fhd.sh
elif [ "$device" = "7" ]; then
  . ./devices/mx4/mx4.sh
elif [ "$device" = "8" ]; then
  . ./devices/pro5/pro5.sh
elif [ "$device" = "9" ]; then
  . ./devices/oneplusone/oneplusone.sh
elif [ "$device" = "10" ]; then
  . ./devices/fairphone2/fairphone2.sh
elif [ "$device" = "11" ]; then
  . ./devices/nexus5/nexus5.sh
elif [ "$device" = "12" ]; then
  . ./devices/nexus7deb/nexus7.sh
elif [ "$device" = "13" ]; then
  . ./devices/nexus10/nexus10.sh
elif [ "$device" = "14" ]; then
  exit
else
  echo ""
  echo "You did not enter a number between 1 and 15."
  echo "Well... I'll be here during the whole next test. -GLaDOS"
fi
