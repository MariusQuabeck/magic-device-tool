#include "mdt.h"
#include <QProcess>
#include <QDebug>
#include <QMessageBox>

void mdt::read_device_connected()
{
    detectionoutput = Detect->readAllStandardOutput();
    qDebug() << detectionoutput + "readready";
}

bool mdt::device_connected(QString type)
{
    if (type == "fastboot")
    {
        connect(Detect, SIGNAL(readyReadStandardOutput()), this, SLOT(read_device_connected()));
        for (int c = 0; c < 4; c++)
        {
            Detect->start("fastboot devices");
            Detect->waitForFinished();
            if (detectionoutput.contains("fastboot"))
            {
                c = 100;
                return true;
            }
            else
            {
                QMessageBox disconnected;
                disconnected.critical(0,"No Device!", "Please connect your device and make sure you to give mdt the right permissions"
                                                      " by running: \n\"sudo snap connect mdt:raw-usb core:raw-usb\"");
                disconnected.setFixedSize(500,200);
            }
        }
    }
    else if (type == "adb")
    {
        connect(Detect, SIGNAL(readyReadStandardOutput()), this, SLOT(read_device_connected()));
        for (int c = 0; c < 4; c++)
        {
            Detect->start("adb devices -l");
            Detect->waitForFinished();
            if (detectionoutput.contains("model"))
            {
                c = 100;
                return true;
            }
            else
            {
                QMessageBox disconnected;
                disconnected.critical(0,"No Device!", "Please connect your Device, enable devmode and make sure you to give mdt the right permissions"
                                                      " by running: \n\"sudo snap connect mdt:raw-usb core:raw-usb\"");
                disconnected.setFixedSize(500,200);
            }
        }
    }
    reset_everything();
    return false;
}
