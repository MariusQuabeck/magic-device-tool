clear
echo ""
echo "Install Phoenix OS"
echo ""
echo "Please boot your Nexus 10 into fastboot mode by pressing Power & Volume Up (+) & Volume Down (-)"
sleep 1
echo ""
echo -n "Is your Nexus 10 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
    echo "Downloading Phoenix OS.."
    echo ""
    echo "This may take a while"
    echo ""
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://files.phoenixos.com/os/Phoenix-Nexus10-Manta-1.1.0.tar.gz
    sleep 1
    tar xzf $HOME/.cache/magic-device-tool/Phoenix-Nexus10-* --directory $HOME/.cache/magic-device-tool/
    sleep 1
    fastboot erase boot
    fastboot erase cache
    fastboot erase recovery
    fastboot erase system
    fastboot erase userdata
    fastboot flash bootloader $HOME/.cache/magic-device-tool/Phoenix-Nexus10-Manta-1.1.0/bootloader-manta-mantamf01.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update $HOME/.cache/magic-device-tool/Phoenix-Nexus10-Manta-1.1.0/433_manta_2016-09-08_19-47.zip
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
    #rm -rf ./Phoenix-neuxs10-1.0.5-beta
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
