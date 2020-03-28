#ifndef DEBUFF_LAYER_H
#define DEBUFF_LAYER_H

#include <nav_msgs/OccupancyGrid.h>
#include "io/io.h"
#include "map_common.h"
#include "costmap_layer.h"
#include "hero_msgs/Buffinfo.h"
#include "tf/tf.h"
namespace hero_costmap {

class DebuffLayer : public CostmapLayer {

 public:
  DebuffLayer() {}
  virtual ~DebuffLayer() {}
  virtual void OnInitialize();
  virtual void Activate();
  virtual void Deactivate();
  virtual void Reset();
  virtual void UpdateCosts(Costmap2D& master_grid, int min_i, int min_j, int max_i, int max_j);
  virtual void UpdateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x, double* min_y,
                           double* max_x, double* max_y);

 private:
  ros::Subscriber buff_info_sub_;
  hero_msgs::Buffinfo buffInfo_;
  bool buffinfo_received_;
  double RFID_F_x[6];
  double RFID_F_y[6];
  double RFID_height;
  double RFID_width;
  std::shared_ptr<tf::TransformListener> listener_;
  double inflation_;
  void GetParam(ros::NodeHandle *nh);
  void BuffInfoCallback(const hero_msgs::Buffinfo::ConstPtr &msg);
};

}












#endif // TACTIC_LAYER_H
