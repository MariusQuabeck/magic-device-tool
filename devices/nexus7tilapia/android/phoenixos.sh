clear	
echo ""
echo "Install Phoenix OS"
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
    fastboot format system
    fastboot format cache
    fastboot format userdata
    fastboot reboot-bootloader
    sleep 8
    clear
    echo ""
    echo "Downloading Phoenix OS.."
    echo ""
    echo "This may take a while"
    echo ""
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://files.phoenixos.com/os/Phoenix-Nexus7-flo-1.1.0.tar.gz
    sleep 1
    tar xzf $HOME/.cache/magic-device-tool/Phoenix* --directory $HOME/.cache/magic-device-tool/
    sleep 1
    fastboot flash bootloader $HOME/.cache/magic-device-tool/Phoenix-Nexus7-flo-1.1.0/bootloader-flo-flo-04.05.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update $HOME/.cache/magic-device-tool/Phoenix-Nexus7-flo-1.1.0/164_flo_2016-09-10_10-59.zip
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
    #rm -rf ./Phoenix-neuxs7-flo-1.0.9-RC
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
