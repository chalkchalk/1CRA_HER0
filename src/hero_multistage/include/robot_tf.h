#ifndef __ROBOT_TF_H
#define __ROBOT_TF_H

#include "state/error_code.h"
#include <tf/transform_broadcaster.h>
#include <tf/tf.h>
#include <ros/ros.h>
#include <tf/transform_listener.h>


namespace HeroMultistage {

#define RobotWidth 0.5
#define RobotLength 0.6

class RobotTF
{
public:
    RobotTF(std::string robot_name);
    void PublishArmorTF();
    std::string GetName()
    {return robot_name_;}
    float GetGimbalYaw()
    {return gimbal_yaw_;}


private:
    std::string robot_name_;
    tf::TransformListener listener_;
    tf::TransformBroadcaster broadcaster_;
    float gimbal_yaw_;
    hero_common::ErrorInfo Init(std::string robot_name);

};



}




#endif
