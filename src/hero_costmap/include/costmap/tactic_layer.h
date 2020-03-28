#ifndef TACTIC_LAYER_H
#define TACTIC_LAYER_H

#include <nav_msgs/OccupancyGrid.h>
#include "io/io.h"
#include "map_common.h"
#include "costmap_layer.h"
#include <nav_msgs/GetMap.h>
#include "tf/tf.h"
#include "hero_msgs/RobotPosition.h"
#include "hero_msgs/BattlePosition.h"

namespace hero_costmap {

class TacticLayer : public CostmapLayer {

public:
 TacticLayer() {}
 virtual ~TacticLayer() {}
 virtual void OnInitialize();
 virtual void Activate();
 virtual void Deactivate();
 virtual void Reset();
 virtual void UpdateCosts(Costmap2D& master_grid, int min_i, int min_j, int max_i, int max_j);
 virtual void UpdateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x, double* min_y,
                          double* max_x, double* max_y);
 virtual void MatchSize() ;

private:
 std::string enemy_name_[2];
 hero_msgs::BattlePosition battle_position_;
 ros::Subscriber battle_position_sub_;
 ros::ServiceClient static_map_srv_;
 nav_msgs::OccupancyGrid map_;

 bool battleinfo_received_;
 signed char *dirmap_;
 void BattlePositionCallback(const hero_msgs::BattlePosition::ConstPtr &msg);
 hero_msgs::RobotPosition FindRobotPosition(std::string robot_name);
 bool GetStaticMap();
 void UpdateTacticCost(std::string robot_name);
 void ResetDirmap();
 double GetTacticCost(double distance, int ammo);
};
}
#endif // TACTIC_LAYER_H
