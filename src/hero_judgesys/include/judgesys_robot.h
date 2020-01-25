#ifndef __JUDGESYS_ROBOT_H
#define __JUDGESYS_ROBOT_H

#include <string>
#include "geometry_msgs/Twist.h"
#include "state/error_code.h"
#include "ros/ros.h"
#include "judgesys_control_node.h"

namespace hero_judgesys{

    class JydgesysControl;
    
    class JydgesysRobot{
        public:
        JydgesysRobot(std::string robot_num, std::string color);
        ~JydgesysRobot() = default;

        std::string GetColor()
        {return color_;}

         std::string GetNum()
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
        
        void Shoot(int num, float speed)
        {heat_ += num * speed;}

        void GetHit(int armor_num);

        void DebuffMove();

        void DebuffShoot();

        void BuffReload();


        void BuffHeal();

        private:
        hero_common::ErrorInfo Init(std::string robot_num, std::string color);

        std::string color_;
        std::string robot_num_;

        int health_;
        float heat_;
        int ammo_;
        bool is_alive_;

        bool is_forbidden_to_move_;

        ros::Publisher judge_pub_;
        ros::Subscriber judge_sub_;

        geometry_msgs::Twist raw_cmd_vel_;
        geometry_msgs::Twist output_cmd_vel_;

        bool new_cmd_acc_;
        bool begin_;

    };

}



#endif

