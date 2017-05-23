/*
 * This is a template for adding new devices
 * Replace devicename with the new device
 * Only leave actions that are applicable
 * and create teh custom interface options in settings, or use generic.
#include "mdt.h"
#include "ui_mdt.h"
#include <QDebug>


void mdt::devicename(QString action, QString option, QString channel)
{
    //Device-specific Links:
    QString twrp_devicename = "Link to trwp recovery for devicename";
    QString lineageos_devicename = "https://lineageos.mirrorhub.io/full/devicename...";
    QString factory_devicename = "devicename factory image";


    if (action == "Install Ubuntu")
    {
        if (device_connected("fastboot"))
        {
            orders << fastboot_format
                   << udf_wrapper(device, option, channel);
            execute();
        }

    }
    else if (action == "Install OpenStore")
    {
        if (device_connected("adb"))
        {
            orders << install_OpenStore;
            execute();
        }
    }
    else if (action == "Install LineageOS")
    {
        if (device_connected("fastboot"))
        {
            if (option == "with GApps")
            {
                orders << get_Android_Install(twrp_devicename, lineageos_devicename, opengapps);
                execute();
            }
            else if (option == "with F-Droid")
            {
                orders << get_Android_Install(twrp_devicename, lineageos_devicename, fdroidota);
                execute();
            }
            else if (option == "Standard")
            {
                orders << get_Android_Install(twrp_devicename, lineageos_devicename, "None");
                execute();
            }
        }
    }
    else if (action == "Install Factory Image")
    {
        if (device_connected("fastboot"))
        {
            orders << get_Factory_Install(factory_devicename);
            execute();
        }
    }
    else if (action == "Install TWRP recovery")
    {
        if (device_connected("fastboot"))
        {
            orders << get_TWRP_Install(twrp_devicename);
            execute();
        }
    }
    else if (action == "Back Up your Android device")
    {
        if (device_connected("adb"))
        {
            orders << adb_Backup(option);
            execute();
        }
    }
    else if (action == "Lock/Unlock bootloader (Will wipe existing apps/data)")
    {
        if (device_connected("fastboot"))
        {
            orders << fastboot_locking(option);
            execute();
        }
    }
}

*/
