clear
echo "  "
echo "Install Ubuntu 13.04 Desktop"
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
  fastboot erase boot
  fastboot format userdata
  sleep 1
  clear
  echo ""
  echo "Downloading boot.img"
  echo ""
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/ubuntudesktop/ubuntu-13.04-preinstalled-desktop-armhf+nexus7.bootimg
  sleep 1
  echo ""
  echo "Downloading Ubuntu 13.04 Image"
  echo ""
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/ubuntudesktop/ubuntu-13.04-preinstalled-desktop-armhf+nexus7.img.gz
  sleep 1
  echo "unzipping ubuntu image"
  echo ""
  gzip -d -r $HOME/.cache/magic-device-tool/ubuntu-13.04-preinstalled-desktop-armhf+nexus7.img.gz
  echo ""
  sleep 1
  clear
  echo ""
  echo "Installing boot.img"
  echo ""
  fastboot flash boot $HOME/.cache/magic-device-tool/ubuntu-13.04-preinstalled-desktop-armhf+nexus7.bootimg
  sleep 1
  echo ""
  echo "Installing Ubuntu"
  echo "This may take a little while"
  echo ""
  fastboot flash userdata $HOME/.cache/magic-device-tool/ubuntu-13.04-preinstalled-desktop-armhf+nexus7.img
  echo ""
  echo "Rebooting device.."
  fastboot reboot
  echo ""
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
