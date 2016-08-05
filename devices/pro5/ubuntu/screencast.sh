#!/bin/sh -e
# This program is free software: you can redistribute it and/or modify it
# under the terms of the the GNU General Public License version 3, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranties of
# MERCHANTABILITY, SATISFACTORY QUALITY or FITNESS FOR A PARTICULAR
# PURPOSE.  See the applicable version of the GNU General Public
# License for more details.
#.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Copyright (C) 2014 Canonical, Ltd.
adb start-server
clear
echo ""
echo "Please enable developer mode on the device"
  echo "this is located in system-settings → About → Developer Mode"
  echo ""
  echo "Please confirm the pairing dialog on the device"
  echo ""
  sleep 1
  echo -n "Did you enable developer mode ? [Y] "; read developermode
  if [ "$developermode"==Y -o "$developermode"==y -o "$developermode"=="" ]; then
    clear
    echo ""
    echo "Detecting device"
    echo ""
    sleep 1
    adb devices >~/.AttachedDevices
    echo ""
    sleep 1
  fi
    if grep 'device$\|device$' ~/.AttachedDevices
    then
      echo ""
      echo "Device detected !"


sleep 1
exit | phablet-shell
clear
set -e

usage () {
cat <<EOF
Usage: $0 [--serial SERIAL] [--copy]

This tool will start ssh on your connected Ubuntu Touch device, forward a local
port to the device, copy your ssh id down to the device (so you can log in
without a password), and then ssh into the device through the locally forwarded
port.

This results in a very nice shell, which for example can display the output of
'top' at the correct terminal size, rather than being stuck at 80x25 like 'adb
shell'

Like ssh-copy-id, this script will push down the newest ssh key it can find in
~/.ssh/*.pub, so if you find the wrong key being pushed down, simply use 'touch'
to make your desired key the newest one, and then this script will find it.

The '--copy' option will make it copy your .bashrc down to the device, giving
you the benefit of preserving your $PS1 (prompt) and any aliases and functions
you may have defined on your host system.
EOF
exit 1
}

if [ -f "$(dirname $0)/shell-adb-common.sh" ]; then
    . "$(dirname $0)/shell-adb-common.sh"
else
    . "/usr/share/phabletutils/shell-adb-common.sh"
fi

while [ $# -gt 0 ]; do
    case "$1" in
        -s|--serial)
            export ANDROID_SERIAL="$2"
            shift 2
            ;;
        -c|--copy)
            export COPY_BASHRC=1
            shift
            ;;
        *)
            usage
            ;;
    esac
done

check_devices

toggle_ssh(){
    CMD="sudo -u phablet bash -c '/usr/bin/gdbus call -y \
        -d com.canonical.PropertyService -o /com/canonical/PropertyService \
        -m com.canonical.PropertyService.SetProperty ssh ${1}'"
    ADBUID="$(adb shell "id -u"|tr -d '\n')"
    if [ $ADBUID -eq 0 ]; then
        case $1 in
            true)
                CMD="start ssh"
                ;;
            false)
                CMD="stop ssh"
                ;;
        esac
    fi
    adb shell "$CMD >/dev/null"
}

# check if we even have a local ssh setup and keys before starting
# bug 1364913
if [ ! -d ~/.ssh ]; then
    echo "no local key, please run the ssh-keygen command first,"
    echo "then run phablet-shell again"
    exit 1
fi

# if sshd is already runing, do not attempt to start it
SSH_RUNNING="$(adb shell pgrep sshd)"

# Start ssh on the device and use port forwarding to connect to it.
# This means that we'll connect to the device through the USB cable
# and won't depend on if the device has it's wifi configured or not.
[ -n "$SSH_RUNNING" ] || toggle_ssh true

for PORT in `seq 2222 2299`; do
    adb forward tcp:$PORT tcp:22 && break
done

SSH_OPTS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p $PORT"

# Purge the device host key so that SSH doesn't print a scary warning about it
# (it changes every time the device is reflashed and this is expected)
touch ~/.ssh/known_hosts
ssh-keygen -f ~/.ssh/known_hosts -R [localhost]:$PORT

# Copy your ssh id down to the device so you never need a password.
NEWEST_KEY=$(ls -t ~/.ssh/*.pub | grep -v -- -cert.pub | head -1)
KEY_CONTENT="$(cat $NEWEST_KEY)"

# make sure we have a ~/.ssh/ dir before trying to write to it
adb shell "[ -d ~/.ssh ] || mkdir ~/.ssh"

# append the key to authorized_keys if it is not there already
adb shell "touch  ~/.ssh/authorized_keys"
if [ -z "$(adb shell "grep \"$KEY_CONTENT\" ~/.ssh/authorized_keys")" ]; then
    adb shell "echo $KEY_CONTENT >>~/.ssh/authorized_keys"
    adb shell "chmod 700 ~/.ssh"
    adb shell "chmod 600 ~/.ssh/authorized_keys"
fi

# Copy your bash config down to the device so you get the benefit of your
# colourful $PS1 prompt and any bash aliases that you may be used to from your
# host device.
if [ "$COPY_BASHRC" ]; then
    rsync -qae "ssh $SSH_OPTS" ~/.bashrc phablet@localhost:/home/phablet
fi

# Now connect to the device and provide the user with a shell.
ssh $SSH_OPTS -C -c aes128-ctr phablet@localhost mirscreencast -m /var/run/mir_socket --stdout --cap-interval 10 -s 360 640 |  mplayer -framedrop -demuxer rawvideo -rawvideo fps=6:w=360:h=640:format=rgba -
echo ""
echo "Back to menu"
rm -f ~/.AttachedDevices
sleep 2
. ./launcher.sh



# turn off ssh access again
[ -n "$SSH_RUNNING" ] || toggle_ssh false
else
      echo "Device not found"
      rm -f ~/.AttachedDevices
      sleep 1
      echo "Back to menu"
    sleep 1
    . ./launcher.sh

    fi
