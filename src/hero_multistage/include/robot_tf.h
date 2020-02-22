#ifndef __ROBOT_TF_H
#define __ROBOT_TF_H

#include <ros/ros.h>
#include "state/error_code.h"
#include <tf/transform_broadcaster.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include "hero_math/math.h"
#include "geometry_msgs/PointStamped.h"
#include "bullet.h"
#include "hero_msgs/GimbalAim.h"
#include "hero_msgs/RobotStatus.h"

namespace HeroMultistage {

using hero_common::Point2D;
using hero_common::Polygon2D;

#define RobotWidth 0.5
#define RobotLength 0.6
#define AromrLength 0.2//real lenth(0.13) is to difficult to hit!
#define GimbalMaxSpeed 0.6
class RobotTF
{
public:
    RobotTF(std::string robot_name);
    std::string GetName()
    {return robot_name_;}
    float GetGimbalYaw()
    {return gimbal_yaw_;}
    float GetGimbalAbsoluteYaw();
    void SetGimbalAbsoluteYaw(double set_yaw_absolute);
    int BulletHitDetect(HeroMultistage::Bullet bullet,std::vector<Point2D> *points = nullptr);//front left right back 0 1 2 3
    bool GimbalMove();
    void PublishArmorTF();
    Point2D GetChassisSidesMid(int i)
    {return chassisSidesMid_[i];}
    tf::Transform robot_tf;
    tf::Transform armor_tf[4];//front left right back
    geometry_msgs::PointStamped armor_point[4];
    bool isAlive;
    hero_msgs::RobotStatus roboStatus_;

private:
    std::string robot_name_;
    tf::TransformListener listener_;
    tf::TransformBroadcaster broadcaster_;
    ros::ServiceServer gimbal_aim_service_;
    ros::Subscriber judgeStatus_sub_;
    float gimbal_yaw_;
    double gimbal_yaw_set_;
    float gimbal_yaw_absolute_;
    hero_common::ErrorInfo Init(std::string robot_name);
    bool SetGimbalEncoderYaw(double yaw_set);
    void RobotStatusCallback(const hero_msgs::RobotStatus::ConstPtr& msg);
    bool GimbalAim_handle_function(hero_msgs::GimbalAim::Request &req,
    hero_msgs::GimbalAim::Response &res);
    Point2D chassisSidesMid_[4];
};



}




#endif
