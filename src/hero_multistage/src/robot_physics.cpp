#include "robot_physics.h"

namespace HeroMultistage {

    using hero_common::ErrorCode;
    using hero_common::ErrorInfo;

    RobotPhysics::RobotPhysics()
    {
        if (Init().IsOK()) {
         ROS_INFO("[robot physics]initialization completed.");
       } else {
         ROS_ERROR("[robot physics] Initialization failed.");
       }
    }

    ErrorInfo RobotPhysics::Init() {
        tf::TransformListener listener;
        if(listener.waitForTransform("/map","robot_0/odom",ros::Time(0),ros::Duration(0.5)))
             AddRobot(new RobotTF("robot_0"));
        if(listener.waitForTransform("/map","robot_1/odom",ros::Time(0),ros::Duration(0.5)))
             AddRobot(new RobotTF("robot_1"));
        if(listener.waitForTransform("/map","robot_2/odom",ros::Time(0),ros::Duration(0.5)))
             AddRobot(new RobotTF("robot_2"));
        if(listener.waitForTransform("/map","robot_3/odom",ros::Time(0),ros::Duration(0.5)))
             AddRobot(new RobotTF("robot_3"));
        return ErrorInfo(ErrorCode::OK);
    }

    bool RobotPhysics::AddRobot(RobotTF *robot)
    {
        if (ExistRobot(robot->GetName()))
        {
            ROS_ERROR("[robot physics]%s already exist!",robot->GetName().c_str());
             return false;
        }
        robots_.push_back(robot);
        return true;
    }

    bool RobotPhysics::ExistRobot(std::string robot_name)
    {
        for (auto it = robots_.begin(); it != robots_.end(); ++it) {
            if((*it)->GetName() == robot_name)
            {
                return true;
            }
        }
        return false;
    }

    void RobotPhysics::PublishTF()
    {
        for (auto it = robots_.begin(); it != robots_.end(); ++it) {
            (*it)->PublishArmorTF();
        }
    }

}


int main(int argc, char** argv){
    ros::init(argc, argv, "robot_physics_node");
    HeroMultistage::RobotPhysics robotPhysics;
    ros::start();
    ros::Rate rate(20);
    ROS_INFO("waiting");
    while ( ros::ok() ) {
        robotPhysics.PublishTF();
        ros::spinOnce();
        rate.sleep();
    }
    return 0;
}
