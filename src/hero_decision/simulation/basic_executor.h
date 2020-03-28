#ifndef __BASIC_EXECUTOR_H
#define __BASIC_EXECUTOR_H

#include "ros/ros.h"
#include "hero_msgs/RobotPosition.h"
#include "hero_msgs/BattlePosition.h"
#include "nav_msgs/OccupancyGrid.h"
#include <nav_msgs/GetMap.h>
#include "hero_msgs/ShootCmd.h"
#include "hero_msgs/GimbalAim.h"
#include "std_msgs/Float64.h"
#include "geometry_msgs/PoseStamped.h"
#include "hero_msgs/BasicExecutor.h"

namespace hero_decision{

const std::string RobotName[4]={"robot_0","robot_1","robot_2","robot_3"};
const double MaxShootRange = 4.5;
const double I_OUT_YAW = 5;
const int LoopTimeMs = 50;

enum class BasicExecutorState {
  MOVE_TO_POSITION,
  ATTACK_ROBOT,
  IDLE,
};

class BasicExecutor
{
public:
  BasicExecutor();
  int CanShootRobot(std::string robot_name);
  bool AimRobot(std::string robot_name);
  bool EngageRobot(std::string robot_name);
  std::string FindClosetAimableEnemy();
  void YawControlLoop();
  bool ApproachEnemy(std::string robot_name,double contact_distance);
  void FaceRobot(std::string robot_name);
  void MoveToPosition(double x,double y);
  void FSM_handler();
  void TestBehaviour();
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

  hero_decision::BasicExecutorState state_;
  void Init();
  void BattlePositionCallback(const hero_msgs::BattlePosition::ConstPtr& msg);
  void YawSetCallback(const std_msgs::Float64::ConstPtr& msg);
  bool GetStaticMap();
  bool GimbalAimPoint(double x,double y);
  bool Shoot();
  bool isAlive(std::string robot_name);
  double set_yaw;
  double set_yaw_speed_;
  bool yaw_received_;
  bool yaw_control_received_;

  std::string target_enemy_;
  double move_x;
  double move_y;

  ros::Publisher goalPoint_pub_;
  ros::Publisher yaw_speed_pub_;
  ros::Subscriber yaw_set_sub_;
  ros::ServiceServer basic_executor_server_;
  hero_msgs::RobotPosition FindRobotPosition(std::string robot_name);
  bool BasicExecutor_handle_function(hero_msgs::BasicExecutor::Request &req,
  hero_msgs::BasicExecutor::Response &res);

};



}
#endif // __BASIC_EXECUTOR_H
