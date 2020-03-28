#include "debuff_layer.h"


namespace hero_costmap {

void DebuffLayer::OnInitialize()
{
  ros::NodeHandle nh;
  GetParam(&nh);
  buffinfo_received_ = false;
  listener_ = std::make_shared<tf::TransformListener>(ros::Duration(10));
  buff_info_sub_ = nh.subscribe<hero_msgs::Buffinfo>("/judgeSysInfo/buff_info", 1000,&DebuffLayer::BuffInfoCallback,this);

  ros::Rate temp_rate(10);
  while(!buffinfo_received_) {
    ROS_INFO("DebuffLayer waiting buff_info");
    ros::spinOnce();
    temp_rate.sleep();
  }
  DebuffLayer::MatchSize();


  is_enabled_ = true;
  is_current_ = true;
  default_value_ = FREE_SPACE;
  //if(layered_costmap_->IsRollingWindow())
    inflation_ = 0;
  //else
  //  inflation_ = 0.1;
}

void DebuffLayer::Activate() {
  OnInitialize();
}

void DebuffLayer::Deactivate() {
  buff_info_sub_.shutdown();
}


void DebuffLayer::Reset() {
  OnInitialize();
}

void DebuffLayer::UpdateBounds(double robot_x,
                               double robot_y,
                               double robot_yaw,
                               double *min_x,
                               double *min_y,
                               double *max_x,
                               double *max_y) {
  if(!layered_costmap_->IsRollingWindow()) {
      return;
  }
  else {
     UpdateOrigin(robot_x - GetSizeXWorld() / 2, robot_y - GetSizeYWorld() / 2);
    // ros::NodeHandle nh;
    //ROS_ERROR("%s update x=%f, y=%f",nh.getNamespace().c_str(),robot_x,robot_y);
  }
}

void DebuffLayer::UpdateCosts(Costmap2D &master_grid, int min_i, int min_j, int max_i, int max_j)
{
  if(!buffinfo_received_)
    return;
  //if(!layered_costmap_->IsRollingWindow()) {
    UpdateOverwriteByMax(master_grid, min_i, min_j, max_i, max_j);
    //UpdateOverwriteByAll(master_grid, min_i, min_j, max_i, max_j);
 //   ROS_ERROR("OVERWRITE");
 // }

}


void DebuffLayer::GetParam(ros::NodeHandle *nh)
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
}

void DebuffLayer::BuffInfoCallback(const hero_msgs::Buffinfo::ConstPtr &msg)
{
    buffInfo_ = *msg;
    buffinfo_received_ = true;
    std::vector<geometry_msgs::Point> polygon;
    geometry_msgs::Point point;
    tf::Stamped<tf::Point> stamped_point;
    tf::Stamped<tf::Point> stamped_point_out;
    ResetMaps();
    for(int j =0;j<2;j++)
    {
      inflation_ =std::max(-0.05 * j - 0.05,-0.2);
      for(int i = 0; i < 6; i++)
      {
        if(layered_costmap_->IsRollingWindow())
        {

          polygon.clear();
         try{
            stamped_point.frame_id_ = "/map";

            stamped_point.setX(RFID_F_x[i] - inflation_);
            stamped_point.setY(RFID_F_y[i] - inflation_);
            stamped_point.setZ(0);
            listener_->transformPoint(layered_costmap_->GetGlobalFrameID(),stamped_point ,stamped_point_out);
            point.x = stamped_point_out.getX();
            point.y = stamped_point_out.getY();
            polygon.emplace_back(point);

            stamped_point.setX(RFID_F_x[i] - inflation_);
            stamped_point.setY(RFID_F_y[i] + RFID_height + inflation_);
            stamped_point.setZ(0);
            listener_->transformPoint(layered_costmap_->GetGlobalFrameID(),stamped_point ,stamped_point_out);
            point.x = stamped_point_out.getX();
            point.y = stamped_point_out.getY();
            polygon.emplace_back(point);

            stamped_point.setX(RFID_F_x[i] + RFID_width + inflation_);
            stamped_point.setY(RFID_F_y[i] + RFID_height + inflation_);
            stamped_point.setZ(0);
            listener_->transformPoint(layered_costmap_->GetGlobalFrameID(),stamped_point ,stamped_point_out);
            point.x = stamped_point_out.getX();
            point.y = stamped_point_out.getY();
            polygon.emplace_back(point);

            stamped_point.setX(RFID_F_x[i] + RFID_width + inflation_);
            stamped_point.setY(RFID_F_y[i] - inflation_);
            stamped_point.setZ(0);
            listener_->transformPoint(layered_costmap_->GetGlobalFrameID(),stamped_point ,stamped_point_out);
            point.x = stamped_point_out.getX();
            point.y = stamped_point_out.getY();
            polygon.emplace_back(point);
          }
          catch(tf::TransformException& ex){
            ROS_ERROR("Received an exception : %s", ex.what());
            ros::Duration(1.0).sleep();
          }
        }
        else
        {
          polygon.clear();
          point.x = RFID_F_x[i] - inflation_;
          point.y = RFID_F_y[i] - inflation_;
          polygon.emplace_back(point);

          point.x = RFID_F_x[i] - inflation_;
          point.y = RFID_F_y[i] + RFID_height + inflation_;
          polygon.emplace_back(point);

          point.x = RFID_F_x[i] + RFID_width + inflation_;
          point.y = RFID_F_y[i] + RFID_height + inflation_;
          polygon.emplace_back(point);

          point.x = RFID_F_x[i] + RFID_width + inflation_;
          point.y = RFID_F_y[i] - inflation_;
          polygon.emplace_back(point);
        }



        if((buffInfo_.buff_data[i] == buffInfo_.SHOOT_DEBUFF)&&!buffInfo_.activated[i])
        {
          unsigned char value = 252;
          SetConvexRegionCost(polygon, value);
        }
        else if((buffInfo_.buff_data[i] == buffInfo_.MOVE_DEBUFF)&&!buffInfo_.activated[i])
          {
            unsigned char value = j?LETHAL_OBSTACLE:INSCRIBED_INFLATED_OBSTACLE;
            SetConvexRegionCost(polygon, value);
          }
        else {
          SetConvexRegionCost(polygon, FREE_SPACE);
          //ROS_ERROR("reset set %d",i);
        }
      }
   }

}


}
