clear
echo ""
echo "Installing AOSP 7.1 Nougat - 24/11/2016 (Rom by @Santhosh M)"
echo ""
sleep 1
echo "Please boot your Nexus 5 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
echo ""
sleep 1
echo -n "Is your Nexus 5 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
  wget -c --quiet --show-progress --tries=10 http://people.ubuntu.com/~misterq/magic-device-tool/recoverys/twrp-3.0.2-0-hammerhead.img
  sleep 1
  echo ""
  echo "Downloading AOSP 7.1 Nougat.."
  echo ""
  sleep 1
  wget -c --quiet --show-progress --tries=10 https://qc3.androidfilehost.com/dl/Afuq8EQZYy6v-JrN9JxdKA/1480223760/385035244224401091/aosp_hammerhead-7.1-nougat-20161124.zip
  echo ""
  echo "Downloading Open Gapps.."
  echo ""
  sleep 1
  wget -c --quiet --show-progress --tries=10 https://github.com/opengapps/arm/releases/download/20161124/open_gapps-arm-7.1-micro-20161124.zip
  echo ""
  echo "Downloading AOSP-Marsh-Nougat Debloater Minimum"
  echo ""
  sleep 1
  # wget -c --quiet --show-progress --tries=10 http://tx2.androidfilehost.com/dl/1uf3hsAVc2FyBjnt21lPag/1480212164/529152257862674659/Pixel_Experience_10-31-2016_7.1_Flashable.zip
  wget -c --quiet --show-progress --tries=10 http://download1077.mediafire.com/t73cz5e8wzqg/yqw0zts0l0zhtxx/AOSP-Marsh-Nougat-Debloater-Minimum-20161015-flashable.zip
  sleep 2
  clear
  echo ""
  echo "Installing TWRP recovery"
  echo ""
  fastboot flash recovery twrp-3.0.2-0-hammerhead.img
  sleep 1
  echo ""
  echo "Rebooting device.."
  echo ""
  echo "This will take ~35 seconds. Don't disconnect your device!"
  echo ""
  fastboot reboot-bootloader
  sleep 7
  fastboot boot twrp-3.0.2-0-hammerhead.img
  sleep 7
  adb reboot recovery
  sleep 15
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
  echo "  → AOSP 7.1 Nougat zip "
  adb push -p aosp_hammerhead-7.1-nougat-20161124.zip /sdcard/
  echo ""
  echo "  → gapps zip"
  adb push -p open_gapps-arm-7.1-micro-20161124.zip /sdcard/
  echo ""
  echo "  → AOSP-Marsh-Nougat Debloater Minimum"
  adb push -p AOSP-Marsh-Nougat-Debloater-Minimum-20161015-flashable.zip /sdcard/
  echo ""
  echo "========================================="
  sleep 1
  echo ""
  echo "Installing AOSP 7.1 Nougat (By Santhosh M).."
  echo ""
  adb shell twrp install /sdcard/aosp_hammerhead-7.1-nougat-20161124.zip
  sleep 1
  echo "Installing AOSP-Marsh-Nougat Debloater Minimum.."
  echo ""
  adb shell twrp install /sdcard/AOSP-Marsh-Nougat-Debloater-Minimum-20161015-flashable.zip
  sleep 1
  echo ""
  echo "Installing GApps.."
  echo ""
  sleep 3
  adb shell twrp install /sdcard/open_gapps-arm-7.1-micro-20161124.zip
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
  echo "Exiting script. Bye Bye"
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
