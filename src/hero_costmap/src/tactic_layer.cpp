#include "tactic_layer.h"
#include "hero_map/hero_map.h"
#include "hero_math/math.h"

namespace hero_costmap {

void TacticLayer::OnInitialize()
{
  ros::NodeHandle nh;
  battleinfo_received_ = false;
  dirmap_ = NULL;
  battle_position_sub_ = nh.subscribe<hero_msgs::BattlePosition>("/simu_decision_info/battle_position",100,&TacticLayer::BattlePositionCallback,this);
  static_map_srv_ = nh.serviceClient<nav_msgs::GetMap>("/static_map");
  ros::Rate temp_rate(10);
  while(!battleinfo_received_) {
    ROS_INFO("TacticLayer waiting battle info");
    ros::spinOnce();
    temp_rate.sleep();
  }
  TacticLayer::MatchSize();

  default_value_ = FREE_SPACE;
  is_enabled_ = true;
  is_current_ = true;
  if(nh.getNamespace().substr(2)=="blue_decision" ||nh.getNamespace().substr(2)=="robot_0"||nh.getNamespace().substr(2) == "robot_1")
  {
    enemy_name_[0] = "robot_2";
    enemy_name_[1] = "robot_3";
  }
  else if(nh.getNamespace().substr(2)=="red_decision" ||nh.getNamespace().substr(2)=="robot_2"||nh.getNamespace().substr(2) == "robot_3")
  {
    enemy_name_[0] = "robot_0";
    enemy_name_[1] = "robot_1";
  }
  else
  {
    ROS_ERROR("tactic layer name error:%s",name_.c_str());
    is_enabled_ = false;
  }

  GetStaticMap();

}

double  TacticLayer::GetTacticCost(double distance, int ammo)
{
  return 60.0/(distance) * (double)std::min(ammo + 3,20) / 20.0;
}

void TacticLayer::UpdateTacticCost(std::string robot_name)
{
  //ROS_INFO("Update enemy: %s cost",robot_name.c_str());
  if(FindRobotPosition(robot_name).health==0)
    return;
  double enemy_x,enemy_y;
  enemy_x = FindRobotPosition(robot_name).position.x;
  enemy_y = FindRobotPosition(robot_name).position.y;
  for(int i =0;i<size_x_*size_y_;i++)
  {
    unsigned int cell_x,cell_y;
    double map_x,map_y;
    Index2Cells(i,cell_x,cell_y);
    Map2World(cell_x,cell_y,map_x,map_y);
    double distance = hero_common::PointDistance(enemy_x,enemy_y,map_x,map_y);
    distance = std::max(0.8,distance);
    if(distance < 5)
    {
      if(!hero_common::LineSegmentIsIntersectMapObstacle(&map_,enemy_x,enemy_y,map_x,map_y,50))
      {
        if(dirmap_[i] == -128)
        {
          costmap_[i] += GetTacticCost(distance,FindRobotPosition(robot_name).ammo);
          dirmap_[i] = (std::atan2(enemy_y - map_y,enemy_x - map_x) / M_PI) * 127;
        }
        else {
          signed char new_dir = (std::atan2(enemy_y - map_y,enemy_x - map_x) / M_PI) * 127;
          double dir_diff = (std::min(std::abs((int)new_dir - (int)dirmap_[i]),254 - std::abs((int)new_dir - (int)dirmap_[i])))*M_PI/127.0;
          costmap_[i] = std::min((unsigned char)(((double)costmap_[i] + GetTacticCost(distance,FindRobotPosition(robot_name).ammo)) * (1.5 - 0.5 * std::cos(dir_diff) )),INSCRIBED_INFLATED_OBSTACLE);
        }
      }
      else
      {
        costmap_[i] += GetTacticCost(distance,FindRobotPosition(robot_name).ammo) * 0.3;
      }
    }
  }
}

hero_msgs::RobotPosition TacticLayer::FindRobotPosition(std::string robot_name)
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


void TacticLayer::BattlePositionCallback(const hero_msgs::BattlePosition::ConstPtr &msg)
{
  battle_position_ = *msg;
  battleinfo_received_ = true;
}

void TacticLayer::Activate() {
  OnInitialize();
}

void TacticLayer::Deactivate() {
  battle_position_sub_.shutdown();
}

void TacticLayer::Reset() {
  OnInitialize();
}

void TacticLayer::MatchSize() {
  Costmap2D *master = layered_costmap_->GetCostMap();
  ResizeMap(master->GetSizeXCell(), master->GetSizeYCell(), master->GetResolution(),
            master->GetOriginX(), master->GetOriginY());
  delete[] dirmap_;
  dirmap_ = new signed char[ size_x_ * size_y_ ];
  ResetDirmap();
}

void TacticLayer::ResetDirmap()
{
  memset(dirmap_, -128, size_x_ * size_y_ * sizeof(signed char));
}

bool TacticLayer::GetStaticMap()
{
  ros::service::waitForService("/static_map", -1);
  nav_msgs::GetMap::Request req;
  nav_msgs::GetMap::Response res;
  if(static_map_srv_.call(req,res)) {
  ROS_INFO( "[TacticLayer]Received Static Map");
  map_ = res.map;
  return true;
  } else{
  ROS_ERROR ("[TacticLayer]Get static map failed");
  return false;
  }
}


void TacticLayer::UpdateBounds(double robot_x,
                               double robot_y,
                               double robot_yaw,
                               double *min_x,
                               double *min_y,
                               double *max_x,
                               double *max_y) {
  if(!layered_costmap_->IsRolling())
  {
    *min_x = std::min(0.0, *min_x);
    *min_y = std::min(0.0, *min_y);
    *max_x = std::max(*max_x, ((double)map_.info.width) * map_.info.resolution);
    *max_y = std::max(*max_y, ((double)map_.info.height) * map_.info.resolution);
  }


}

void TacticLayer::UpdateCosts(Costmap2D &master_grid, int min_i, int min_j, int max_i, int max_j)
{
  if(!battleinfo_received_)
    return;
  ResetMaps();
  ResetDirmap();
  UpdateTacticCost(enemy_name_[0]);
  UpdateTacticCost(enemy_name_[1]);

  //if(!layered_costmap_->IsRollingWindow()) {
    UpdateOverwriteByMax(master_grid, min_i, min_j, max_i, max_j);
    //UpdateOverwriteByAll(master_grid, min_i, min_j, max_i, max_j);
 //   ROS_ERROR("OVERWRITE");
 // }

}



}
