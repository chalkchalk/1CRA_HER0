#ifndef __ROBOT_PHYSICS_H
#define __ROBOT_PHYSICS_H

#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include "state/error_code.h"
#include "robot_tf.h"



namespace HeroMultistage {
class  RobotPhysics
{
public:
     RobotPhysics();
     bool AddRobot(RobotTF*  robot);

     void PublishTF();

     bool ExistRobot(std::string robot_name);


private:
    ros::NodeHandle nh_;
    std::vector<RobotTF* > robots_;

     hero_common::ErrorInfo Init();

};

}



#endif
