#!/bin/bash
. tools/color.sh
. tools/filesystem.sh

function check_and_install
{
	echo -n "  → $1: "
	if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
		echo_yellow "not found, installing..."
		if [[ ! -z $2 ]]; then
			echo "Adding necessary apt repository: $2"
			sudo add-apt-repository -y ppa:ubuntu-sdk-team/ppa
			sudo apt-get -qq update
		fi
		sudo apt-get -qq -y install $1;
	else
		echo_green "found"
	fi
}

FIRST_RUN=1

clear
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
	exists git || check_and_install git
	git pull > version
	if grep -q 'Already up-to-date' version; then
		echo ""
		echo_green "You are running the latest version of magic-device-tool."
		sleep 1
	else
		echo_red "End of the show."
		exit | ./launcher.sh
	fi
	rm -f version

	sleep 1
	if [ $FIRST_RUN -eq 1 ]; then
		FIRST_RUN=0
		echo ""
		echo "Checking if all necessary tools are installed locally..."
		echo ""
		exists add-apt-repository || check_and_install software-properties-common
		check_and_install phablet-tools ppa:ubuntu-sdk-team/ppa
		check_and_install ubuntu-device-flash ppa:ubuntu-sdk-team/ppa
		check_and_install android-tools-fastboot
		check_and_install android-tools-adb
		check_and_install mplayer
		sleep 1
	else
		echo ""
		cd $SNAP/
	fi
fi

EXIT=0
while [ $EXIT -eq 0 ]; do
	clear
	echo ""
	echo "Choose your device"
	echo ""
	echo "  [1]  BQ Aquaris E4.5 - krillin"
	echo "  [2]  BQ Aquaris E5 HD - vegetahd"
	echo "  [3]  BQ Aquaris M10 HD - cooler"
	echo "  [4]  BQ Aquaris M10 FHD - frieza"
	echo "  [5]  Meizu MX 4 - arale"
	#echo "  [6]  Meizu Pro 5 - turbo" --removed until Marius can get his hands on this device
	echo "  [6]  LG Nexus 4 - mako"
	echo "  [7]  LG Nexus 5 - hammerhead"
	echo "  [8]  Asus Nexus 7 2013 (WiFi) - flo"
	echo "  [9]  Asus Nexus 7 2013 (LTE) - deb"
	echo "  [10] Samsung Nexus 10 - manta"
	echo "  [11] OnePlus One - bacon"
	echo "  [12] Fairphone 2 - FP2"
	echo "  ========================================="
	echo "  [13] Join Telegram Group Chat"
	echo "  [14] Report a bug"
	echo ""
	echo "  [15] Quit"
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
	#  6)
	#   . ./devices/pro5/pro5.sh
	#  ;;
	  6)
	  . ./devices/nexus4/nexus4.sh
	  ;;
	  7)
	  . ./devices/nexus5/nexus5.sh
	  ;;
	  8)
	  . ./devices/nexus7/nexus7.sh
	  ;;
	  9)
	  . ./devices/nexus7deb/nexus7.sh
	  ;;
	  10)
	  . ./devices/nexus10/nexus10.sh
	  ;;
	  11)
	  . ./devices/oneplusone/oneplusone.sh
	  ;;
	  12)
	  . ./devices/fairphone2/fairphone2.sh
	  ;;
	  13)
	  . ./devices/generic/telegram.sh
	  ;;
	  14)
	  . ./devices/generic/reportabug.sh
	  ;;
	  15)
	  echo_green "Thanks for using magic-device-tool!"
	  sleep 1
	  EXIT=1
	  ;; 
	  *)
	  echo ""
	  echo_yellow "You did not enter a number between 1 and 15."
	  echo_yellow "Well... I'll be here during the whole next test. -GLaDOS"
	  sleep 4
	  ;;
	esac
done

