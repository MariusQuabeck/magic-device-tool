clear
echo ""
echo "Flashing rc-proposed channel"
echo ""
sleep 1
echo "Please boot your MX4 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
echo ""
sleep 1
echo -n "Is your MX4 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
    echo "Flashing stable channel"
    echo ""
    sleep 1
    fastboot format cache
    fastboot format userdata
    fastboot reboot-bootloader
    sleep 6
    echo ""
    wget http://people.canonical.com/~alextu/tangxi/recovery/recovery.img
    sleep 1
    fastboot flash recovery recovery.img
    sleep 1
    ubuntu-device-flash touch --channel ubuntu-touch/rc-proposed/meizu.en --device arale --bootstrap
    echo ""
    echo "Move to your device to finish the setup."
    sleep 1
    echo ""
    echo "Cleaning up.."
    rm -f ~/.AttachedDevices
    rm recovery.img
    echo ""
    sleep 1
    echo "Exiting script. Bye Bye"
    sleep 1
    exit
  else
    echo "Device not found"
    sleep 1
    echo ""
    echo "Back to menu"
    sleep 1
    . ./launcher.sh
  fi
