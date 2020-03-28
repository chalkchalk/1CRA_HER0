#include "collective_decision.h"
#include <chrono>
#include <sys/time.h>
#include <thread>
#include "hero_math/math.h"
#include "tf/tf.h"
#include <ros/package.h>

#define LOGI ROS_INFO
namespace hero_decision{

const int LoopTimeMs = 200;

Collective_decision::Collective_decision(std::string color):
  color_(color)
{
  Init();
  ROS_INFO("[collective_decision]collective_decision_%s init!",color_.c_str());
}

void Collective_decision::Init()
{
  if(color_ == "blue")
  {
    friendly_name_[0] = "robot_0";
    friendly_name_[1] = "robot_1";
    enemy_name_[0] = "robot_2";
    enemy_name_[1] = "robot_3";
  }
  else if(color_ == "red")
  {
    friendly_name_[0] = "robot_2";
    friendly_name_[1] = "robot_3";
    enemy_name_[0] = "robot_0";
    enemy_name_[1] = "robot_1";
  }
  else
    ROS_ERROR("[collective_decision]color name error : %s is not a valid color name(blue and red only)",color_.c_str());

  robot_status[0].name = friendly_name_[0];
  robot_status[1].name = friendly_name_[1];
  enemy_status[0].name = enemy_name_[0];
  enemy_status[1].name = enemy_name_[1];
  gameStatus_sub_ = nh_.subscribe<hero_msgs::GameStatus>("/judgeSysInfo/game_state", 100,&Collective_decision::GameStatusCallback,this);
  buffInfo_sub_ = nh_.subscribe<hero_msgs::Buffinfo>("/judgeSysInfo/buff_info", 100,&Collective_decision::BuffInfoCallback,this);
  basic_executor_cient_[0] = nh_.serviceClient<hero_msgs::BasicExecutor>("/"+friendly_name_[0]+"/basic_executor_server");
  basic_executor_cient_[1] = nh_.serviceClient<hero_msgs::BasicExecutor>("/"+friendly_name_[1]+"/basic_executor_server");
  static_map_srv_ = nh_.serviceClient<nav_msgs::GetMap>("/static_map");
  battle_position_sub_ = nh_.subscribe<hero_msgs::BattlePosition>("/simu_decision_info/battle_position",100,&Collective_decision::BattlePositionCallback,this);
  GetParam(&nh_);
  GetStaticMap();

  // Create tf listener
  tf_ptr_ = std::make_shared<tf::TransformListener>(ros::Duration(10));

  // Create costmap
  std::string map_path = ros::package::getPath("hero_costmap") + \
      "/config/costmap_parameter_config_for_decision.prototxt";
  costmap_ptr_ = std::make_shared<hero_costmap::CostmapInterface>(color_+"_tactic_costmap",
                                                                           *tf_ptr_,
                                                                         map_path.c_str());

  for(int i = 0; i < 2; i ++)
  {

    robot_status[i].candidate_tasks.emplace_back(RobotTask(ATTACK_ROBOT_0));
    robot_status[i].candidate_tasks.emplace_back(RobotTask(ATTACK_ROBOT_1));
    robot_status[i].candidate_tasks.emplace_back(RobotTask(GET_AMMO));
    robot_status[i].candidate_tasks.emplace_back(RobotTask(GET_HEALTH));
    robot_status[i].candidate_tasks.emplace_back(RobotTask(GET_ENEMY_HEALTH));
    robot_status[i].candidate_tasks.emplace_back(RobotTask(FLEE));
  }

}

bool Collective_decision::GetStaticMap()
{
  ros::service::waitForService("/static_map", -1);
  nav_msgs::GetMap::Request req;
  nav_msgs::GetMap::Response res;
  if(static_map_srv_.call(req,res)) {
  ROS_INFO( "[collective_decision]Received Static Map");
  map_ = res.map;
  return true;
  } else{
  ROS_ERROR ("[collective_decision]Get static map failed");
  return false;
  }
}

int Collective_decision::FindClosestRobotToPosition(SideType specific_side, double x, double y)
{
  double min_distance = 100;
  int return_val = 0;
  if(specific_side == FRIENDLY_ONLY||specific_side == BOTH_SIDE)
  {
    for(int i =0;i<2;i++)
    {
      double new_distance = hero_common::PointDistance(x,y,FindRobotPosition(friendly_name_[i]).position.x,FindRobotPosition(friendly_name_[i]).position.y);
      if(new_distance<min_distance)
      {
        return_val = i;
        min_distance = new_distance;

      }
    }
  }
  if(specific_side == ENEMY_ONLY||specific_side == BOTH_SIDE)
  {
    for(int i =0;i<2;i++)
    {
      double new_distance = hero_common::PointDistance(x,y,FindRobotPosition(enemy_name_[i]).position.x,FindRobotPosition(enemy_name_[i]).position.y);
      if(new_distance<min_distance)
      {
        return_val = i + 2;
        min_distance = new_distance;

      }
    }
  }
  return return_val;
}

void Collective_decision::BattlePositionCallback(const hero_msgs::BattlePosition::ConstPtr &msg)
{
  battle_position_ = *msg;

}


void Collective_decision::GetParam(ros::NodeHandle *nh)
{
  nh->param<double>("/RFID_F1_x", RFID_F_x[0], 7.63);
  nh->param<double>("/RFID_F1_y", RFID_F_y[0], 1.8);
  nh->param<double>("/RFID_F2_x", RFID_F_x[1], 6.23);
  nh->param<double>("/RFID_F2_y", RFID_F_y[1], 3.225);
  nh->param<double>("/RFID_F3_x", RFID_F_x[2], 4.03);
  nh->param<double>("/RFID_F3_y", RFID_F_y[2], 0.49);
  nh->param<double>("/RFID_F4_x", RFID_F_x[3], 0.45);
  nh->param<double>("/RFID_F4_y", RFID_F_y[3], 3.34);
  nh->param<double>("/RFID_F5_x", RFID_F_x[4], 1.85);
  nh->param<double>("/RFID_F5_y", RFID_F_y[4], 1.915);
  nh->param<double>("/RFID_F6_x", RFID_F_x[5], 4.05);
  nh->param<double>("/RFID_F6_y", RFID_F_y[5], 4.9);
  nh->param<double>("/RFID_height", RFID_height, 0.4);
  nh->param<double>("/RFID_width", RFID_width, 0.46);

  for(int i =0;i<6;i++)
  {
    RFID_F_x[i] = RFID_F_x[i] + RFID_width * 0.5;
    RFID_F_y[i] = RFID_F_y[i] + RFID_height * 0.5;
  }
}


hero_msgs::RobotPosition Collective_decision::FindRobotPosition(std::string robot_name)
{
  for (auto it = battle_position_.robots_position.begin(); it != battle_position_.robots_position.end(); ++it) {
    if((*it).robot_name == robot_name)
    {
      return *(it);
    }

  }
 // ROS_ERROR("no %s",robot_name.c_str());
  return hero_msgs::RobotPosition();
}

void Collective_decision::GameStatusCallback(const hero_msgs::GameStatus::ConstPtr &msg)
{
    gameStatus_ = *msg;
}

void Collective_decision::BuffInfoCallback(const hero_msgs::Buffinfo::ConstPtr &msg)
{
    buffInfo_ = *msg;
}

void Collective_decision::MoveToPosition(int robot_num, double x,double y)
{
  hero_msgs::BasicExecutor basic_executor;
  basic_executor.request.command = basic_executor.request.MOVE_TO_POSITION;
  basic_executor.request.position_x = x;
  basic_executor.request.position_y = y;

  if(basic_executor_cient_[robot_num].call(basic_executor))
  {

  }
  else {
     ROS_ERROR("[collective_decision]Failed to call basic_executor server");
  }

}

void Collective_decision::AttackRobot(int robot_num, int enemy_num)
{
  hero_msgs::BasicExecutor basic_executor;
  basic_executor.request.command = basic_executor.request.ATTACK_ROBOT;
  basic_executor.request.robot_name = enemy_name_[enemy_num];
  if(basic_executor_cient_[robot_num].call(basic_executor))
  {

  }
  else {
     ROS_ERROR("[collective_decision]Failed to call basic_executor server");
  }
}

void Collective_decision::GoGetBuff(int robot_num,int buff_num)
{
  if(robot_num>1)
  {
    ROS_ERROR("[collective_decision]friendly index must be 0 or 1! invalid index is %d",robot_num);
    return;
  }
  MoveToPosition(robot_num,RFID_F_x[buff_num],RFID_F_y[buff_num]);
}

int Collective_decision::GetBuffRFIDNum(BuffType buff_type)
{
   for(int i =0;i<6;i++)
   {
      if(buffInfo_.buff_data[i] == buffInfo_.BLUE_HEAL)
      {
        if((color_ == "blue"&&buff_type == FRIENDLY_HEAL)||(color_ == "red"&&buff_type == ENEMY_HEAL))
        {
            return i;
        }
      }
      else if(buffInfo_.buff_data[i] == buffInfo_.RED_HEAL)
      {
        if((color_ == "red"&&buff_type == FRIENDLY_HEAL)||(color_ == "blue"&&buff_type == ENEMY_HEAL))
        {
            return i;
        }
      }
      else  if(buffInfo_.buff_data[i] == buffInfo_.BLUE_RELOAD)
      {
        if((color_ == "blue"&&buff_type == FRIENDLY_AMMO)||(color_ == "red"&&buff_type == ENEMY_AMMO))
        {
            return i;
        }
      }
      else if(buffInfo_.buff_data[i] == buffInfo_.RED_RELOAD)
      {
        if((color_ == "red"&&buff_type == FRIENDLY_AMMO)||(color_ == "blue"&&buff_type == ENEMY_AMMO))
        {
            return i;
        }
      }
   }
   return -1;
}
void Collective_decision::FleeBehaviour(int robot_num)
{
  double range = 3;
  double origin_x = FindRobotPosition(friendly_name_[robot_num]).position.x;
  double origin_y = FindRobotPosition(friendly_name_[robot_num]).position.y;
  double end_x = std::min(FindRobotPosition(friendly_name_[robot_num]).position.x + range,costmap_ptr_->GetCostMap()->GetSizeXWorld());
  double end_y = std::min(FindRobotPosition(friendly_name_[robot_num]).position.y + range,costmap_ptr_->GetCostMap()->GetSizeYWorld());
  int min_cost = 100000;;
  double min_x = origin_x;
  double min_y = origin_y;
  double x = std::max(origin_x - range,0.0);
  double y = std::max(origin_y - range,0.0);
  unsigned int cell_x,cell_y;
  while(x<end_x)
  {
    while(y<end_y)
    {
      costmap_ptr_->GetCostMap()->World2Map(x,y,cell_x,cell_y);
      int new_cost = costmap_ptr_->GetCostMap()->GetCost(cell_x,cell_y) + (hero_common::PointDistance(origin_x,origin_y,x,y) * 3.0);
      if(new_cost < min_cost)
      {
        min_cost = new_cost;
        min_x = x;
        min_y = y;
      }
      y += 0.02;
    }
    x += 0.02;
    y = std::max(origin_y - range,0.0);
  }
   MoveToPosition(robot_num,min_x,min_y);
   ROS_INFO("%s flee to %f,%f",color_.c_str(),min_x,min_y);
}

void Collective_decision::Spin()
{
  RobotStatusUpdate();
  TasksManager();
  TaskAssign();
  if(gameStatus_.game_status == gameStatus_.ROUND)
     RobotsExecutor();





}


void Collective_decision::RobotStatusUpdate()
{
  for(int i = 0; i < 2 ; i++)
  {
    robot_status[i].ammo = FindRobotPosition(robot_status[i].name).ammo;
    robot_status[i].health = FindRobotPosition(robot_status[i].name).health;
    robot_status[i].x = FindRobotPosition(robot_status[i].name).position.x;
    robot_status[i].y = FindRobotPosition(robot_status[i].name).position.y;
    robot_status[i].combat_effectiveness = robot_status[i].ammo * robot_status[i].health;

    enemy_status[i].ammo = FindRobotPosition(enemy_status[i].name).ammo;
    enemy_status[i].health = FindRobotPosition(enemy_status[i].name).health;
    enemy_status[i].x = FindRobotPosition(enemy_status[i].name).position.x;
    enemy_status[i].y = FindRobotPosition(enemy_status[i].name).position.y;
    enemy_status[i].combat_effectiveness = enemy_status[i].ammo * enemy_status[i].health;

  }
}

bool TaskSortFun(const Collective_decision::RobotTask &t1,const Collective_decision::RobotTask &t2)
{
  return (t1.benefit - t1.cost)  > (t2.benefit - t2.cost);
}
void Collective_decision::CalculateCostBenefitCost()
{

  for(int i = 0; i < 2; i ++)
  {
    for (auto task = robot_status[i].candidate_tasks.begin(); task != robot_status[i].candidate_tasks.end(); ++task) {
      switch(task->type)
      {
      case ATTACK_ROBOT_0:
        if(enemy_status[0].health > 0)
          task->benefit = 4 + (2000 - enemy_status[0].health) / 350.0;
        else
          task->benefit = 0;
        task->cost = std::min(enemy_status[0].ammo,30) / 10.0;
        break;
      case ATTACK_ROBOT_1:
        if(enemy_status[1].health > 0)
          task->benefit = 4 + (2000 - enemy_status[1].health) / 350.0;
        else
          task->benefit = 0;
        task->cost = std::min(enemy_status[1].ammo,30) / 10.0;
        break;
      case GET_AMMO:
        if(!buffInfo_.activated[GetBuffRFIDNum(FRIENDLY_AMMO)])
          task->benefit = (200 - robot_status[0].ammo - robot_status[1].ammo) / 2.0 +
              3.0 / hero_common::PointDistance(robot_status[i].x,robot_status[i].y,RFID_F_x[GetBuffRFIDNum(FRIENDLY_AMMO)],RFID_F_y[GetBuffRFIDNum(FRIENDLY_AMMO)]);
        else
          task->benefit = 0;
        task->cost = 0;
        break;
      case GET_HEALTH:
        if(!buffInfo_.activated[GetBuffRFIDNum(FRIENDLY_HEAL)] && (4000 - robot_status[0].health - robot_status[1].health) > 50)
          task->benefit = (4000 - robot_status[0].health - robot_status[1].health) / 100.0 +
              3.0 / hero_common::PointDistance(robot_status[i].x,robot_status[i].y,RFID_F_x[GetBuffRFIDNum(FRIENDLY_HEAL)],RFID_F_y[GetBuffRFIDNum(FRIENDLY_HEAL)]);
        else
          task->benefit = 0;
        task->cost = 0;
        break;
      case GET_ENEMY_HEALTH:
        if(!buffInfo_.activated[GetBuffRFIDNum(ENEMY_HEAL)] && (4000 - enemy_status[0].health - enemy_status[1].health) < 50)
          task->benefit = (enemy_status[0].health + enemy_status[1].health - 3950) / 20.0 +
              5.0 / hero_common::PointDistance(robot_status[i].x,robot_status[i].y,RFID_F_x[GetBuffRFIDNum(ENEMY_HEAL)],RFID_F_y[GetBuffRFIDNum(ENEMY_HEAL)]);
        else
          task->benefit = 0;
        task->cost = 0;
         //ROS_INFO("%s %s benefit %f",color_.c_str(),robot_status[0].name.c_str(),task->benefit);
        break;
      case FLEE:
        task->benefit = (2000 - robot_status[i].health) / 200.0;
        task->cost = 0;
        break;
      default:
        break;
      }
    }
    sort(robot_status[i].candidate_tasks.begin(), robot_status[i].candidate_tasks.end(), TaskSortFun);
  }

}

void Collective_decision::TasksManager()
{
  CalculateCostBenefitCost();
}

void Collective_decision::RobotsExecutor()
{
  for(int i = 0; i < 2; i++)
  {
    if(robot_status[i].task)
    {
      TaskExecutor(i, robot_status[i].task);
    }
  }
}

void Collective_decision::TaskExecutor(int robot_num, RobotTask *task)
{
  switch(task->type)
  {
  case ATTACK_ROBOT_0:
    AttackRobot(robot_num,0);
    break;
  case ATTACK_ROBOT_1:
     AttackRobot(robot_num,1);
    break;
  case GET_AMMO:
   GoGetBuff(robot_num ,GetBuffRFIDNum(FRIENDLY_AMMO));
    break;
  case GET_HEALTH:
   GoGetBuff(robot_num ,GetBuffRFIDNum(FRIENDLY_HEAL));
    break;
  case GET_ENEMY_HEALTH:
   GoGetBuff(robot_num ,GetBuffRFIDNum(ENEMY_HEAL));
    break;
  case FLEE:
    FleeBehaviour(robot_num);
    break;
  default:
    break;
  }
}

void Collective_decision::TaskAssign()
{
  if(robot_status[0].candidate_tasks[0].type == robot_status[1].candidate_tasks[0].type &&
  (robot_status[0].candidate_tasks[0].type == GET_AMMO || robot_status[0].candidate_tasks[0].type == GET_HEALTH ||
   robot_status[0].candidate_tasks[0].type == GET_ENEMY_HEALTH) &&
     (robot_status[0].health > 0 && robot_status[1].health > 0))
  {
    if(TaskSortFun(robot_status[0].candidate_tasks[0],robot_status[1].candidate_tasks[0]))
    {
      robot_status[0].task = &(robot_status[0].candidate_tasks[0]);
      robot_status[1].task = &(robot_status[1].candidate_tasks[1]);
    }
    else
    {
      robot_status[0].task = &(robot_status[0].candidate_tasks[1]);
      robot_status[1].task = &(robot_status[1].candidate_tasks[0]);
    }
  }
  else
  {
    robot_status[0].task = &(robot_status[0].candidate_tasks[0]);
    robot_status[1].task = &(robot_status[1].candidate_tasks[0]);
  }
}

}







int main(int argc, char **argv)
{
  struct timeval tv;
  struct timezone tz;
  int ms = 0;
  int ms_last = 0;
  ros::init(argc, argv, "collective_decision");
  ros::NodeHandle nh;
  std::string color;
  if(nh.getNamespace().substr(2)=="red_decision")
    color  ="red";
  else if(nh.getNamespace().substr(2)=="blue_decision")
    color = "blue";
  else
    ROS_ERROR("[collective_decision]Invalie namespace: %s",nh.getNamespace().substr(2).c_str());


  hero_decision::Collective_decision collective_decision(color);
  ros::start();
  while ( ros::ok() ) {
    gettimeofday(&tv,&tz);
    ms_last = tv.tv_sec*1000 + tv.tv_usec/1000;

    collective_decision.Spin();

    gettimeofday(&tv,&tz);
    ms = tv.tv_sec*1000 + tv.tv_usec/1000;
    if(ms - ms_last <hero_decision::LoopTimeMs)
      std::this_thread::sleep_for(std::chrono::milliseconds(hero_decision::LoopTimeMs -(ms - ms_last)));
    ros::spinOnce();
  }

  return 0;
}

