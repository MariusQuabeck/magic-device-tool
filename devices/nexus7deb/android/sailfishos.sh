clear
echo ""
echo "Installing Sailfish OS"
echo ""
sleep 1
echo "Please boot your Nexus 7 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
echo ""
sleep 1
echo -n "Is your Nexus 7 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://people.ubuntu.com/~marius.quabeck/magic-device-tool/recoverys/twrp-3.0.2-0-deb.img
  sleep 1
  echo ""
  echo "Downloading Cyanogenmod 11.."
  echo ""
  sleep 1
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://get.cm/get/jenkins/90776/cm-11-20141115-SNAPSHOT-M12-deb.zip
  echo ""
  echo "Downloading Sailfish OS.."
  echo ""
  sleep 1
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://images.devaamo.fi/sfe/deb/sfe-deb-1.1.7.28-alpha1/sailfishos-deb-release-1.1.7.28-alpha1.zip
  sleep 2
  clear
  echo ""
  echo "Installing TWRP recovery"
  echo ""
  fastboot flash recovery $HOME/.cache/magic-device-tool/twrp-3.0.2-0-deb.img
  sleep 1
  echo ""
  echo "Rebooting device.."
  echo ""
  echo "This will take ~35 seconds. Don't disconnect your device!"
  echo ""
  fastboot reboot-bootloader
  sleep 7
  fastboot boot $HOME/.cache/magic-device-tool/twrp-3.0.2-0-deb.img
  sleep 15
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
  echo "  → CM 11 zip "
  adb push -p $HOME/.cache/magic-device-tool/cm-11-20141115-SNAPSHOT-M12-deb.zip /sdcard/
  echo ""
  echo "  → Sailfish OS zip"
  adb push -p $HOME/.cache/magic-device-tool/sailfishos-deb-release-1.1.7.28-alpha1.zip /sdcard/
  echo ""
  echo "========================================="
  sleep 1
  echo ""
  echo "Installing Cyanogenmod.."
  echo ""
  adb shell twrp install /sdcard/cm-11-20141115-SNAPSHOT-M12-deb.zip
  sleep 1
  echo ""
  echo "Installing Sailfish OS.."
  echo ""
  sleep 3
  adb shell twrp install /sdcard/sailfishos-deb-release-1.1.7.28-alpha1.zip
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
