#!/bin/bash
clear
echo ""
echo "Checking for newer version"
echo ""
sleep 1
git pull > version
if grep 'Already up-to-date' version
    then
      echo ""
      echo "You are running the latest version of magic-device-tool."
      sleep 1
    else
      exit | ./launcher.sh
        fi
        rm -f version

sleep 1

if [ $(dpkg-query -W -f='${Status}' phablet-tools 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo ""
  echo "First we have to install the necessary tools:"
  echo ""
  echo "  → phablet-tools"
  echo ""
  sudo add-apt-repository -y ppa:ubuntu-sdk-team/ppa
  sudo apt-get -qq update
  sudo apt-get -qq -y install phablet-tools;
fi

if [ $(dpkg-query -W -f='${Status}' ubuntu-device-flash 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo ""
  echo "First we have to install the necessary tools:"
  echo ""
  echo "  → ubuntu-device-flash"
  echo ""
  sudo add-apt-repository -y ppa:ubuntu-sdk-team/ppa
  sudo apt-get -qq update
  sudo apt-get -qq -y install ubuntu-device-flash;
fi

if [ $(dpkg-query -W -f='${Status}' android-tools-fastboot 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo ""
  echo "First we have to install the necessary tools:"
  echo ""
  echo "  → android-tools-fastboot"
  echo ""
  sudo apt-get -qq -y install android-tools-fastboot;
fi

if [ $(dpkg-query -W -f='${Status}' android-tools-adb 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo ""
  echo "First we have to install the necessary tools:"
  echo ""
  echo "  → android-tools-adb"
  echo ""
  sudo apt-get install -qq -y android-tools-adb;
fi

if [ $(dpkg-query -W -f='${Status}' mplayer 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo ""
  echo "First we have to install the necessary tools:"
  echo ""
  echo "  → mplayer"
  echo ""
  sudo apt-get install -qq -y mplayer;
fi

clear
echo ""
echo "Choose your device"
echo ""
echo "  [1]  BQ Aquaris E4.5 - krillin"
echo "  [2]  BQ Aquaris E5 HD - vegetahd"
echo "  [3]  BQ Aquaris M10 HD - cooler"
echo "  [4]  BQ Aquaris M10 FHD - frieza"
echo "  [5]  Meizu MX 4 - arale"
echo "  [6]  Meizu Pro 5 - turbo"
echo "  [7]  LG Nexus 4 - mako"
echo "  [8]  LG Nexus 5 - hammerhead"
echo "  [9]  Asus Nexus 7 2013 (WiFi) - flo"
echo "  [10] Asus Nexus 7 2013 (LTE) - deb"
echo "  [11] Samsung Nexus 10 - manta"
echo "  [12] OnePlus One - bacon"
echo "  [13] Fairphone 2 - FP2"
echo ""
echo ""
echo "  [14]  Quit"
echo ""
sleep 1
echo -n "Enter device number: "; read device
if [ "$device" = "1" ]; then
  . ./devices/e45/e45.sh
elif [ "$device" = "2" ]; then
  . ./devices/e5hd/e5hd.sh
elif [ "$device" = "3" ]; then
  . ./devices/m10hd/m10hd.sh
elif [ "$device" = "4" ]; then
  . ./devices/m10fhd/m10fhd.sh
elif [ "$device" = "5" ]; then
  . ./devices/mx4/mx4.sh
elif [ "$device" = "6" ]; then
  . ./devices/pro5/pro5.sh
elif [ "$device" = "7" ]; then
  . ./devices/nexus4/nexus4.sh
elif [ "$device" = "8" ]; then
  . ./devices/nexus5/nexus5.sh
elif [ "$device" = "9" ]; then
  . ./devices/nexus7/nexus7.sh
elif [ "$device" = "10" ]; then
  . ./devices/nexus7deb/nexus7.sh
elif [ "$device" = "11" ]; then
  . ./devices/nexus10/nexus10.sh
elif [ "$device" = "12" ]; then
  . ./devices/oneplusone/oneplusone.sh
elif [ "$device" = "13" ]; then
  . ./devices/fairphone2/fairphone2.sh
elif [ "$device" = "14" ]; then
  exit
else
  echo ""
  echo "You did not enter a number between 1 and 14."
  echo "Well... I'll be here during the whole next test. -GLaDOS"
fi
