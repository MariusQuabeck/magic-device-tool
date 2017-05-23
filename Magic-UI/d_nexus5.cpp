#include "mdt.h"
#include "ui_mdt.h"
#include <QDebug>


void mdt::nexus5(QString action, QString option, QString channel)
{
    //Device-specific Links:
    QString twrp_hammerhead = "http://mdt-files.com/downloads/magic-device-tool/recoverys/twrp-hammerhead.img";
    QString lineageos_hammerhead = "https://lineageos.mirrorhub.io/full/hammerhead/20170516/lineage-14.1-20170516-nightly-hammerhead-signed.zip";
    QString factory_hammerhead = "https://dl.google.com/dl/android/aosp/hammerhead-m4b30x-factory-10cfaa5c.zip";


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
                orders << get_Android_Install(twrp_hammerhead, lineageos_hammerhead, opengapps);
                execute();
            }
            else if (option == "with F-Droid")
            {
                orders << get_Android_Install(twrp_hammerhead, lineageos_hammerhead, fdroidota);
                execute();
            }
            else if (option == "Standard")
            {
                orders << get_Android_Install(twrp_hammerhead, lineageos_hammerhead, "None");
                execute();
            }
        }
    }
    else if (action == "Install Factory Image")
    {
        if (device_connected("fastboot"))
        {
            orders << get_Factory_Install(factory_hammerhead);
            execute();
        }
    }
    else if (action == "Install TWRP recovery")
    {
        if (device_connected("fastboot"))
        {
            orders << get_TWRP_Install(twrp_hammerhead);
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
