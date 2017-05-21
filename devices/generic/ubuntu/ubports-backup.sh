#!/bin/bash

function wait_for_user() {

    read -p "Press a key to continue..." tmp 

}

function wait_for_user_yesno() {

    while true; do
        read -p " (Y/n)" -n 1 answer
        case $answer in
            [Yy]* ) echo "y"; exit;;
            [Nn]* ) echo "n"; exit;;
            * ) echo "Please use only y or n.";;
        esac
    done 
}

function test_ssh_connection() {

    connection_test=$(adb shell "sudo -u phablet ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i /home/phablet/.ssh/id_ubports-backup $backup_user@$backup_server true; echo -n \$?")
    echo $connection_test
}

function push_ssh_key() {

    echo "Pushing the local key to the device..."
    adb shell "sudo -u phablet mkdir -p /home/phablet/.ssh"
    adb push $HOME/.ssh/id_ubports-backup /home/phablet/.ssh
    adb shell "sudo -u phablet chmod 600 /home/phablet/.ssh/id_ubports-backup"
    adb push $HOME/.ssh/id_ubports-backup.pub /home/phablet/.ssh

}


function do_ssh_setup() {


    echo ""
    echo "SSH setup"
    if [ -z $device ]; then
        echo "No device connected, cannot continue!"
        return
    fi
    echo "Testing if an rsa key for ubports-backup exists on the mobile device..."
    device_key_missing=$(adb shell "sudo -u phablet bash -c 'if [ -e "/home/phablet/.ssh/id_ubports-backup" ]; then echo -n 0; else echo -n 1; fi'")
    if [ "$device_key_missing" -eq "1" ]; then
        if [ -e "$HOME/.ssh/id_ubports-backup" ]; then
            echo -n "No key was found on device $device, but it exists locally. Shall we use the local key?"
            use_local_key=$(wait_for_user_yesno)
            echo ""
            if [ "$use_local_key" == "y" ]; then
                push_ssh_key
            else
                echo "You need to manually remove the local key \$HOME/.shh/id_ubports-backup if you dont want to use it!"
                return
            fi 
        else
            echo -n "No key was found on device $device, shall we create a new key and transfer it?"
            generate_key=$(wait_for_user_yesno)
            echo ""
            if [ "$generate_key" == "y" ]; then
                echo "Generating new 2048bit RAS key for ssh..."
                ssh-keygen -t rsa -N "" -f $HOME/.ssh/id_ubports-backup
                push_ssh_key
            else
                echo "No key found, ssh setup not finished"
                return
            fi
        fi 
    else
        echo "Found a key on the device!"
    fi
    echo "Testing if we can connect to $backup_server without a password"
    result="$(test_ssh_connection)"
    if [ "$result" != "0" ]; then
        echo "We could not connect to the remote server, shall we try to push the public key? Your remote ssh password will be needed"
        if [ "$(wait_for_user_yesno)" == "y" ]; then
            ssh-copy-id -i $HOME/.ssh/id_ubports-backup.pub $backup_user@$backup_server
            echo "Testing if we can connect to $backup_server without a password"
            result=$(test_ssh_connection)
            if [ "$result" != "0" ]; then
                echo "We could not connect to the remote server, even after publishing the key. Exiting..."
                return
            fi
        else
            echo "We could not login to server with a key and you did not want us to copy it, exiting..."
            return
        fi
    fi
    echo "SSH Setup & Test OK!"
}

function do_servertest() {

    echo "Checking folder structure on remote server"
    shell_cmd="mkdir -p $backup_folder/ubports_backup/$device; cd $backup_folder/ubports_backup; echo -n $?"
    result=$(adb shell "sudo -u phablet ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i /home/phablet/.ssh/id_ubports-backup $backup_user@$backup_server $shell_cmd")
    if [ "$result" == "0" ]; then
        echo_green "Servertest OK!"
        echo 0
    else
        echo_red "Servertest NOT OK!"
        echo 255
    fi

}

