#include "robot_tf.h"

#define DegreeToRad(a) ((a)* 3.1415926 /180.0)

namespace HeroMultistage {

    using hero_common::ErrorCode;
    using hero_common::ErrorInfo;

    RobotTF::RobotTF(std::string robot_name)
    {
        if (Init(robot_name).IsOK()) {
         ROS_INFO("[robot_physicis]robot %s added.",robot_name.c_str());
       } else {
         ROS_ERROR("[robot_physicis]fail to add robot: %s.",robot_name.c_str());
       }
    }

    ErrorInfo RobotTF::Init(std::string robot_name) {
        robot_name_ = robot_name;

        return ErrorInfo(ErrorCode::OK);
    }


    void RobotTF::PublishArmorTF()
    {
        tf::Transform transform;
        tf::Quaternion q;
        q.setRPY(0,0,DegreeToRad(-90));
        transform.setOrigin(tf::Vector3(RobotWidth/2,0,0));
        transform.setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_link",robot_name_ + "/armor_left"));
        q.setRPY(0,0,DegreeToRad(90));
        transform.setOrigin(tf::Vector3(- RobotWidth/2,0,0));
        transform.setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_link",robot_name_ + "/armor_right"));
        q.setRPY(0,0,DegreeToRad(0));
        transform.setOrigin(tf::Vector3(0,RobotLength/2,0));
        transform.setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_link",robot_name_ + "/armor_front"));
        q.setRPY(0,0,DegreeToRad(180));
        transform.setOrigin(tf::Vector3(0, - RobotLength /2,0));
        transform.setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_link",robot_name_ + "/armor_back"));

    }

}

