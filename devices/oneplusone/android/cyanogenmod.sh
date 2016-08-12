clear
echo ""
echo "Installing Cyanogenmod 13"
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
  fastboot devices >~/.AttachedDevices
fi
if grep 'device$\|fastboot$' ~/.AttachedDevices
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
  wget -c --quiet --show-progress --tries=10 http://people.ubuntu.com/~misterq/magic-device-tool/recoverys/twrp-3.0.2-0-bacon.img
  sleep 1
  echo ""
  echo "Downloading Cyanogenmod 13.."
  echo ""
  sleep 1
  wget -c --quiet --show-progress --tries=10 https://download.cyanogenmod.org/get/bacon-snapshot.zip
  echo ""
  echo "Downloading Open Gapps.."
  echo ""
  sleep 1
  wget -c --quiet --show-progress --tries=10 http://people.ubuntu.com/~misterq/magic-device-tool/gapps/open_gapps-arm-6.0-nano-20160811.zip
  sleep 2
  clear
  echo ""
  echo "Installing TWRP recovery"
  echo ""
  fastboot flash recovery twrp-3.0.2-0-bacon.img
  sleep 1
  echo ""
  echo "Rebooting device.."
  echo ""
  echo "This will take ~35 seconds. Don't disconnect your device!"
  echo ""
  fastboot reboot-bootloader
  sleep 7
  fastboot boot twrp-3.0.2-0-bacon.img
  sleep 15
  adb reboot recovery
  sleep 15
  echo ""
  clear
  echo ""
  echo "Pushing zip's to device"
  sleep 1
  echo ""
  echo "Please wait this can take awhile"
  echo ""
  echo "  → CM 13 zip "
  adb push bacon-snapshot.zip /sdcard/
  echo ""
  echo "  → gapps zip"
  adb push open_gapps-arm-6.0-nano-20160811.zip /sdcard/
  echo ""
  echo "========================================="
  sleep 1
  echo ""
  echo "Move to your device to finish the setup."
  echo ""
  sleep 1
  echo "Choose 'Install' → select the bacon-snapshot zip → press 'Add more Zips' to add"
  echo "the gapps zip to the queue"
  echo ""
  echo "(or don't do that if you dont want the google apps..)"
  echo ""
  echo "and then swipe to confirm flash."
  echo ""
  echo "When its done dont forget to clear the caches as suggested by the recovery."
  echo "Then you can reboot into Cyanogenmod 13 "
  sleep 1
  echo ""
  echo "Cleaning up.."
  rm -f ~/.AttachedDevices
  echo ""
  sleep 1
  echo "Exiting script. Bye Bye"
  sleep 1

else
  echo "Device not found"
  rm -f ~/.AttachedDevices
  sleep 1
  echo ""
  echo "Back to menu"
  sleep 1
  . ./launcher.sh
fi
