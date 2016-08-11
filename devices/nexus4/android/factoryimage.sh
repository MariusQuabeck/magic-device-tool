clear
echo ""
echo "Install Factory Image"
echo ""
echo "Please boot your Nexus 4 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
sleep 1
echo ""
echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
    wget -c --quiet --show-progress --tries=10 https://dl.google.com/dl/android/aosp/occam-lmy48t-factory-416938f1.tgz
    sleep 1
    tar xzf occam*
    sleep 1
    fastboot flash bootloader ./occam-lmy48t/bootloader-mako-makoz30f.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update ./occam-lmy48t/image-occam-lmy48t.zip
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
    rm -rf ./occam-lmy48t
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
