clear
echo ""
echo "Install Factory Image"
echo ""
echo "Please boot your Nexus 7 into fastboot mode by pressing Power & Volume Up (+)"
sleep 1
echo ""
echo -n "Is your Nexus 7 in fastboot mode now? [Y] "; read bootloadermode
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
    wget -c --quiet --show-progress --tries=10 https://dl.google.com/dl/android/aosp/razorg-mob30x-factory-1cb173c1.tgz
    sleep 1
    tar xzf razorg*
    sleep 1
    fastboot flash bootloader ./razorg-mob30x/bootloader-deb-flo-04.08.img
    fastboot reboot-bootloader
    sleep 6
    fastboot flash radio ./razorg-mob30x/radio-deb-deb-z00_2.44.0_0213.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update ./razorg-mob30x/image-razorg-mob30x.zip
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
    rm -rf ./razorg-mob30x
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
