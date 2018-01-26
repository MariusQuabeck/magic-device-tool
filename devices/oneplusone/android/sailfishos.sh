clear
echo ""
echo "Installing Sailfish OS"
echo ""
sleep 1
echo "Please boot your Oneplus One into bootloader/fastboot mode by pressing Power & Volume Up (+)"
echo ""
sleep 1
echo -n "Is your Oneplus One in bootloader/fastboot mode now? [Y] "; read bootloadermode
if [ "$bootloadermode"==Y -o "$bootloadermode"==y -o "$bootloadermode"=="" ]; then
  clear
  echo ""
  echo "Detecting device"
  echo ""
  sleep 1
  fastboot devices > /tmp/AttachedDevices
fi
if grep 'device$\|fastboot$' /tmp/AttachedDevices
then
  echo "Device detected !"
  sleep 1
  clear
  fastboot format cache
  fastboot format userdata
  fastboot reboot-bootloader
  sleep 6
  clear
  echo ""
  echo "Downloading TWRP recovery"
  echo ""
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/recoverys/twrp-bacon.img
  sleep 1
  echo ""
  echo "Downloading Cyanogenmod 12 .."
  echo "needed for SFOS"
  echo ""
  sleep 1
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/cyanogenmod/cm-12.1-20151117-SNAPSHOT-YOG7DAO1K6-bacon.zip
  echo ""
  echo "Downloading Sailfish OS.."
  echo ""
  sleep 1
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://images.devaamo.fi/sfa/bacon/vgrade7/sailfishos-bacon-release-2.0.0.10-vgrade7.zip
  sleep 2
  clear
  echo ""
  echo "Installing TWRP recovery"
  echo ""
  fastboot flash recovery $HOME/.cache/magic-device-tool/twrp-bacon.img
  sleep 1
  echo ""
  echo "Rebooting device.."
  echo ""
  echo "This will take ~35 seconds. Don't disconnect your device!"
  echo ""
  fastboot reboot-bootloader
  sleep 7
  fastboot boot $HOME/.cache/magic-device-tool/twrp-bacon.img
  sleep 20
  adb reboot recovery
  sleep 20
  echo ""
  clear
  echo ""
  echo "Pushing zip's to device"
  sleep 1
  echo ""
  echo "Please wait this can take a while"
  echo ""
  echo "You may see a prompt asking you for read/write permissions"
  echo "Ignore that prompt, the tool will take care of the installation"
  echo ""
  echo "  → CM 12 zip"
  adb push -p $HOME/.cache/magic-device-tool/cm-12.1-20151117-SNAPSHOT-YOG7DAO1K6-bacon.zip /sdcard/
  echo ""
  echo "  → Sailfish OS zip"
  adb push -p $HOME/.cache/magic-device-tool/sailfishos-bacon-release-2.0.0.10-vgrade7.zip /sdcard/
  echo ""
  echo "========================================="
  sleep 1
  echo ""
  echo "Installing Cyanogenmod.."
  echo ""
  adb shell twrp install /sdcard/cm-12.1-20151117-SNAPSHOT-YOG7DAO1K6-bacon.zip
  sleep 1
  echo ""
  echo "Installing Sailfish OS.."
  echo ""
  sleep 3
  adb shell twrp install /sdcard/sailfishos-bacon-release-2.0.0.10-vgrade7.zip
  echo ""
  echo "Wipe cache.."
  echo ""
  adb shell twrp wipe cache
  adb shell twrp wipe dalvik
  echo ""
  adb reboot
  echo "The device is now rebooting. Give it time to flash the new ROM. It will boot on its own."
  echo ""
  sleep 5
  echo ""
  echo "Cleaning up.."
  rm -f /tmp/AttachedDevices
  echo ""
  sleep 1
  echo "Exiting magic-device-tool. Bye Bye"
  sleep 1

else
  echo "Device not found"
  rm -f /tmp/AttachedDevices
  sleep 1
  echo ""
  echo "Back to menu"
  sleep 1
  . ./launcher.sh
fi
