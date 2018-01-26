clear
echo ""
echo "Storage Fix for Meizu MX 4"
echo ""
echo "If you've flashed CyanogenMod on an MX4 that was running Ubuntu before, there is"
echo "a problem with limited local storage because of different partition layouts."
echo ""
echo "Don't worry too much about it, I will guide you through the process to fix this :)"
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
  fastboot devices > /tmp/AttachedDevices
fi
  if grep 'device$\|fastboot$' /tmp/AttachedDevices
  then
    echo "Device detected !"
    sleep 1
    rm -f /tmp/AttachedDevices
    clear
    echo ""
    echo "Downloading boot.img"
    echo ""
    sleep 1
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/old/MX4UbuntuBoot.img
    sleep 1
    fastboot flash boot $HOME/.cache/magic-device-tool/MX4UbuntuBoot.img
    sleep 1
    fastboot reboot
    sleep 1
    clear
    echo ""
    echo "Your phone will now reboot and it will stuck at the bootscreen"
    echo "Don't worry, this is exactly what we want!"
    echo ""
    echo "Please wait one minute and reboot your phone to bootloader/fastboot again."
    echo ""
    echo "Please boot your MX4 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
    sleep 1
    echo -n "Is your MX4 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
    rm -f /tmp/AttachedDevices
    clear
    echo ""
    echo "Downloading CM boot.img"
    echo ""
    sleep 1
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/old/MX4CMBoot.img
    sleep 1
    fastboot flash boot $HOME/.cache/magic-device-tool/MX4CMBoot.img
    sleep 1
    fastboot reboot
    echo ""
    echo "Your device should reboot now and you should have all your storage back :)"
    echo ""
    echo "Feel free to join our Telegram chat if you have any questions"
    echo ""
fi
    else
    echo "Device not found"
    rm -f /tmp/AttachedDevices
    sleep 1
    echo ""
    echo "Back to menu"
    sleep 1
    . ./launcher.sh
  fi
