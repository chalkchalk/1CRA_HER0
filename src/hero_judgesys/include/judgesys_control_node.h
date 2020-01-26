#ifndef __JUDGESYS_CONTROL_NODE_H
#define __JUDGESYS_CONTROL_NODE_H

#include <string>
#include "geometry_msgs/Twist.h"
#include "state/error_code.h"
#include "judgesys_robot.h"
#include <vector>
#include "ros/ros.h"

namespace hero_judgesys{
    class JydgesysRobot;
    class JydgesysControl{
        public:
        JydgesysControl();
        ~JydgesysControl() = default;
        void AddRobot(JydgesysRobot*  robot)
        {
             robots_.push_back(robot);
        }
        void UpdateVel();
        bool KillRobot(std::string robot_num);
        

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
        
        private:
        hero_common::ErrorInfo Init();
        ros::NodeHandle nh_;

        

        std::vector<JydgesysRobot* > robots_;
        

    };
}



#endif

