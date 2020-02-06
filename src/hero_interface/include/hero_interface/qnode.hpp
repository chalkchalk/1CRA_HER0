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
#include "state/command_code.h"
#include "std_msgs/Float32.h"
#include "hero_msgs/GameStatus.h"
#include "hero_msgs/Buffinfo.h"
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/Twist.h"
#include "hero_msgs/ShootCmd.h"

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace hero_interface {

const int KEY_ROBOT_SPEED=2;
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

    struct Robot
    {
        Robot() {}
        Robot(std::string name) {robot_name = name;}
        std::string robot_name;
        hero_msgs::RobotStatus roboStatus;
        hero_msgs::RobotHeat roboHeat;
        double gimbal_yaw;
    };

    QStringListModel* loggingModel() { return &logging_model; }
    bool KillRobot(std::string robot_name);
    bool ReviveRobot(std::string robot_name);
    bool ReloadRobot(std::string robot_name);
    bool DisarmRobot(std::string robot_name);
    hero_msgs::RobotStatus GetRoboStatus(int index)
    {
        return robot[index].roboStatus;
    }
    hero_msgs::RobotHeat GetRoboHeat(int index)
    {
        return robot[index].roboHeat;
    }
    int GetRobotHeat(int index)
    {return robot[index].roboHeat.shooter_heat;}
    int GetRobotHealth(int index)
    {return robot[index].roboStatus.remain_hp;}

    float GetGimbalYaw(int i)
    {return robot[i].gimbal_yaw;}
    const hero_msgs::BulletsInfo *GetBulletsInfo()
    {return &bulletInfo_;}
    const hero_msgs::Buffinfo *GetBuffInfo()
    {return &buffInfo_;}
    const hero_msgs::GameStatus *GetGameStatus()
    {return &gameStatus_;}
    const Robot* GetRobot(int i)
    {return &robot[i];}

    bool SendJudgeSysCall(int comman, std::string robot_name);
    void SetRobot0Yaw(double yaw)
    {robot_0_set_yaw = yaw;}

    void SendGoalPoint(int robot_num, double x, double y,double yaw);
    void MoveRobot0(double x_speed,double y_speed);
    void RobotShoot(std::string robot_num);
    double RFID_F_x[6];
    double RFID_F_y[6];

    double RFID_height;
    double RFID_width;

    bool isShooting;





Q_SIGNALS:
    void rosShutdown();

private:
    int init_argc;
    char** init_argv;
    ros::Subscriber pose_sub_[4];
    ros::Subscriber judgeStatus_sub_[4];
    ros::Subscriber judgeHeat_sub_[4];
    ros::Subscriber bulletInfo_sub_;
    ros::Subscriber gameStatus_sub_;
    ros::Subscriber buffInfo_sub_;

    QStringListModel logging_model;
    BattleView *parentBattleView_;
    ros::ServiceClient client_;
    ros::ServiceClient shoot_client_;
    //hero_msgs::RobotStatus roboStatus_[4];
    //hero_msgs::RobotHeat roboHeat_[4];
    hero_msgs::Buffinfo buffInfo_;
    hero_msgs::GameStatus gameStatus_;
    hero_msgs::BulletsInfo bulletInfo_;
    ros::Subscriber gimbal_yaw_sub_[4];

    ros::Publisher goalPoint_pub_[4];
    ros::Publisher cmd_act_;


    //float gimbal_yaw_[4];
    double robot_0_set_yaw;
    Robot robot[4];
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
    void GameStatusCallback(const hero_msgs::GameStatus::ConstPtr& msg);
    void BuffInfoCallback(const hero_msgs::Buffinfo::ConstPtr& msg);

    void GimbalYawCallback0(const std_msgs::Float32::ConstPtr& msg);
    void GimbalYawCallback1(const std_msgs::Float32::ConstPtr& msg);
    void GimbalYawCallback2(const std_msgs::Float32::ConstPtr& msg);
    void GimbalYawCallback3(const std_msgs::Float32::ConstPtr& msg);
    void SetRobotHeat(const hero_msgs::RobotHeat::ConstPtr& msg,int index);

    void GetParam(ros::NodeHandle *nh);


};

}  // namespace hero_interface

#endif /* hero_interface_QNODE_HPP_ */
