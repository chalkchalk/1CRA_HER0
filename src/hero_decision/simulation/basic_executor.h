#ifndef __BASIC_EXECUTOR_H
#define __BASIC_EXECUTOR_H

#include "ros/ros.h"
#include "hero_msgs/RobotPosition.h"
#include "hero_msgs/BattlePosition.h"
#include "nav_msgs/OccupancyGrid.h"
#include <nav_msgs/GetMap.h>
#include "hero_msgs/ShootCmd.h"
#include "hero_msgs/GimbalAim.h"

namespace hero_decision{

const std::string RobotName[4]={"robot_0","robot_1","robot_2","robot_3"};
const double MaxShootRange = 3.5;

class BasicExecutor
{
public:
  BasicExecutor();
  void Init();
  int CanShootRobot(std::string robot_name);
  bool AimRobot(std::string robot_name);
  bool EngageRobot(std::string robot_name);
  std::string FindClosetAimableEnemy();
  std::string GetName()
  {return my_name_;}
private:
  std::string my_name_;
  ros::NodeHandle nh_;
  ros::Subscriber battle_position_sub_;
  ros::ServiceClient static_map_srv_;
  ros::ServiceClient shoot_client_;
  ros::ServiceClient gimbal_aim_client_;
  nav_msgs::OccupancyGrid map_;
  hero_msgs::BattlePosition battle_position_;

  void BattlePositionCallback(const hero_msgs::BattlePosition::ConstPtr& msg);
  bool GetStaticMap();
  bool GimbalAimPoint(double x,double y);
  bool Shoot();
  hero_msgs::RobotPosition FindRobotPosition(std::string robot_name);


};



}
#endif // __BASIC_EXECUTOR_H
