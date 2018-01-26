#!/bin/bash
. tools/color.sh
. tools/settings.sh

clear
exists()
{
  command -v "$1" >/dev/null 2>&1
}

function check_and_install {
echo -n "  → $1: "
if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo_yellow "not found, installing..."
  if [[ ! -z $2 ]]
  then
    echo "Adding necessary apt repository: $2"
    sudo add-apt-repository -y ppa:ubuntu-sdk-team/ppa
    sudo apt-get -qq update
  fi
  sudo apt-get -qq -y install $1;
else
  echo_green "found"
fi

}

if exists dpkg-query; then
echo ""
echo "Checking for newer version"
echo ""
echo ""
echo "If you see this screen for longer than 10 seconds,"
echo "please delete the magic-device-tool folder and clone the project again."
echo ""
echo "If you are one of these people who don't read instructions or README files"
echo "and who downloaded this tool as a zip from GitHub instead of cloning it..."
echo ""
echo_yellow "RTFM ;)"
sleep 1
git fetch
if [ $(git rev-parse HEAD) == $(git rev-parse @{u}) ]
    then
      echo ""
      echo_green "You are running the latest version of magic-device-tool."
      sleep 1
    else
      echo_red "End of the show."
      exit | ./launcher.sh
    fi

sleep 1

echo ""
echo "Checking if all necessary tools are installed locally..."
echo ""
command -v add-apt-repository > /dev/null 2>&1 || check_and_install software-properties-common
check_and_install phablet-tools ppa:ubuntu-sdk-team/ppa
check_and_install ubuntu-device-flash ppa:ubuntu-sdk-team/ppa
check_and_install android-tools-fastboot
check_and_install android-tools-adb
check_and_install mplayer
check_and_install tar
check_and_install unzip
sleep 2
else
  echo ""
  cd $SNAP/
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
echo "  [11] Asus Nexus 7 2012 (3G) - tilapia"
echo "  [12] Samsung Nexus 10 - manta"
echo "  [13] OnePlus One - bacon"
echo "  [14] Fairphone 2 - FP2"
echo "  ========================================="
echo "  [15] Donate"
echo "  [16] Join Telegram Group Chat"
echo "  [17] Report a bug"
echo ""
echo "  [18] Quit"
echo ""
sleep 1
echo -n "Enter number: "; read device
case "$device" in
  1)
  . ./devices/e45/e45.sh
  ;;
  2)
  . ./devices/e5hd/e5hd.sh
  ;;
  3)
  . ./devices/m10hd/m10hd.sh
  ;;
  4)
  . ./devices/m10fhd/m10fhd.sh
  ;;
  5)
  . ./devices/mx4/mx4.sh
  ;;
  6)
  . ./devices/pro5/pro5.sh
  ;;
  7)
  . ./devices/nexus4/nexus4.sh
  ;;
  8)
  . ./devices/nexus5/nexus5.sh
  ;;
  9)
  . ./devices/nexus7/nexus7.sh
  ;;
  10)
  . ./devices/nexus7deb/nexus7.sh
  ;;
  11)
  . ./devices/nexus7tilapia/nexus7.sh
  ;;
  12)
  . ./devices/nexus10/nexus10.sh
  ;;
  13)
  . ./devices/oneplusone/oneplusone.sh
  ;;
  14)
  . ./devices/fairphone2/fairphone2.sh
  ;;
  15)
  . ./devices/generic/donate.sh
  ;;
  16)
  . ./devices/generic/telegram.sh
  ;;
  17)
  . ./devices/generic/reportabug.sh
  ;;
  18)
  exit
  ;;
  *)
  echo ""
  echo_yellow "You did not enter a number between 1 and 18."
  echo_yellow "Well... I'll be here during the whole next test. -GLaDOS"
  ;;
esac
