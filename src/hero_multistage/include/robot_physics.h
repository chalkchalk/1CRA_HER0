#ifndef __ROBOT_PHYSICS_H
#define __ROBOT_PHYSICS_H

#include <ros/ros.h>
#include "state/error_code.h"
#include "robot_tf.h"
#include "bullet.h"
#include "nav_msgs//Odometry.h"
#include "geometry_msgs/PointStamped.h"


#define DistributeYaw 1.2f
namespace HeroMultistage {
class  RobotPhysics
{
public:
     RobotPhysics();
     bool AddRobot(RobotTF*  robot);

     void PublishTF();

     RobotTF* FindRobot(std::string robot_name);
     void BulletJudge();
     void PublishBulletsInfo();
     void RobotShoot(std::string robot_name);
     void LetBulletsFly(int fre);
     int ArmorHitDetect();
private:
    ros::NodeHandle nh_;
    std::vector<RobotTF* > robots_;
    std::vector<Bullet* > bullets_;
    ros::Subscriber pose_sub_[4];
    ros::Publisher bulletsInfo_pub_;


    bool robot_tf_received_[4];
    hero_common::ErrorInfo Init();
    void PoseCallback(const nav_msgs::Odometry::ConstPtr& msg);

};

}



#endif
