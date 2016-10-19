clear
echo ""
echo "Install Factory Image"
echo ""
echo "Please boot your Nexus 7 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
sleep 1
echo ""
echo -n "Is your Nexus 7 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
    wget -c --quiet --show-progress --tries=10 https://dl.google.com/dl/android/aosp/razor-mob30x-factory-a2a73e87.tgz
    sleep 1
    tar xzf razor*
    sleep 1
    fastboot format cache
    fastboot format userdata
    fastboot flash bootloader ./razor-mob30x/bootloader-flo-flo-04.08.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update ./razor-mob30x/image-razor-mob30x.zip
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
    rm -rf ./razor-mob30x
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
