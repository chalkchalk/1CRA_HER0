#include "robot_tf.h"
#include "hero_math/geometry.h"
#include "hero_math/math.h"



namespace HeroMultistage {

    using hero_common::ErrorCode;
    using hero_common::ErrorInfo;
    using hero_common::Point2D;
    using hero_common::Polygon2D;
    using hero_common::LineSegment2D;

    RobotTF::RobotTF(std::string robot_name):
      gimbal_yaw_(0),
      gimbal_yaw_set_(0)
    {
        if (Init(robot_name).IsOK()) {
         ROS_INFO("[robot_physicis]robot %s added.",robot_name.c_str());
       } else {
         ROS_ERROR("[robot_physicis]fail to add robot: %s.",robot_name.c_str());
       }
    }

    ErrorInfo RobotTF::Init(std::string robot_name) {
        ros::NodeHandle nh_;
        robot_name_ = robot_name;
        gimbal_aim_service_ = nh_.advertiseService("/"+robot_name_+"/gimbal_aim_server",&RobotTF::GimbalAim_handle_function,this);
        judgeStatus_sub_ = nh_.subscribe<hero_msgs::RobotStatus>("/judgeSysInfo/"+robot_name_+"/status", 100,&RobotTF::RobotStatusCallback,this);
        return ErrorInfo(ErrorCode::OK);
    }

    void RobotTF::RobotStatusCallback(const hero_msgs::RobotStatus::ConstPtr &msg)
    {
      roboStatus_ = *msg;
    }


    bool RobotTF::GimbalAim_handle_function(hero_msgs::GimbalAim::Request &req, hero_msgs::GimbalAim::Response &res)
    {
      SetGimbalAbsoluteYaw(req.set_angle_absolute);
      res.aimed = (std::abs(hero_common::GetAngleInRange(req.set_angle_absolute - GetGimbalAbsoluteYaw()))<0.02);
      //ROS_INFO("[%s]set %f ,now %f, err = %f",robot_name_.c_str(), req.set_angle_absolute , GetGimbalAbsoluteYaw(),std::abs(hero_common::GetAngleInRange(req.set_angle_absolute - GetGimbalAbsoluteYaw())));
      return true;
    }


    float RobotTF::GetGimbalAbsoluteYaw()
    {
        double roll,pitch,yaw;
        tf::Matrix3x3(robot_tf.getRotation()).getRPY(roll, pitch, yaw);
        gimbal_yaw_absolute_ = (yaw + gimbal_yaw_);
        return hero_common::GetAngleInRange(gimbal_yaw_absolute_);

    }

    void RobotTF::SetGimbalAbsoluteYaw(double set_yaw_absolute)
    {
      double roll,pitch,yaw;
      double set_yaw;
      tf::Matrix3x3(robot_tf.getRotation()).getRPY(roll, pitch, yaw);
      set_yaw = set_yaw_absolute - yaw;
      SetGimbalEncoderYaw(hero_common::GetAngleInRange(set_yaw));
    }

    bool RobotTF::SetGimbalEncoderYaw(double yaw_set)
    {
      if(yaw_set>hero_common::PI*0.5)
        yaw_set = hero_common::PI*0.5;
      if(yaw_set<-hero_common::PI*0.5)
        yaw_set = -hero_common::PI*0.5;//machanical limit
        gimbal_yaw_set_ = yaw_set;

    }

    bool RobotTF::GimbalMove()
    {
      if(roboStatus_.remain_hp==0)
        return false;
      if(gimbal_yaw_set_ - gimbal_yaw_ > GimbalMaxSpeed)
      {
          gimbal_yaw_ += GimbalMaxSpeed;
          return false;
      }
      else if(gimbal_yaw_set_ - gimbal_yaw_ > 0){
        gimbal_yaw_ = gimbal_yaw_set_;
        return true;
      }
      if(gimbal_yaw_set_ - gimbal_yaw_ <- GimbalMaxSpeed)
      {
          gimbal_yaw_ -= GimbalMaxSpeed;
          return false;
      }
      else if(gimbal_yaw_set_ - gimbal_yaw_ < 0){
        gimbal_yaw_ = gimbal_yaw_set_;
        return true;
      }
    }

