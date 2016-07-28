#!/bin/bash
clear
echo ""
echo "First we have to install the necessary tools:"
sleep 1
chmod +x . ./devices/*.sh
echo ""
echo "- android-tools-adb"
echo ""
echo "- android-tools-fastboot"
echo ""
echo "- phablet-tools"
echo ""
echo "- ubuntu-device-flash"
echo ""
sleep 5
Ubuntu_SDK=ppa:ubuntu-sdk-team/ppa  # the ppa we are adding

if ! grep ^ -q /etc/apt/sources.list.d/ubuntu-sdk-team-ubuntu-ppa-xenial.list; then

    # commands to add the ppa ...
    sudo add-apt-repository -y ppa:ubuntu-sdk-team/ppa
    sudo apt-get -qq update
    sudo apt-get -qq -y install android-tools-adb android-tools-fastboot ubuntu-device-flash phablet-tools
fi

clear
echo ""
echo "Choose your device"
echo ""
echo "[1] Nexus 4 - mako"
echo "[2] Nexus 7 2013 (WiFi) - flo"
echo "[3] BQ Aquaris E4.5 - krillin"
echo "[4] BQ Aquaris E5 HD - vegetahd"
echo "[5] BQ Aquaris M10 HD - cooler"
echo "[6] BQ Aquaris M10 FHD - frieza"
echo "[7] Meizu MX 4 - arale"
echo "[8] Meizu Pro 5 - turbo"
echo ""
sleep 1
echo -n "Enter device number: "; read device
if [ "$device" = "1" ]; then
  . ./devices/nexus4.sh
else
  if [ "$device" = "2" ]; then
    . ./devices/nexus7.sh
  else
    if [ "$device" = "3" ]; then
      . ./devices/e45.sh
    else
      if [ "$device" = "4" ]; then
        . ./devices/e5hd.sh
      else
        if [ "$device" = "5" ]; then
          . ./devices/m10hd.sh
        else
          if [ "$device" = "6" ]; then
            . ./devices/m10fhd.sh
          else
            if [ "$device" = "7" ]; then
              . ./devices/mx4.sh
            else
              if [ "$device" = "8" ]; then
                . ./devices/turbo.sh

              else
                echo "You did not enter a number between 1 and 8."
                echo "Well... I'll be here during the whole next test. -GLaDOS"
              fi
            fi
          fi
        fi
      fi
    fi
  fi
fi
