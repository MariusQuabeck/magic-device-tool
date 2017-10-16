clear
echo ""
echo "Installing LineageOS 14.1"
echo ""
sleep 1
echo "Please boot your Nexus 4 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
echo ""
sleep 1
echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
  fastboot format system
  fastboot format cache
  fastboot format userdata
  fastboot erase recovery
  fastboot reboot-bootloader
  sleep 6
  clear
  echo ""
  echo "Downloading TWRP recovery"
  echo ""
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/recoverys/twrp-mako.img
  sleep 1
  echo ""
  echo "Downloading LineageOS 14.1.."
  echo ""
  sleep 1
  LOSLINK=$(wget -qO- https://download.lineageos.org/mako | sed -n 's/.*href="\([^"]*\.zip\).*/\1/p' | head -n1)
  LOSZIP=${LOSLINK##*/}
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ $LOSLINK
  echo ""
  echo "Downloading Open Gapps.."
  echo ""
  sleep 1
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/gapps/open_gapps-arm-7.1-nano-20170603.zip
  sleep 2
  clear
  echo ""
  echo "Installing TWRP recovery"
  echo ""
  fastboot flash recovery $HOME/.cache/magic-device-tool/twrp-mako.img
  sleep 1
  echo ""
  echo "Rebooting device.."
  echo ""
  echo "This will take ~50 seconds. Don't disconnect your device!"
  echo ""
  fastboot reboot-bootloader
  sleep 7
  fastboot boot $HOME/.cache/magic-device-tool/twrp-mako.img
  sleep 30
  adb reboot recovery
  sleep 28
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
  echo "  → LineageOS 14.1 zip "
  LOSPATH="$HOME/.cache/magic-device-tool/$LOSZIP"
  adb push -p $LOSPATH /sdcard/
  echo ""
  echo "  → open gapps zip"
  adb push -p $HOME/.cache/magic-device-tool/open_gapps-arm-7.1-nano-20170603.zip /sdcard/
  echo ""
  echo "========================================="
  sleep 1
  echo ""
  echo "Installing LineageOS.."
  echo ""
  INSTALLPATH="/sdcard/$LOSZIP"
  adb shell twrp install $INSTALLPATH
  sleep 1
  echo ""
  echo "Installing Open GApps.."
  echo ""
  sleep 3
  adb shell twrp install /sdcard/open_gapps-arm-7.1-nano-20170603.zip
  echo ""
  echo "Wipe cache.."
  echo ""
  adb shell twrp wipe cache
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
