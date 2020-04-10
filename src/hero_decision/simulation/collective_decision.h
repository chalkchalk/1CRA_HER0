#ifndef COLLECTIVE_DECISION_H
#define COLLECTIVE_DECISION_H

#include "ros/ros.h"
#include "hero_msgs/RobotPosition.h"
#include "hero_msgs/BattlePosition.h"
#include "nav_msgs/OccupancyGrid.h"
#include <nav_msgs/GetMap.h>
#include "std_msgs/Float64.h"
#include "geometry_msgs/PoseStamped.h"
#include "hero_msgs/BasicExecutor.h"
#include "hero_msgs/RobotStatus.h"
#include "hero_msgs/RobotHeat.h"
#include "hero_msgs/Buffinfo.h"
#include "hero_msgs/GameStatus.h"
#include "costmap/costmap_interface.h"

namespace hero_decision{

const std::string RobotName[4]={"robot_0","robot_1","robot_2","robot_3"};

class Collective_decision
{
public:
  Collective_decision(std::string color);
  void Spin();
  typedef std::shared_ptr<hero_costmap::CostmapInterface> CostmapPtr;
  typedef std::shared_ptr<tf::TransformListener> TfPtr;

  enum TaskType{
    ATTACK_ROBOT_0 = 2000u,
    ATTACK_ROBOT_1 = 2001u,
    GET_AMMO = 2002u,
    GET_HEALTH = 2003u,
    GET_ENEMY_HEALTH = 2004u,
    FLEE = 2005u,
    IDLE = 2006u,
  };

  enum BuffType{
    FRIENDLY_HEAL = 0u,
    FRIENDLY_AMMO = 1u,
    ENEMY_HEAL = 2u,
    ENEMY_AMMO = 3u,
  };

  struct RobotTask
  {
    RobotTask(TaskType task_type) {type = task_type;benefit = 0; cost = 0;}
    RobotTask(){type = IDLE; benefit = 0; cost = 0;}
    std::vector<std::string> assigned_robots;
    TaskType type;
    double benefit;
    double cost;
  };

private:




  struct RobotStatus
  {
    RobotStatus() {task = NULL;}
    std::string name;
    int health;
    int ammo;
    double x,y;
    double combat_effectiveness;
    std::string saying;
   RobotTask *task;
   std::vector<RobotTask> candidate_tasks;
  };

  ros::NodeHandle nh_;
  std::string color_;
  std::string friendly_name_[2];
  std::string enemy_name_[2];
  hero_msgs::Buffinfo buffInfo_;
  hero_msgs::GameStatus gameStatus_;
  ros::Subscriber battle_position_sub_;
  ros::ServiceClient static_map_srv_;

  ros::Subscriber gameStatus_sub_;
  ros::Subscriber buffInfo_sub_;

  ros::ServiceClient basic_executor_cient_[2];

  nav_msgs::OccupancyGrid map_;
  hero_msgs::BattlePosition battle_position_;

  CostmapPtr costmap_ptr_;
  //！ Transform pointer
  TfPtr tf_ptr_;


  RobotStatus robot_status[2];
  RobotStatus enemy_status[2];
  enum SideType{
    FRIENDLY_ONLY = 1000u,
    ENEMY_ONLY = 1001u,
    BOTH_SIDE= 1003u,
  };
  double RFID_F_x[6];
  double RFID_F_y[6];

  double RFID_height;
  double RFID_width;
  bool GetStaticMap();
  void GameStatusCallback(const hero_msgs::GameStatus::ConstPtr& msg);
  void BuffInfoCallback(const hero_msgs::Buffinfo::ConstPtr& msg);
  void BattlePositionCallback(const hero_msgs::BattlePosition::ConstPtr &msg);
  void MoveToPosition(int robot_num, double x,double y);
  void AttackRobot(int robot_num,int enemy_num);
  void GoGetBuff(int robot_num,int buff_num);
  int GetBuffRFIDNum(BuffType buff_type);
  void Init();
  void GetParam(ros::NodeHandle *nh);
  hero_msgs::RobotPosition FindRobotPosition(std::string robot_name);
  int FindClosestRobotToPosition(SideType specific_side,double x,double y);
  void FleeBehaviour(int robot_num);
  void RobotStatusUpdate();
  void TasksManager();
  void RobotsExecutor();
  void TaskExecutor(int robot_num, RobotTask *task);
  void CalculateCostBenefitCost();
  void TaskAssign();
  bool GetOptimalEngagePosition(int robot_num, int enemy_num, double &optimal_x, double &optimal_y);
  double GetContactDistanceCost(double distance,double optimal_distance);
  //bool TaskSortFun(const RobotTask &t1,const RobotTask &t2);
};

}
#endif // COLLECTIVE_DECISION_H
