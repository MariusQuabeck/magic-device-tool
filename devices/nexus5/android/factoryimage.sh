clear
echo ""
echo "Install Factory Image"
echo ""
echo "Please boot your Nexus 5 into fastboot mode by pressing Power & Volume Down (-)"
sleep 1
echo ""
echo -n "Is your Nexus 5 in fastboot mode now? [Y] "; read bootloadermode
if [ "$bootloadermode"==Y -o "$bootloadermode==y" -o "$bootloadermode"=="" ]; then
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
    echo ""
    echo "Downloading factory image.."
    echo ""
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ https://dl.google.com/dl/android/aosp/hammerhead-m4b30x-factory-10cfaa5c.zip
    sleep 1
    unzip $HOME/.cache/magic-device-tool/hammerhead*
    sleep 1
    fastboot flash bootloader $HOME/.cache/magic-device-tool/hammerhead-m4b30x/bootloader-hammerhead-hhz20h.img
    fastboot reboot-bootloader
    sleep 6
    fastboot flash radio $HOME/.cache/magic-device-tool/hammerhead-m4b30x/radio-hammerhead-m8974a-2.0.50.2.30.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update $HOME/.cache/magic-device-tool/hammerhead-m4b30x/image-hammerhead-m4b30x.zip
    sleep 1
    echo ""
    echo "Move to your device to finish the setup."
    echo ""
    echo "Don't think your device is in a bootloop."
    echo "It can take up to 10 minutes until you see the Android Setup Screen"
    sleep 2
    echo ""
    echo "Cleaning up.."
    rm -f /tmp/AttachedDevices
    #rm -rf ./hammerhead-m4b30x
    #rm -f ./*.tgz
    echo ""
    sleep 1
    echo "Exiting script. Bye Bye"
    sleep 1
    exit
  else
    echo "Device not found"
    rm -f /tmp/AttachedDevices
    exit
  fi
