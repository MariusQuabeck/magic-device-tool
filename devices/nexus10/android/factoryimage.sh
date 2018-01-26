clear
echo ""
echo "Install Factory Image"
echo ""
echo "Please boot your Nexus 10 into fastboot mode by pressing Power & Volume Up (+) & Volume Down (-)"
sleep 1
echo ""
echo -n "Is your Nexus 10 in fastboot mode now? [Y] "; read bootloadermode
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
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ https://dl.google.com/dl/android/aosp/mantaray-lmy49j-factory-7887b439.tgz
    sleep 1
    tar xzf $HOME/.cache/magic-device-tool/mantaray*
    sleep 1
    fastboot erase boot
    fastboot erase cache
    fastboot erase recovery
    fastboot erase system
    fastboot erase userdata
    fastboot flash bootloader $HOME/.cache/magic-device-tool/mantaray-lmy49j/bootloader-manta-mantamf01.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update $HOME/.cache/magic-device-tool/mantaray-lmy49j/image-mantaray-lmy49j.zip
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
    #rm -rf ./mantaray-lmy49j
    #rm -f ./*.tgz
    echo ""
    sleep 1
    echo "Exiting magic-device-tool. Bye Bye"
    sleep 1
    exit
  else
    echo "Device not found"
    rm -f /tmp/AttachedDevices
    exit
  fi