function do_backup() {

    if [ -z $device ]; then
        echo "No device connected, cannot continue!"
        return
    fi
    do_ssh_setup
    do_servertest
    echo "Now doing backup..."
    adb shell "sudo -u phablet rsync -e 'ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i /home/phablet/.ssh/id_ubports-backup' -avz --delete --info=progress2 /home/phablet/* $backup_user@$backup_server:$backup_folder/ubports_backup/$device"
    echo "Backup finished!"
}

function do_backup_available_folders() {

    echo "Checking which backups exist on the server"
    shell_cmd="ls $backup_folder/ubports_backup/"
    result=$(ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i $HOME/.ssh/id_ubports-backup $backup_user@$backup_server $shell_cmd)
    echo $result
    origin_device="XXXXXXX"
    while [[ $result != *$origin_device* ]]; do
        read -p "Please enter a device id which should be used for restore" origin_device
    done

}


function do_restore() {

    if [ -z $device ]; then
        echo "No device connected, cannot continue!"
        return
    fi
    do_ssh_setup
    do_servertest
    do_backup_available_folders 
    echo "Source: $origin_device => Destination: $device"
    echo -n "CAUTION! This will overwrite your device data now! Proceed?"
    if [ $(wait_for_user_yesno) == "y" ]; then

	echo "Now doing restore..."
	adb shell "sudo -u phablet rsync -e 'ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i /home/phablet/.ssh/id_ubports-backup' -avz --delete --info=progress2 $backup_user@$backup_server:$backup_folder/ubports_backup/$origin_device/* /home/phablet"
        echo "Restore finished, rebooting device..."
        adb reboot
    else
        echo "Cancelled restore."
    fi

}


adb start-server

while [ 1 ]; do
clear
backup_server=$(read_setting ubports_backup backup_server)
backup_server_ok=$(read_setting ubports_backup backup_server_ok "not tested")
backup_user=$(read_setting ubports_backup backup_user)
backup_folder=$(read_setting ubports_backup backup_folder)
ssh_key=$(read_setting ubports_backup custom_ssh_key "id_rsa")
echo ""
echo "UBports (simple) Backup"
echo ""
echo "This module will make a simple backup or restore of the user data in your UBports device. It is currently in alpha stage and no liability is taken for lost data."
echo "NOTE: Currently it is not possible to make a backup of the lists of installed Apps, we hope to provide this on a later stage..."
echo ""
echo "The things You will need:"
echo ""
echo "*) the DNS name or IP address of a backup server that can be used with scp/rsync"
echo "*) your username on this server"
echo "*) (optional) a path to the remote directory, which will be used to store the backup: \$HOME/<optional_folder>/ubports_backup/<device_id>"
echo ""
echo "The script will create its own SSH key pair which will be then also pushed to the device. Currently we only support one username and one backup server!"
echo ""
echo "Currently the following settings are configured:"
echo ""
echo "Backup server: $backup_server"
echo "Username: $backup_user"
echo "Server status: $backup_server_ok"
device=$(adb devices | grep -w device | cut -f1)
echo "Device currently connected: $device"
echo "Current backup path: $backup_user@$backup_server:\$HOME/$backup_folder/ubports_backup/$device" 
sleep 1
echo ""
echo ""
echo "[1] Change backup server"
echo ""
echo "[2] Change username"
echo ""
echo "[3] Change optional folder"
echo ""
echo "[4] configure ssh setup"
echo ""
echo "[5] Backup device $device"
echo ""
echo "[6] Restore device $device"
echo ""
echo "[7] Test server setup"
echo ""
echo "[8] Back to menu"
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
    query_user_setting "Enter the dns name / IP address of the backup server: " ubports_backup backup_server
;;
2)
    query_user_setting "Enter the username: " ubports_backup backup_user
;;
3)
    query_user_setting "Enter the folder name RELATIVE to \$HOME: " ubports_backup backup_folder
;;
4)
    do_ssh_setup
    wait_for_user
;;
5)
    do_backup
    wait_for_user
;;
6)
    do_restore
    wait_for_user
;;
7)
    do_servertest
    wait_for_user
;;
8)
    . ./launcher.sh
;; 
*)
    echo ""
    echo "Invalid Option"
    echo ""
    echo "Exiting script. Bye Bye"
    exit
;;
esac
done

function do_backup() {


}

function do_restore() {


}

