clear
echo ""
echo "Flashing stable channel"
echo ""
sleep 1
echo "Please boot your Nexus 4 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
echo ""
sleep 1
echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
    echo "Flashing stable channel"
    echo ""
    sleep 1
    fastboot format cache
    fastboot format userdata
    fastboot reboot-bootloader
    sleep 6
    echo ""
    ubuntu-device-flash touch --channel ubuntu-touch/stable/ubuntu --device mako --bootstrap
    echo ""
    echo "Move to your device to finish the setup."
    sleep 1
    echo ""
    echo "Cleaning up.."
    rm -f /tmp/AttachedDevices
    echo ""
    sleep 1
    echo "Exiting magic-device-tool. Bye Bye"
    sleep 1
    exit
    else
    echo "Device not found"
    rm -f /tmp/AttachedDevices
    sleep 1
    echo ""
    echo "Back to menu"
    sleep 1
    . ./launcher.sh
fi
