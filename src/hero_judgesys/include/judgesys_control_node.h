#ifndef __JUDGESYS_CONTROL_NODE_H
#define __JUDGESYS_CONTROL_NODE_H

#include <string>
#include "geometry_msgs/Twist.h"
#include "hero_msgs/JudgeSysControl.h"
#include "state/error_code.h"
#include "judgesys_robot.h"
#include <vector>
#include "ros/ros.h"
#include "hero_msgs/RobotStatus.h"
#include "state/command_code.h"

namespace hero_judgesys{
class JudgesysRobot;
class JudgesysControl{
public:
    JudgesysControl();
    ~JudgesysControl() = default;
    void AddRobot(JudgesysRobot*  robot)
    {
         robots_.push_back(robot);
    }
    void UpdateVel();
    bool KillRobot(std::string robot_num);
    bool ReviveRobot(std::string robot_num);
    bool ReloadRobot(std::string robot_num);
    bool DisarmRobot(std::string robot_num);
    void UpdateInfo();
    void HitRobot(std::string robot_name, hero_common::JudgeSysCommand command);
    void RobotShoot(std::string robot_name);
    void RobotsCooling(int fre);
    void LogOutput();
    JudgesysRobot* FindRobot(std::string robot_name);
    static const int HeatLimit = 240;
    static const int CoolingRateNormal = 120;
    static const int CoolingRateDying = 240;
    static const int MaxHealth = 2000;
    static const int FrontArmorDamage = 20;
    static const int SideAromrDamge = 40;
    static const int RearAromrDamge = 60;
    static const int ReloadAmmo = 100;
    static const int RecoveredHealth = 200;
    static const int MoveForbiddenTime = 10;
    static const int ShootForbiddenTime = 10;

    void RFID_Callback(std::string robot_name, int num);
    void RFID_Refresh();
    void BuffHandle(int fre);

    enum GameState{
        PREPERATION = 0,
        START = 1,
        END = 2
    };

    enum RFID_type{
        HEAL = 1,
        RELOAD = 2,
        MOVE_DEFBUFF = 3,
        SHOOT_DEBUFF = 4
    };

    struct RFID_def
    {
        RFID_def()
        {
            type = RFID_type::HEAL;
            color = "red";
            isActivated = false;
        }
        RFID_type type;
        std::string color;
        bool isActivated;
    };

private:
    hero_common::ErrorInfo Init();
    ros::NodeHandle nh_;
    ros::ServiceServer service_;
    bool handle_function(hero_msgs::JudgeSysControl::Request &req,
                        hero_msgs::JudgeSysControl::Response &res);

    std::vector<JudgesysRobot* > robots_;
    bool buffZone[6];

    float game_time;
    GameState gameState;
    RFID_def RFID[6];


};

}



#endif

