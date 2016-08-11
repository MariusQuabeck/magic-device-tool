clear
echo ""
echo "Install Factory Image"
echo ""
echo "Please boot your Nexus 5 into fastboot mode by pressing Power & Volume Up (+)"
sleep 1
echo ""
echo -n "Is your Nexus 5 in fastboot mode now? [Y] "; read bootloadermode
if [ "$bootloadermode"==Y -o "$bootloadermode==y" -o "$bootloadermode"=="" ]; then
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
    echo ""
    echo "Downloading factory image.."
    echo ""
    wget -c --quiet --show-progress --tries=10 https://dl.google.com/dl/android/aosp/hammerhead-mob30y-factory-7f05cd7f.tgz
    sleep 1
    tar xzf hammerhead*
    sleep 1
    fastboot flash bootloader ./hammerhead-mob30y/bootloader-hammerhead-hhz20h.img
    fastboot reboot-bootloader
    sleep 6
    fastboot flash radio ./hammerhead-mob30y/radio-hammerhead-m8974a-2.0.50.2.29.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update ./hammerhead-mob30y/image-hammerhead-mob30y.zip
    sleep 1
    echo ""
    echo "Move to your device to finish the setup."
    echo ""
    echo "Don't think your device is in a bootloop."
    echo "It can take up to 10 minutes until you see the Android Setup Screen"
    sleep 2
    echo ""
    echo "Cleaning up.."
    rm -f ~/.AttachedDevices
    rm -rf ./hammerhead-mob30y
    #rm -f ./*.tgz
    echo ""
    sleep 1
    echo "Exiting script. Bye Bye"
    sleep 1
    exit
  else
    echo "Device not found"
    rm -f ~/.AttachedDevices
    exit
  fi
