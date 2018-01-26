clear
echo ""
echo "Installing Cyanogenmod 13 without Gapps"
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
  fastboot devices > /tmp/AttachedDevices
fi
  if grep 'device$\|fastboot$' /tmp/AttachedDevices
  then
    echo "Device detected !"
    sleep 1
    clear
    echo ""
    echo "Installing TWRP recovery"
    echo ""
    sleep 1
    fastboot format cache
    fastboot format userdata
    fastboot format system
    fastboot erase recovery
    fastboot reboot-bootloader
    sleep 6
    clear
    echo ""
    echo "Downloading TWRP recovery"
    echo ""
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/recoverys/twrp-arale.img
    sleep 1
    fastboot flash recovery $HOME/.cache/magic-device-tool/twrp-arale.img
    sleep 1
    echo ""
    echo "Downloading Cyanogenmod 13.."
    echo ""
    sleep 1
    wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ https://emmaus.pro/MX4_custom_roms/Cyanogenmod%2013/cm-13.0-20160722-UNOFFICIAL-mx4.zip
    echo ""
    sleep 2
    clear
    echo ""
    echo "Please boot your MX 4 into recovery mode by pressing Power & Volume Up (+)"
    echo ""
    sleep 1
    echo -n "Is your MX 4 in recovery mode now? [Y] "; read recoverymode

    if [ "$recoverymode"==Y -o "$recoverymode"==y -o "$recoverymode"=="" ]; then
      echo ""
      echo "Detecting device"
      echo ""
      sleep 1
      adb devices >/tmp/AttachedDevices
    fi
    if grep 'device$\|recovery$' /tmp/AttachedDevices
      then
        echo "Device detected !"
        sleep 1
        clear
        echo ""
        echo "Pushing zip's to device"
        sleep 1
        echo ""
        echo "Please wait this can take a while"
        echo ""
        echo "You may see a prompt asking you for read/write permissions"
        echo "Ignore that prompt, the tool will take care of the installation"
        echo ""
        echo "  → CM 13 zip "
        adb push -p $HOME/.cache/magic-device-tool/cm-13.0-20160722-UNOFFICIAL-mx4.zip /sdcard/
        echo ""
        sleep 1
        echo ""
        echo "Installing Cyanogenmod.."
        echo ""
        adb shell twrp install /sdcard/cm-13.0-20160722-UNOFFICIAL-mx4.zip
        sleep 1
        echo ""
        sleep 2
        echo "Wipe cache.."
        echo ""
        adb shell twrp wipe cache
        adb shell twrp wipe dalvik
        echo ""
        adb reboot
        echo "The device is now rebooting. Give it time to flash the new ROM. It will boot on its own."
        echo ""
        sleep 5
        echo ""
        echo "Cleaning up.."
        rm -f /tmp/AttachedDevices
        echo ""
        sleep 1
        echo "Exiting magic-device-tool. Bye Bye"
        sleep 1
      else
        echo "Device not found"
        rm -f /tmp/AttachedDevices
        sleep 1
        echo ""
        echo "Back to menu"
        sleep 1
        . ./launcher.sh
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
