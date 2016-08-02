clear
echo ""
echo "Flashing stable channel"
echo ""
sleep 1
echo "Please boot your Nexus 10 into fastboot mode by pressing Power & Volume Up (+)"
echo ""
sleep 1
echo -n "Is your Nexus 10 in fastboot mode now? [Y] "; read bootloadermode
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
    echo "Flashing stable channel"
    echo ""
    sleep 1
    fastboot format cache
    fastboot format userdata
    fastboot reboot-bootloader
    sleep 6
    echo ""
    ubuntu-device-flash --server=http://system-image.ubports.com touch --channel=ubuntu-touch/stable --device=manta --bootstrap
    echo ""
    echo "Move to your device to finish the setup."
    sleep 1
    echo ""
    echo "Cleaning up.."
    rm -f ~/.AttachedDevices
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
