#include "mdt.h"
#include "ui_mdt.h"
#include <QProcess>
#include <QDebug>
#include <QMessageBox>
#include <QFile>
#include <QDir>
#include <QSysInfo>

//Todo:
//Support Nexus 5x +
//Support Copperhead OS https://copperhead.co/android/downloads

mdt::mdt(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::mdt)
{
    ui->setupUi(this);
    HOME = QDir::homePath() + "/.cache/magic-device-tool/";
    ui->listWidget->setStyleSheet("font: 18pt 'Sans Serif';");
    ui->label_Top->setStyleSheet("font-size:24pt; font-weight:600;");
    ui->label_Information->setStyleSheet("font-size: 16pt; font-weight:400;");
    fill_options();
    reset_everything();
    connect(Process, SIGNAL(readyReadStandardOutput()), this, SLOT(read_Stout()));
    connect(Process, SIGNAL(readyReadStandardError()), this, SLOT(read_Stout()));
    process_number = 0;
    qDebug() << HOME;
}

mdt::~mdt()
{
    reset_everything();
    delete ui;
}

//Usefull Helpers

QString mdt::get_filename(QString link)
{
    QString filename;

    if (link.contains("dl.google") && link.contains(".zip"))
    {
        filename = link.mid(link.lastIndexOf("/") + 1, (link.indexOf("-", (link.lastIndexOf("/") + 12)) - link.lastIndexOf("/") - 1));
    }
    else
    {
        filename = link.mid(link.lastIndexOf("/") + 1);
    }
    return filename;
}


void mdt::call_for_action()
{
    qDebug() << device;
    qDebug() << action;
    qDebug() << option;
    qDebug() << channel;
    qDebug() << "call for action";
    ui->pushButton_Next->setVisible(false);
    if (device == "BQ Aquaris E4.5 (krillin)")
        ui->listWidget->addItems(actions_krillin);
    else if (device == "BQ Aquaris E5 HD (vegetahd)")
        ui->listWidget->addItems(actions_vegetahd);
    else if (device == "BQ Aquaris M10 HD (cooler)")
        ui->listWidget->addItems(actions_cooler);
    else if (device == "BQ Aquaris M10 FHD (frieza)")
        ui->listWidget->addItems(actions_frieza);
    else if (device == "Meizu MX 4 (arale)")
        ui->listWidget->addItems(actions_arale);
    else if (device == "Meizu Pro 5 (turbo)")
        ui->listWidget->addItems(actions_turbo);
    else if (device == "LG Nexus 4 (mako)")
        nexus4(action, option, channel);
    else if (device == "LG Nexus 5 (hammerhead)")
        nexus5(action, option, channel);
    else if (device == "Asus Nexus 7 2013 WiFi (flo)")
        nexus7_flo(action, option, channel);
    else if (device == "Asus Nexus 7 2013 LTE (deb)")
        ui->listWidget->addItems(actions_deb);
    else if (device == "Samsung Nexus 10 (manta)")
        ui->listWidget->addItems(actions_manta);
    else if (device == "OnePlus One (bacon)")
        ui->listWidget->addItems(actions_bacon);
    else if (device ==  "Fairphone 2 (FP2)")
        ui->listWidget->addItems(actions_FP2);
}

void mdt::reset_everything()
{
    disconnect(Detect, SIGNAL(readyReadStandardOutput()), this, SLOT(read_device_connected()));
    connect(Process, SIGNAL(finished(int,QProcess::ExitStatus)), this, SLOT(execute_helper()));
    ui->label_Image->setPixmap(QPixmap(":/pictures/pictures/mdt.png"));
    ui->label_Top->setText("Choose your device:");
    ui->listWidget->setVisible(true);
    ui->listWidget->clear();
    ui->listWidget->addItems(devices_list);
    ui->listWidget->setCurrentRow(0);
    ui->label_Top->setText("Choose your Device:");
    ui->pushButton_Back->setVisible(false);
    ui->pushButton_Next->setVisible(true);
    ui->pushButton_Next->setEnabled(true);
    ui->pushButton_Start->setVisible(false);
    ui->pushButton_Start->setEnabled(true);
    ui->pushButton_Cancel->setVisible(false);
    ui->label_Process_Info->setVisible(false);
    ui->progressBar->setVisible(false);
    ui->label_Information->setVisible(false);
    ui->listWidget->setFocus();
    detectionoutput.clear();
    orders.clear();
    device = "None";
    option = "None";
    action = "None";
    channel = "None";
    step = 0;
    Process->close();
    Detect->close();
}


//udf_wrapper generates the suitable udf string
QString mdt::udf_wrapper(QString device, QString option, QString channel)
{
    int length = device.indexOf(")") - device.indexOf("(") - 1;
    QString codename = device.mid((device.indexOf("(") + 1), length);
    QString wipeorkeep;
    if (option.contains("wipe"))
        wipeorkeep = "--bootstrap";
    else
        wipeorkeep = "";

    qDebug() << codename;
    QString udf = "ubuntu-device-flash touch --device " + codename + " --channel ubuntu-touch/" + channel + "/ubuntu " + wipeorkeep;
    qDebug() << udf;
    return udf;
}

QString mdt::adb_Backup(QString option)
{
    QString backupcmd;
    QMessageBox Backupinfo;
    if (option == "Create a backup")
    {
        backupcmd = "adb backup -all";
        return backupcmd;
    }
    else if (option == "Restore from a backup")
    {
        backupcmd = "adb restore backup.ab";
        return backupcmd;
    }
    return "adb backup -all";
}

QString mdt::fastboot_locking(QString option)
{
    QString cmd;
    QMessageBox Lockinginfo;
    if (option == "Lock Bootloader")
    {
        cmd = "fastboot oem lock";
        return cmd;
    }
    else if (option == "Unlock Bootloader")
    {
        cmd = "fastboot oem unlock";
        return cmd;
    }
    return "fastboot oem unlock";
}
