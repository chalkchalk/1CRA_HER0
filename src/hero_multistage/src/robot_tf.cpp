#include "robot_tf.h"


#define DegreeToRad(a) ((a)* 3.1415926 /180.0)
#define RadToDegree(a) ((a)/ 3.1415926 *180.0)

namespace HeroMultistage {

    using hero_common::ErrorCode;
    using hero_common::ErrorInfo;
    using hero_common::Point2D;
    using hero_common::Polygon2D;

    RobotTF::RobotTF(std::string robot_name):
        gimbal_yaw_(0)
    {
        if (Init(robot_name).IsOK()) {
         ROS_INFO("[robot_physicis]robot %s added.",robot_name.c_str());
       } else {
         ROS_ERROR("[robot_physicis]fail to add robot: %s.",robot_name.c_str());
       }
    }

    ErrorInfo RobotTF::Init(std::string robot_name) {
        robot_name_ = robot_name;

        return ErrorInfo(ErrorCode::OK);
    }


    void RobotTF::PublishArmorTF()
    {
        tf::Transform transform;
        tf::Quaternion q;

        armor_tf[0].setOrigin(tf::Vector3(RobotLength/2,0,0));
        q.setRPY(0,0,DegreeToRad(0));
        armor_tf[0].setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(armor_tf[0],ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_front"));

        armor_tf[3].setOrigin(tf::Vector3(- RobotLength/2,0,0));
        q.setRPY(0,0,DegreeToRad(180));
        armor_tf[3].setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(armor_tf[3],ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_back"));

        armor_tf[1].setOrigin(tf::Vector3(0,RobotWidth/2,0));
        q.setRPY(0,0,DegreeToRad(90));
        armor_tf[1].setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(armor_tf[1],ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_left"));

        armor_tf[2].setOrigin(tf::Vector3(0, - RobotWidth /2,0));
        q.setRPY(0,0,DegreeToRad(-90));
        armor_tf[2].setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(armor_tf[2],ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_right"));

        q.setRPY(0,0,DegreeToRad(gimbal_yaw_));
        transform.setOrigin(tf::Vector3(0,0,0));
        transform.setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/gimbal"));


    }

    float RobotTF::GetGimbalAbsoluteYaw()
    {
        double roll,pitch,yaw;
        tf::Matrix3x3(robot_tf.getRotation()).getRPY(roll, pitch, yaw);
        gimbal_yaw_absolute_ = RadToDegree(yaw + gimbal_yaw_);
        return gimbal_yaw_absolute_;

    }

    Polygon2D RobotTF::GetArmorPoly(int num)//front left right back 0 1 2 3
    {
        std::vector<Point2D> points;
        double armorRoll,armroPitch,armorYaw;
        double chassisRoll,chassisPitch,chassisrYaw;
        double armroYawAbsolute;
//front left right back 0 1 2 3
        if(num > 3 || num < 0)
        {
            ROS_ERROR("[robot tf]wrong armor number:%d",num);
        }
        tf::Matrix3x3(armor_tf[num].getRotation()).getRPY(armorRoll,armroPitch,armorYaw);
        tf::Matrix3x3(robot_tf.getRotation()).getRPY(chassisRoll,chassisPitch,chassisrYaw);
        armroYawAbsolute = armorYaw + chassisrYaw;
        Point2D armorMid(robot_tf.getOrigin().getX() + std::cos(chassisrYaw)*armor_tf[num].getOrigin().getX() - std::sin(chassisrYaw)*armor_tf[num].getOrigin().getY()
                         ,robot_tf.getOrigin().getY() + std::cos(chassisrYaw)*armor_tf[num].getOrigin().getX() + std::sin(chassisrYaw)*armor_tf[num].getOrigin().getY());


        return Polygon2D(points);
    }

}

