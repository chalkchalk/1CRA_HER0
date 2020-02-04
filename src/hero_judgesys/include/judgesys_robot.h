#ifndef __JUDGESYS_ROBOT_H
#define __JUDGESYS_ROBOT_H

#include <string>
#include "geometry_msgs/Twist.h"
#include "state/error_code.h"
#include "ros/ros.h"
#include "judgesys_control_node.h"
#include "hero_msgs/RobotStatus.h"
#include "hero_msgs/RobotHeat.h"
#include "state/command_code.h"

namespace hero_judgesys{

    class JudgesysControl;
    
    class JudgesysRobot{
        public:
        JudgesysRobot(std::string robot_num, std::string color);
        ~JudgesysRobot() = default;

        std::string GetColor()
        {return color_;}

         std::string GetName()
        {return robot_num_;}

        int GetHealth()
        {return health_;}

        int GetHeat()
        {return heat_;}
        
        bool IsAlive()
        {return is_alive_;}
        
        bool IsBegin()
        {return begin_;}
        
        int GetAmmo()
        {return ammo_;}

        void RawVelCallback(const geometry_msgs::Twist::ConstPtr& msg);
        
        void PublishVel();
        void PublishInfo();
        
        void Shoot(int num, float speed);


        void BeHit(hero_common::JudgeSysCommand command);

        void DebuffMove();

        void DebuffShoot();

        void BuffReload();

        void BuffHeal();

        void Kill(){health_=0;}

        void Revive();

        void Reload()
        {
            ammo_+=50;
            if(ammo_>400)
                ammo_=400;
        }

        void Disarm()
        {ammo_ = 0;}

        void BuffAndDebuff(int fre);

        void Cool(int fre);

        void Reset();


        private:
        hero_common::ErrorInfo Init(std::string robot_num, std::string color);

        std::string color_;
        std::string robot_num_;

        int health_;
        float heat_;
        int cooling_rate_;
        int heat_cooling_limit_;
        int ammo_;
        bool is_alive_;

        bool is_forbidden_to_move_;
        bool is_forbidden_to_shoot_;

        ros::Publisher judgeVel_pub_;
        ros::Publisher judgeStatus_pub_;
        ros::Publisher judgeHeat_pub_;
        ros::Subscriber judge_sub_;

        hero_msgs::RobotStatus roboStatus_;
        hero_msgs::RobotHeat roboHeat_;

        geometry_msgs::Twist raw_cmd_vel_;
        geometry_msgs::Twist output_cmd_vel_;

        bool new_cmd_acc_;
        bool begin_;

        float move_debuff_time_;
        float shoot_debuff_time_;


    };

}



#endif

