#include "basic_executor.h"
#include <chrono>
#include <sys/time.h>
#include <thread>
#include "hero_map/hero_map.h"
#include "hero_math/math.h"
#include "tf/tf.h"

namespace hero_decision {

BasicExecutor::BasicExecutor()
{
  Init();
  ROS_INFO("[basic_executor]%s init!",my_name_.c_str());
}

void BasicExecutor::Init()
{
  set_yaw = 0;
  yaw_received_ = false;
  yaw_control_received_ = false;
  if(nh_.getNamespace().c_str()!="/"&&nh_.getNamespace().size()>5)
      my_name_ = nh_.getNamespace().substr(2);
  else
      my_name_ = "robot_0";
  ros::Duration(2.0).sleep();
  battle_position_sub_ = nh_.subscribe<hero_msgs::BattlePosition>("/simu_decision_info/battle_position",100,&BasicExecutor::BattlePositionCallback,this);
  yaw_set_sub_ = nh_.subscribe<std_msgs::Float64>("yaw_set",100,&BasicExecutor::YawSetCallback,this);
  yaw_speed_pub_ = nh_.advertise<std_msgs::Float64>("cmd_yaw_speed", 5);
  goalPoint_pub_ = nh_.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal", 5);
  static_map_srv_ = nh_.serviceClient<nav_msgs::GetMap>("/static_map");
  shoot_client_ = nh_.serviceClient<hero_msgs::ShootCmd>("/shoot_server");
  gimbal_aim_client_ =  nh_.serviceClient<hero_msgs::GimbalAim>("gimbal_aim_server");

  GetStaticMap();
}

void BasicExecutor::YawSetCallback(const std_msgs::Float64::ConstPtr &msg)
{
  set_yaw = msg->data;
  yaw_control_received_ = true;

}
bool BasicExecutor::GetStaticMap()
{
  ros::service::waitForService("/static_map", -1);
  nav_msgs::GetMap::Request req;
  nav_msgs::GetMap::Response res;
  if(static_map_srv_.call(req,res)) {
  ROS_INFO( "[basic_executor]Received Static Map");
  map_ = res.map;
  return true;
  } else{
  ROS_ERROR ("[basic_executor]Get static map failed");
  return false;
  }
}

bool BasicExecutor::Shoot()
{
  hero_msgs::ShootCmd shootCmd;
  shootCmd.request.robot_num = my_name_;
  shootCmd.request.mode = shootCmd.request.ONCE;
  if (shoot_client_.call(shootCmd))
    {


    }
    else
    {
        ROS_ERROR("[basic_executor]Failed to call shoot server");
    }
}

void BasicExecutor::BattlePositionCallback(const hero_msgs::BattlePosition::ConstPtr &msg)
{
  battle_position_ = *msg;
  if(!yaw_received_)
  {
    yaw_received_ = true;
    set_yaw = FindRobotPosition(my_name_).position.yaw;
  }

}

hero_msgs::RobotPosition BasicExecutor::FindRobotPosition(std::string robot_name)
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

int BasicExecutor::CanShootRobot(std::string robot_name)
{
  int return_val = 0;
  double min_distance = 100;
  double distance_of_other_robot = 100;
  if(robot_name == my_name_)
  {
    ROS_WARN("[basic_executor]Shoot yourself? Dangerous idea...");
    return 0;
  }
  //ROS_INFO("%s:%f,%f",my_name_.c_str(),FindRobotPosition(my_name_).position.x,FindRobotPosition(my_name_).position.y);
  for(int i =0;i<4;i++)
  {
    //ROS_INFO("%s[%d]:%f,%f",robot_name.c_str(),i,FindRobotPosition(robot_name).armor_plates[i].x,FindRobotPosition(robot_name).armor_plates[i].y);
    if(FindRobotPosition(robot_name).health>0&&(!hero_common::LineSegmentIsIntersectMapObstacle(&map_,FindRobotPosition(robot_name).armor_plates[i].x,FindRobotPosition(robot_name).armor_plates[i].y,
                                                   FindRobotPosition(my_name_).position.x,FindRobotPosition(my_name_).position.y,50))&&
       hero_common::PointDistance(FindRobotPosition(robot_name).armor_plates[i].x,FindRobotPosition(robot_name).armor_plates[i].y,
                                  FindRobotPosition(my_name_).position.x,FindRobotPosition(my_name_).position.y)<hero_decision::MaxShootRange)
    {
      //ROS_INFO("can see you.");

      for(int j =0;j<4;j++)
      {
        if(RobotName[j] == my_name_||RobotName[j]==robot_name)
          continue;
        double new_other_robot_distance =  hero_common::PointToLineDistance(FindRobotPosition(RobotName[j]).position.x,
                                                                            FindRobotPosition(RobotName[j]).position.y,
                                                                            FindRobotPosition(robot_name).armor_plates[i].x,
                                                                            FindRobotPosition(robot_name).armor_plates[i].y,
                                                                            FindRobotPosition(my_name_).position.x,
                                                                            FindRobotPosition(my_name_).position.y);
        if(new_other_robot_distance<distance_of_other_robot)
          distance_of_other_robot = new_other_robot_distance;
        }
        //ROS_INFO("%s distance = %f",RobotName[j].c_str()  ,distance_of_other_robot);
        if(distance_of_other_robot> 0.6)
        {
          double new_distance = hero_common::PointDistance(FindRobotPosition(robot_name).armor_plates[i].x,FindRobotPosition(robot_name).armor_plates[i].y,
                                                           FindRobotPosition(my_name_).position.x,FindRobotPosition(my_name_).position.y);
          if(new_distance<min_distance)
          {
            min_distance = new_distance;//find the closet armor plate
            return_val = i + 1;
            /*
            if(i==0)
              return_val=1;
            else if(i==1||i==3)
              return_val=2;
            else if(i==2)
              return_val=3;*/
          }

        }


    }
  }
  return return_val;

}

bool BasicExecutor::AimRobot(std::string robot_name)
{
  int aim_vel = CanShootRobot(robot_name);
  if(aim_vel)
  {
    return GimbalAimPoint(FindRobotPosition(robot_name).armor_plates[aim_vel-1].x,FindRobotPosition(robot_name).armor_plates[aim_vel-1].y);//aim at armor plate
  }
  else {
    {
      GimbalAimPoint(FindRobotPosition(robot_name).position.x,FindRobotPosition(robot_name).position.y);// aim at the middle of chassis(preparing to shoot)
      return false;
    }
  }
}

bool BasicExecutor::GimbalAimPoint(double x, double y)
{
  hero_msgs::GimbalAim gimbal_aim;
  gimbal_aim.request.set_angle_absolute = hero_common::GetlinesegmentAngle(FindRobotPosition(my_name_).position.x,FindRobotPosition(my_name_).position.y,
                                                                           x,y);
  if(!gimbal_aim_client_.call(gimbal_aim))
    ROS_ERROR("[basic_executor]Fail to call gimbal server!");
  return gimbal_aim.response.aimed;
}

bool BasicExecutor::EngageRobot(std::string robot_name)
{
  FaceRobot(robot_name);
  if(AimRobot(robot_name))
  {
    Shoot();
  }
}

std::string BasicExecutor::FindClosetAimableEnemy()
{
  double min_distance = 100;
  double min_aimbal_distance = 100;
  double new_distance;
  std::string closet_target = "no target";
  std::string closet_aimable_target = "no target";
  for (auto it = battle_position_.robots_position.begin(); it != battle_position_.robots_position.end(); ++it) {
    if(it->health==0)
      continue;
    if(my_name_=="robot_0"||my_name_=="robot_1")
    {
      if(it->robot_name =="robot_0"||it->robot_name =="robot_1")
        continue;
    }
    if(my_name_=="robot_2"||my_name_=="robot_3")
    {
      if(it->robot_name =="robot_2"||it->robot_name =="robot_3")
        continue;
    }

    new_distance = hero_common::PointDistance(it->position.x,it->position.y,FindRobotPosition(my_name_).position.x,FindRobotPosition(my_name_).position.y);
    if(new_distance<min_distance)
    {
      closet_target = it->robot_name;
      min_distance = new_distance;
    }
    if(CanShootRobot(it->robot_name))
    {
      if(new_distance<min_aimbal_distance)
      {
        min_aimbal_distance = new_distance;
        closet_aimable_target = it->robot_name;
      }
    }
  }
  if(closet_aimable_target != "no target")
     return closet_aimable_target;
  else {
    return closet_target;
  }
}

void BasicExecutor::YawControlLoop()
{

  if(!(yaw_received_&&yaw_control_received_))
    return;
  double yaw_err = FindRobotPosition(my_name_).position.yaw - set_yaw;
  static double i_out;
  if(yaw_err>M_PI)
    yaw_err-=M_PI*2;
  if(yaw_err<-M_PI)
    yaw_err+=M_PI*2;

  i_out += -yaw_err*0.003;
  if(i_out>hero_decision::I_OUT_YAW)
     i_out=hero_decision::I_OUT_YAW;
  if(i_out<-hero_decision::I_OUT_YAW)
     i_out=-hero_decision::I_OUT_YAW;

  set_yaw_speed_ = -yaw_err*3 + i_out;

   //ROS_ERROR("set_yaw = %f, chassis_yaw - %f, yaw_err = %f",set_yaw,FindRobotPosition(my_name_).position.yaw,yaw_err);

  std_msgs::Float64 msg;
  msg.data = set_yaw_speed_;
  yaw_speed_pub_.publish(msg);
}

bool BasicExecutor::ApproachEnemy(std::string robot_name,double contact_distance)
{
  static int divider =0;
  divider++;
  if(divider==10)
  {
    divider =0;
  }
  else {
    return false;
  }
  double enemy_x = FindRobotPosition(robot_name).position.x;
  double enemy_y = FindRobotPosition(robot_name).position.y;
  double goto_x = enemy_x;
  double goto_y = enemy_y;
  int scan_num = 20;

  double min_distance=1000;
  for(int i=0;i<scan_num;i++)
  {
    double new_x = enemy_x+contact_distance*std::cos(((double)i)/scan_num * 2 * M_PI);
    double new_y = enemy_y+contact_distance*std::sin(((double)i)/scan_num * 2 * M_PI);
    if(hero_common::LineSegmentIsIntersectMapObstacle(&map_,enemy_x,enemy_y,new_x,new_y)==0)
    {
      double distance_of_other_robot = 100;
      for(int j =0;j<4;j++)
      {
        if(RobotName[j] == my_name_||RobotName[j]==robot_name)
          continue;
        double new_other_robot_distance =  hero_common::PointToLineDistance(FindRobotPosition(RobotName[j]).position.x,
                                                                            FindRobotPosition(RobotName[j]).position.y,
                                                                            new_x,
                                                                            new_y,
                                                                            FindRobotPosition(robot_name).position.x,
                                                                            FindRobotPosition(robot_name).position.y);
        if(new_other_robot_distance<distance_of_other_robot)
          distance_of_other_robot = new_other_robot_distance;
      }


      if(distance_of_other_robot> 0.6)
      {
        double new_distance = hero_common::PointDistance(FindRobotPosition(my_name_).position.x,FindRobotPosition(my_name_).position.y,
                                                         new_x,new_y);
        if(new_distance<min_distance)
        {
          min_distance = new_distance;
          goto_x = new_x;
          goto_y = new_y;
        }
      }



      }



   }
  geometry_msgs::PoseStamped pose;
  pose.pose.position.x = goto_x;
  pose.pose.position.y = goto_y;
  pose.pose.position.z = 0;
  pose.pose.orientation = tf::createQuaternionMsgFromYaw(0);
  goalPoint_pub_.publish(pose);
  return true;
}

void BasicExecutor::FaceRobot(std::string robot_name)
{
    yaw_control_received_ = true;
    set_yaw = hero_common::GetlinesegmentAngle(FindRobotPosition(my_name_).position.x,FindRobotPosition(my_name_).position.y,
                                               FindRobotPosition(robot_name).position.x,FindRobotPosition(robot_name).position.y);
}

}


int main(int argc, char **argv)
{
  struct timeval tv;
  struct timezone tz;
  int ms = 0;
  int ms_last = 0;
  ros::init(argc, argv, "simu_basic_executor");
  hero_decision::BasicExecutor basic_executor;
  ros::start();
  while ( ros::ok() ) {
    gettimeofday(&tv,&tz);
    ms_last = tv.tv_sec*1000 + tv.tv_usec/1000;

    //if(basic_executor.GetName()!="robot_0")
   // {basic_executor.EngageRobot(basic_executor.FindClosetAimableEnemy());

   // }

    //if(basic_executor.GetName()=="robot_2")
    {
       basic_executor.EngageRobot(basic_executor.FindClosetAimableEnemy());
       basic_executor.ApproachEnemy(basic_executor.FindClosetAimableEnemy(),2.0);

    }

    basic_executor.YawControlLoop();










    gettimeofday(&tv,&tz);
    ms = tv.tv_sec*1000 + tv.tv_usec/1000;
    if(ms - ms_last <33)
      std::this_thread::sleep_for(std::chrono::milliseconds(33 -(ms - ms_last)));
  ros::spinOnce();
  }

  return 0;
}