    void RobotTF::PublishArmorTF()
        {
            tf::Transform transform;
            tf::Quaternion q;

            transform.setOrigin(tf::Vector3(RobotWidth/2,0,0));
            q.setRPY(0,0,0);
            transform.setRotation(q);
            broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_front"));

            transform.setOrigin(tf::Vector3(- RobotWidth/2,0,0));
            q.setRPY(0,0,hero_common::PI);
            transform.setRotation(q);
            broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_back"));

            transform.setOrigin(tf::Vector3(0,RobotLength/2,0));
            q.setRPY(0,0,hero_common::PI*0.5);
            transform.setRotation(q);
            broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_left"));

            transform.setOrigin(tf::Vector3(0, - RobotLength /2,0));
            q.setRPY(0,0,-hero_common::PI*0.5);
            transform.setRotation(q);
            broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_right"));

            q.setRPY(0,0,gimbal_yaw_);
            transform.setOrigin(tf::Vector3(0,0,0));
            transform.setRotation(q);
            broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/gimbal"));


        }

    int RobotTF::BulletHitDetect(Bullet bullet,std::vector<Point2D> *pointsfeedback)
    {
        double roll,pitch,yaw;
        int i;
        tf::Matrix3x3(robot_tf.getRotation()).getRPY(roll, pitch, yaw);
        Point2D chassisMid(robot_tf.getOrigin().getX(),robot_tf.getOrigin().getY());
        double chassisYaw = yaw;
        LineSegment2D bulletSeg(bullet.GetPositionNow(),bullet.GetPositionLast());
        Point2D interSectionPoint;
        std::vector<Point2D> pointsIntersect;
        std::vector<int> sides;
        Point2D chassisLeft;
        Point2D chassisRight;
        pointsfeedback->clear();
        pointsfeedback->emplace_back(chassisMid);
        bool isHit = false;
        if(bullet.GetShooter() == robot_name_)
            return 0;
        for(i=0;i<4;i++) //front left back right
        {
          if(i%2)
          {
            chassisLeft = hero_common::PointRotateAroundPoint(Point2D(RobotLength*0.5, RobotWidth*0.5) + chassisMid, chassisMid, chassisYaw - i * 3.14159 * 0.5);
            chassisRight = hero_common::PointRotateAroundPoint(Point2D(RobotLength*0.5, -RobotWidth*0.5) + chassisMid, chassisMid, chassisYaw - i * 3.14159 * 0.5);
          }
          else {

            chassisLeft = hero_common::PointRotateAroundPoint(Point2D(RobotWidth*0.5, RobotLength*0.5) + chassisMid, chassisMid, chassisYaw - i * 3.14159 * 0.5);
            chassisRight = hero_common::PointRotateAroundPoint(Point2D(RobotWidth*0.5, -RobotLength*0.5) + chassisMid, chassisMid, chassisYaw - i * 3.14159 * 0.5);
          }
            pointsfeedback->emplace_back(chassisLeft);
            pointsfeedback->emplace_back(chassisRight);
            chassisSidesMid_[i] = (chassisLeft + chassisRight) * 0.5;
            LineSegment2D chassisEdge(chassisLeft,chassisRight);
            if(hero_common::CheckLineSegmentsIntersection2D(chassisEdge,bulletSeg,&interSectionPoint))
            {
                isHit = true;
                  //if(hero_common::PointDistance(interSectionPoint,chassisSidesMid[i]) < AromrLength * 0.5)
                  //{
                        pointsIntersect.emplace_back(interSectionPoint);
                        sides.emplace_back(i);
                  //}
            }
        }
        if(!isHit)
            return 0;

        Point2D firstPointIntersect;
        double minDistance = 100;
        int index = 0;

        for(i=0;i<pointsIntersect.size();i++)
        {
            if(minDistance > hero_common::PointDistance(bullet.GetPositionLast(),pointsIntersect[i]))
            {
                minDistance = hero_common::PointDistance(bullet.GetPositionLast(),pointsIntersect[i]);
                firstPointIntersect = pointsIntersect[i];
                index = sides[i];
            }

        }
        if(hero_common::PointDistance(firstPointIntersect,chassisSidesMid_[index]) < AromrLength * 0.5)
            return index + 1;
        else {
            return index + 5;
        }
       // ROS_INFO("minDistanceIndex = %d,minDistanceIndex = %f",minDistanceIndex,minDistanceIndex);


    }




}

