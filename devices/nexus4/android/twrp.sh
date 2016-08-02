clear
echo ""
echo "Install TWRP recovery"
echo ""
echo "Please boot your Nexus 4 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
sleep 1
echo ""
echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y] "; read bootloadermode
if [ "$bootloadermode"==Y -o "$bootloadermode"==y -o "$bootloadermode"=="" ]; then
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
    echo "Downloading latest TWRP recovery image.."
    echo ""
    wget http://people.ubuntu.com/~misterq/phone/twrp-3.0.2-0-mako.img
    sleep 2
    echo "Installing TWRP..."
    fastboot flash recovery ./twrp-3.0.2-0-mako.img
    fastboot reboot-bootloader
    sleep 4
    echo ""
    echo "You can now boot into TWRP recovery"
    sleep 1
    echo ""
    echo "Cleaning up.."
    rm -f ./*.img
    echo ""
    sleep 1
    echo "Exiting script. Bye Bye"
    sleep 1
    exit
  else
    echo "Device not found"
    exit
  fi
