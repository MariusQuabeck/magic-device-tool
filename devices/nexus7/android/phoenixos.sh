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
  fastboot devices >~/.AttachedDevices
fi
  if grep 'device$\|fastboot$' ~/.AttachedDevices
  then
    echo "Device detected !"
    sleep 1
    clear
    echo ""
    echo "Downloading Phoenix OS.."
    echo ""
    echo "This may take awhile"
    echo ""
    wget -c --quiet --show-progress --tries=10 http://files.phoenixos.com/os/Phoenix-Nexus7-flo-1.0.9RC.tar.gz
    sleep 1
    tar xzf Phoenix*
    sleep 1
    fastboot flash bootloader ./Phoenix-neuxs7-flo-1.0.9-RC/bootloader-flo-flo-04.05.img
    fastboot reboot-bootloader
    sleep 6
    fastboot -w update ./Phoenix-neuxs7-flo-1.0.9-RC/122_flo_2016-07-19_19-46.zip
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
    rm -rf ./Phoenix-neuxs7-flo-1.0.9-RC
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
