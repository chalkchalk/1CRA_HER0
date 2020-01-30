/**
 * @file /include/hero_interface/qnode.hpp
 *
 * @brief Communications central!
 *
 * @date February 2011
 **/
/*****************************************************************************
** Ifdefs
*****************************************************************************/

#ifndef hero_interface_QNODE_HPP_
#define hero_interface_QNODE_HPP_

/*****************************************************************************
** Includes
*****************************************************************************/

// To workaround boost/qt4 problems that won't be bugfixed. Refer to
//    https://bugreports.qt.io/browse/QTBUG-22829
#ifndef Q_MOC_RUN
#include <ros/ros.h>
#endif
#include <string>
#include <QThread>
#include <QStringListModel>
#include "nav_msgs//Odometry.h"
#include "battleview.h"
#include "hero_msgs/JudgeSysControl.h"
#include "hero_msgs/RobotStatus.h"
#include "hero_msgs/RobotHeat.h"
#include "hero_msgs/BulletsInfo.h"
#include <mutex>

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace hero_interface {

/*****************************************************************************
** Class
*****************************************************************************/
class BattleView;
class QNode : public QThread {
    Q_OBJECT
public:
    QNode(int argc, char** argv,BattleView *parentBattleView);
    virtual ~QNode();
    bool init();
    bool init(const std::string &master_url, const std::string &host_url);
    void run();


    std::mutex bulletInfo_lock;

    /*********************
    ** Logging
    **********************/
    enum LogLevel {
             Debug,
             Info,
             Warn,
             Error,
             Fatal
     };

    QStringListModel* loggingModel() { return &logging_model; }
    bool KillRobot(std::string robot_name);
    bool ReviveRobot(std::string robot_name);
    bool ReloadRobot(std::string robot_name);
    bool DisarmRobot(std::string robot_name);
    hero_msgs::RobotStatus GetRoboStatus(int index)
    {
        return roboStatus_[index];
    }
    hero_msgs::RobotHeat GetRoboHeat(int index)
    {
        return roboHeat_[index];
    }
    int GetRobotHeat(int index)
    {return roboHeat_[index].shooter_heat;}
    int GetRobotHealth(int index)
    {return roboStatus_[index].remain_hp;}

    float GetGimbalYaw()
    {return gimbal_yaw_;}
    const hero_msgs::BulletsInfo *GetBulletsInfo()
    {return &bulletInfo_;}
Q_SIGNALS:
    void rosShutdown();

private:
    int init_argc;
    char** init_argv;
    ros::Subscriber pose_sub_[4];
    ros::Subscriber judgeStatus_sub_[4];
    ros::Subscriber judgeHeat_sub_[4];
    ros::Subscriber bulletInfo_sub_;

    QStringListModel logging_model;
    BattleView *parentBattleView_;
    ros::ServiceClient client_;
    hero_msgs::RobotStatus roboStatus_[4];
    hero_msgs::RobotHeat roboHeat_[4];

    hero_msgs::BulletsInfo bulletInfo_;

    float gimbal_yaw_;
    bool SendJudgeSysCall(int comman, std::string robot_name);
    void RobotStatusCallback0(const hero_msgs::RobotStatus::ConstPtr& msg);
    void RobotStatusCallback1(const hero_msgs::RobotStatus::ConstPtr& msg);
    void RobotStatusCallback2(const hero_msgs::RobotStatus::ConstPtr& msg);
    void RobotStatusCallback3(const hero_msgs::RobotStatus::ConstPtr& msg);
    void SetRobotStatus(const hero_msgs::RobotStatus::ConstPtr& msg,int index);
    void PoseCallback(const nav_msgs::Odometry::ConstPtr& msg);
    void RobotHeatCallback0(const hero_msgs::RobotHeat::ConstPtr& msg);
    void RobotHeatCallback1(const hero_msgs::RobotHeat::ConstPtr& msg);
    void RobotHeatCallback2(const hero_msgs::RobotHeat::ConstPtr& msg);
    void RobotHeatCallback3(const hero_msgs::RobotHeat::ConstPtr& msg);
    void BulletInfoCallback(const hero_msgs::BulletsInfo::ConstPtr& msg);

    void SetRobotHeat(const hero_msgs::RobotHeat::ConstPtr& msg,int index);

};

}  // namespace hero_interface

#endif /* hero_interface_QNODE_HPP_ */
