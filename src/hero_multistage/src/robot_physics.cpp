#include "robot_physics.h"
#include <string>
#include <sstream>
#include <iostream>
#include "stdio.h"
#include <tf/transform_listener.h>
#include <tf/tf.h>
#include <tf/transform_broadcaster.h>

namespace HeroMultistage {

    using hero_common::ErrorCode;
    using hero_common::ErrorInfo;

    RobotPhysics::RobotPhysics()
    {
        if (Init().IsOK()) {
         ROS_INFO("[robot physics]initialization completed.");
       } else {
         ROS_ERROR("[robot physics] Initialization failed.");
       }
    }

    ErrorInfo RobotPhysics::Init() {
        tf::TransformListener listener;
        robot_tf_received_[0] = listener.waitForTransform("/map","robot_0/odom",ros::Time(0),ros::Duration(2));
        if(robot_tf_received_[0])
             AddRobot(new RobotTF("robot_0"));
        robot_tf_received_[1] = listener.waitForTransform("/map","robot_1/odom",ros::Time(0),ros::Duration(2));
        if(robot_tf_received_[1])
             AddRobot(new RobotTF("robot_1"));
        robot_tf_received_[2] = listener.waitForTransform("/map","robot_2/odom",ros::Time(0),ros::Duration(2));
        if(robot_tf_received_[2])
             AddRobot(new RobotTF("robot_2"));
        robot_tf_received_[3] = listener.waitForTransform("/map","robot_3/odom",ros::Time(0),ros::Duration(2));
        if(robot_tf_received_[3])
             AddRobot(new RobotTF("robot_3"));

        pose_sub_[0] = nh_.subscribe<nav_msgs::Odometry>("/robot_0/base_pose_ground_truth", 1000,&RobotPhysics::PoseCallback,this);
        pose_sub_[1] = nh_.subscribe<nav_msgs::Odometry>("/robot_1/base_pose_ground_truth", 1000,&RobotPhysics::PoseCallback,this);
        pose_sub_[2] = nh_.subscribe<nav_msgs::Odometry>("/robot_2/base_pose_ground_truth", 1000,&RobotPhysics::PoseCallback,this);
        pose_sub_[3] = nh_.subscribe<nav_msgs::Odometry>("/robot_3/base_pose_ground_truth", 1000,&RobotPhysics::PoseCallback,this);



        return ErrorInfo(ErrorCode::OK);
    }

    bool RobotPhysics::AddRobot(RobotTF *robot)
    {
        if (ExistRobot(robot->GetName()))
        {
            ROS_ERROR("[robot physics]%s already exist!",robot->GetName().c_str());
             return false;
        }
        robots_.push_back(robot);
        return true;
    }

    bool RobotPhysics::ExistRobot(std::string robot_name)
    {
        for (auto it = robots_.begin(); it != robots_.end(); ++it) {
            if((*it)->GetName() == robot_name)
            {
                return true;
            }
        }
        return false;
    }

    void RobotPhysics::PoseCallback(const nav_msgs::Odometry::ConstPtr& msg)
    {
      if(msg->header.frame_id.length()>9){
            std::string robot_name = ((std::string)(msg->header.frame_id)).substr(1,7);
            //double siny_cosp = 2 * (msg->pose.pose.orientation.w * msg->pose.pose.orientation.z);
            //double cosy_cosp = 1 - 2 * (msg->pose.pose.orientation.z * msg->pose.pose.orientation.z);
            //float yaw = - std::atan2(siny_cosp, cosy_cosp) * 180.0 / 3.14159;

            int i = robot_name.c_str()[6] - '0';
            if(i > 3)
            {
                ROS_ERROR("robot_%d? What the hell?",i);
                return;
            }
            tf::Quaternion q(msg->pose.pose.orientation.x,msg->pose.pose.orientation.y,msg->pose.pose.orientation.z,msg->pose.pose.orientation.w);
            tf::TransformBroadcaster broadcaster;
            robot_tf_[i].setOrigin(tf::Vector3(msg->pose.pose.position.x,msg->pose.pose.position.y,0));
            robot_tf_[i].setRotation(q);
            broadcaster.sendTransform(tf::StampedTransform(robot_tf_[i],ros::Time::now(),"map",robot_name + "/base_pose_ground_truth"));

        }
    }

    void RobotPhysics::PublishTF()
    {
        for (auto it = robots_.begin(); it != robots_.end(); ++it) {
            (*it)->PublishArmorTF();
        }
    }

    void RobotPhysics::BulletJudge()
    {
        int i ,j ;
        std::string armor_name[4] = {"armor_front","armor_left","armor_right","armor_back"};
        tf::TransformListener listener;
        tf::StampedTransform transform;

        for(i=0;i<4;i++)
        {
            if(!robot_tf_received_[i])
                continue;
            for(j=0;j<4;j++)
            {
                std::string str_num;
                std::stringstream ss;
                ss << i;
                ss >> str_num;
                str_num = "robot_" + str_num;


                    // listener.waitForTransform(str_num + "/base_link",str_num + "/" + armor_name[j], ros::Time(0), ros::Duration(0.5));
                     //listener.lookupTransform(str_num + "/" + armor_name[j],"map", ros::Time(0), transform);
                     //listener.waitForTransform(str_num + "/" + armor_name[j] ,"map", ros::Time(0), ros::Duration(0.5));

            }


        }
    }

}


int main(int argc, char** argv){
    ros::init(argc, argv, "robot_physics_node");
    HeroMultistage::RobotPhysics robotPhysics;
    ros::start();
    ros::Rate rate(20);
    while ( ros::ok() ) {
        robotPhysics.PublishTF();
        robotPhysics.BulletJudge();
        ros::spinOnce();
        rate.sleep();
    }
    return 0;
}


