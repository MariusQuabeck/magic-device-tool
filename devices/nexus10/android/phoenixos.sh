clear
echo ""
echo "Install Phoenix OS"
echo ""
echo "Please boot your Nexus 10 into bootloader/fastboot mode by pressing Power & Volume Up (+)"
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
    wget -c --quiet --show-progress --tries=10 http://files.phoenixos.com/os/Phoenix-neuxs10-1.0.5-beta.tar.gz
    sleep 1
    tar xzf Phoenix-neuxs10*
    sleep 1
    fastboot erase boot
    fastboot erase cache
    fastboot erase recovery
    fastboot erase system
    fastboot erase userdata
    fastboot flash bootloader ./Phoenix-neuxs10-1.0.5-beta/bootloader-manta-mantamf01.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update ./Phoenix-neuxs10-1.0.5-beta/#347_manta_2016-03-24_23-00.zip
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
    rm -rf ./Phoenix-neuxs10-1.0.5-beta
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
