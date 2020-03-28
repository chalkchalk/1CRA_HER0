#ifndef __ROBOT_PHYSICS_H
#define __ROBOT_PHYSICS_H


#include <functional>
#include <ros/ros.h>
#include "state/error_code.h"
#include "robot_tf.h"
#include "bullet.h"
#include "nav_msgs//Odometry.h"
#include "geometry_msgs/PointStamped.h"
#include "nav_msgs/OccupancyGrid.h"
#include <nav_msgs/GetMap.h>
#include "hero_msgs/JudgeSysControl.h"
#include "state/command_code.h"
#include "hero_msgs/RobotStatus.h"
#include "hero_msgs/ShootCmd.h"
#include "hero_msgs/RobotHeat.h"
#include "hero_msgs/RobotPosition.h"
#include "hero_msgs/BattlePosition.h"
#include "hero_msgs/JudgeSysShootHit.h"

#define DistributeYaw 0.03f
#define DistributeSpeed 2.0f
#define HeatControlLimit 200
namespace HeroMultistage {
class  RobotPhysics
{
public:
     RobotPhysics();
     bool AddRobot(RobotTF*  robot);

     void PublishGimbalYaw();

     RobotTF* FindRobot(std::string robot_name);
     void BulletJudge();
     void PublishBulletsInfo();
     void RobotShoot(std::string robot_name);
     void LetBulletsFly(int fre);
     int ArmorHitDetect();
     void SendHitRobotInfo(std::string robot_name, int armor_num);
     void SendShootRobotInfo(std::string robot_name);

     void RobotStatusCallback0(const hero_msgs::RobotStatus::ConstPtr& msg);
     void RobotStatusCallback1(const hero_msgs::RobotStatus::ConstPtr& msg);
     void RobotStatusCallback2(const hero_msgs::RobotStatus::ConstPtr& msg);
     void RobotStatusCallback3(const hero_msgs::RobotStatus::ConstPtr& msg);


     void GetParam(ros::NodeHandle *nh);
     void RFID_detect();
     void SendJudgeSysRequest(std::string robot_name, int command);
     void SetRobotHeat(const hero_msgs::RobotHeat::ConstPtr& msg,int index);
     void GimbalsMove();

     void PublishSimuDecisionInfo();
     void ShootSequence();
     bool need_shooting[4];
private:
    ros::NodeHandle nh_;
    std::vector<RobotTF* > robots_;
    std::vector<Bullet* > bullets_;
    ros::Subscriber pose_sub_[4];
    hero_msgs::RobotHeat roboHeat_[4];

    ros::Subscriber judgeHeat_sub_[4];
    ros::ServiceClient static_map_srv_;
    ros::Publisher bulletsInfo_pub_;
    ros::Publisher shoot_hit_pub_;
    ros::Publisher simu_decision_info_pub_;
    ros::Publisher gimbalYaw_pub_[4];
    nav_msgs::OccupancyGrid map_;
    ros::ServiceClient judgeSysClient_;
    ros::ServiceServer shoot_service_;


     double RFID_F_x[6];
     double RFID_F_y[6];

     double RFID_height;
     double RFID_width;




    bool robot_tf_received_[4];
    hero_common::ErrorInfo Init();
    void PoseCallback(const nav_msgs::Odometry::ConstPtr& msg);
    bool Shoot_handle_function(hero_msgs::ShootCmd::Request &req,
    hero_msgs::ShootCmd::Response &res);

};

}



#endif
