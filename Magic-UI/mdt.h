#ifndef MDT_H
#define MDT_H

#include <QMainWindow>
#include <QProcess>
#include <QListWidgetItem>


namespace Ui {
class mdt;
}

class mdt : public QMainWindow
{
    Q_OBJECT

public:
    explicit mdt(QWidget *parent = 0);
    ~mdt();

private slots:
    //check_device_connected.cpp

    void read_device_connected();

    bool device_connected(QString type);

    //UI_options.cpp

    void fill_options();

    void set_actions(QString device);

    bool set_options(QString action);

    bool set_channel(QString option);

    void set_Information();

    QString Information_fastboot(QString device);


    //install_processes.cpp

    void read_Stout();

    void execute();

    void execute_helper();


    //mdt.cpp

    void reset_everything();

    void on_pushButton_Next_clicked();

    void call_for_action();

    void on_pushButton_Back_clicked();

    void on_pushButton_Start_clicked();

    void on_pushButton_Cancel_clicked();

    QString adb_Backup(QString option);

    QString fastboot_locking(QString option);

    void display_current(QString command);

    QStringList get_TWRP_Install(QString recovery);

    QStringList get_Android_Install(QString recovery, QString image, QString extras);

    QStringList get_Factory_Install(QString image);

    //String-operations

    QString get_filename(QString link);

    QString udf_wrapper(QString device, QString option, QString channel);


    //Device-functions

    void nexus4(QString action, QString option, QString channel);

    void nexus7_flo(QString action, QString option, QString channel);

    void on_listWidget_activated(const QModelIndex &index);

private:
    QStringList devices_list, actions_generic, actions_krillin, actions_vegetahd, actions_cooler, actions_frieza, actions_arale,
    actions_turbo, actions_mako, actions_hammerhead, actions_flo, actions_deb, actions_manta, actions_bacon, actions_FP2;
    QStringList options_Install_Ubuntu, options_Install_LineageOS, options_Ubuntu_Channel, options_Bootloader, options_Backup;
    QStringList fastboot_format;
    QStringList orders;
    QString device, action, option, channel;
    QString install_OpenStore, opengapps, opengapps_filename, fdroidota;
    QString HOME;
    QString wget;
    int step;
    int process_number;
    QList<int> finds;
    QByteArray output, detectionoutput;
    QByteArray error;
    QProcess *Process = new QProcess;
    QProcess *Detect = new QProcess;
    Ui::mdt *ui;
};

#endif // MDT_H
