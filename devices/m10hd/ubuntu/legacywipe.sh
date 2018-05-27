clear
adb start-server
clear

echo ""
echo "Flashing legacy channel"
echo ""
sleep 1
echo "Please press Power and Volume Up (+)"
echo "wait until your tablet is in recovery"
echo ""
echo "select 'reboot to bootloader' and confirm by pressing the power button"
echo ""
sleep 1
echo "You should see '=> FASTBOOT mode...' in the lower right corner"
echo ""
echo -n "Is your tablet in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
  
  if fastboot getvar unlocked 2>&1 | grep -q 'unlocked: no'; then
    echo "Please press volume UP to unlock bootloader"
    fastboot oem unlock
    
    echo "If it failed, go to developer options -> OEM Unlock"
    echo "Please restart magic-device-tool"
	exit
  fi
  
  
  for partition in cache userdata system
  do
	case $partition in
      userdata) min_bits=$((1 * 1024 * 1024 * 8));; # min 1G, stock size is 10G
      cache) min_bits=$((1 * 1024 * 1024 * 8));; # min 1G, stock size is 1G
      system) min_bits=$((2 * 1024 * 1024 * 8));; # min 2G, stock size is 4G
    esac
    
	size=$(fastboot getvar partition-size:${partition} 2>&1 | awk -Wposix 'NR = 1{printf("%d\n","0x" $NF); exit;}')

	if ! [ "$size" -gt 0 ]; then
		echo "Can not find ${partition} partition" >&2
		exit 1
	elif [ "$size" -lt "$min_bits" ]; then
	  echo "Partition $partition too small" >&2
	  echo "You should restore ubuntu-touch firmware"
	  echo "or use parted"
	  exit 1
	fi
  done
    
  echo ""
  echo "Flashing legacy channel"
  echo ""
  fastboot format cache
  fastboot format userdata
  fastboot format system
  fastboot erase recovery
  fastboot reboot-bootloader
  echo "Please wait"
  echo ""
  [ -e "$HOME/.cache/magic-device-tool/recovery-cooler.img" ] && rm $HOME/.cache/magic-device-tool/recovery-cooler.img
  wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://cdimage.ubports.com/devices/recovery-cooler.img
  sleep 12
  #fastboot flash recovery $HOME/.cache/magic-device-tool/recovery-cooler.img
  clear
  echo ""
  ubuntu-device-flash --server=http://system-image.ubports.com touch --device=cooler --channel=15.04/stable --bootstrap --recovery-image=$HOME/.cache/magic-device-tool/recovery-cooler.img
  #ubuntu-device-flash --server=http://system-image.ubports.com touch --channel=ubports-touch/legacy --device=cooler --bootstrap
  #ubuntu-device-flash --server=http://system-image.ubports.com touch --channel=ubports-touch/legacy --device=cooler --bootstrap --recovery-image $HOME/.cache/magic-device-tool/recovery-cooler.img
  sleep 1
  echo ""
  #echo "You'll see 'Installing Ubuntu update.' in the lower left corner"
  echo "Wait until it reboots on its own!"
  echo "Do not reboot manually!"
  sleep 1
  echo ""
  echo "Cleaning up.."
  rm -f /tmp/AttachedDevices
  rm $HOME/.cache/magic-device-tool/recovery-cooler.img
  #rm recovery-cooler.img
  echo ""
  sleep 1
  echo "Exiting magic-device-tool. Bye Bye"
  sleep 1
  exit
else
  echo "Device not found"
  rm -f /tmp/AttachedDevices
  sleep 1
  echo "Back to menu"
  sleep 1
  . ./launcher.sh
  exit
fi
