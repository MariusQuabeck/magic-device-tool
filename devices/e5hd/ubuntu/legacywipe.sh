clear
echo ""
echo "Flashing legacy channel"
echo ""
sleep 1
echo "Please boot your E5 HD into bootloader/fastboot mode by pressing Power & Volume +"
echo "and select fastboot mode"
echo ""
sleep 1
echo -n "Is your E5 HD in bootloader/fastboot mode now? [Y] "; read bootloadermode
if [ "$bootloadermode"==Y -o "$bootloadermode"==y -o "$bootloadermode"=="" ]; then
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
    echo "Flashing legacy channel"
    echo ""
    sleep 1
    fastboot format cache
    fastboot format userdata
    fastboot reboot-bootloader
    sleep 6
    echo ""
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/recoverys/recovery-vegetahd.img
    sleep 1
    ubuntu-device-flash --server=http://system-image.ubports.com touch --channel=ubports-touch/legacy --device=vegetahd --bootstrap --recovery-image $HOME/.cache/magic-device-tool/recovery-vegetahd.img
    echo ""
    echo "Move to your device to finish the setup."
    sleep 1
    echo ""
    echo "Cleaning up.."
    rm -f /tmp/AttachedDevices
    #rm recovery-vegetahd.img
    echo ""
    sleep 1
    echo "Exiting script. Bye Bye"
    sleep 1
    exit
  else
    echo "Device not found"
    sleep 1
    echo ""
    rm -f /tmp/AttachedDevices
    echo "Back to menu"
    sleep 1
    . ./launcher.sh
  fi
