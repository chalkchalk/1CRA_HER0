#include "robot_physics.h"
#include <string>
#include <sstream>
#include <iostream>
#include "stdio.h"
#include <tf/transform_listener.h>
#include <tf/tf.h>
#include <tf/transform_broadcaster.h>
#include "hero_msgs/BulletsInfo.h"
#include <vector>
#include "hero_math/geometry.h"
#include "hero_math/math.h"
#include <thread>
#include <sys/time.h>
#include <cstdlib>// Header file needed to use rand
#include "hero_map/hero_map.h"
#include "std_msgs/Float32.h"


namespace HeroMultistage {

    using hero_common::ErrorCode;
    using hero_common::ErrorInfo;
    using namespace std;


    RobotPhysics::RobotPhysics()
    {
        if (Init().IsOK()) {
         ROS_INFO("[robot physics]initialization completed.");
       } else {
         ROS_ERROR("[robot physics] Initialization failed.");
       }
    }

    ErrorInfo RobotPhysics::Init() {

        GetParam(&nh_);
        tf::TransformListener listener;
        robot_tf_received_[0] = listener.waitForTransform("/map","robot_0/odom",ros::Time(0),ros::Duration(5));
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


        judgeStatus_sub_[0] = nh_.subscribe<hero_msgs::RobotStatus>("/judgeSysInfo/robot_0/status", 1000,&RobotPhysics::RobotStatusCallback0,this);
        judgeStatus_sub_[1] = nh_.subscribe<hero_msgs::RobotStatus>("/judgeSysInfo/robot_1/status", 1000,&RobotPhysics::RobotStatusCallback1,this);
        judgeStatus_sub_[2] = nh_.subscribe<hero_msgs::RobotStatus>("/judgeSysInfo/robot_2/status", 1000,&RobotPhysics::RobotStatusCallback2,this);
        judgeStatus_sub_[3] = nh_.subscribe<hero_msgs::RobotStatus>("/judgeSysInfo/robot_3/status", 1000,&RobotPhysics::RobotStatusCallback3,this);

        bulletsInfo_pub_ = nh_.advertise<hero_msgs::BulletsInfo>("robot_physic/bullet_info",5);

        gimbalYaw_pub_[0] = nh_.advertise<std_msgs::Float32>("robot_0/gimbal_yaw_relative",5);
        gimbalYaw_pub_[1] = nh_.advertise<std_msgs::Float32>("robot_1/gimbal_yaw_relative",5);
        gimbalYaw_pub_[2] = nh_.advertise<std_msgs::Float32>("robot_2/gimbal_yaw_relative",5);
        gimbalYaw_pub_[3] = nh_.advertise<std_msgs::Float32>("robot_3/gimbal_yaw_relative",5);

        judgeSysClient_ = nh_.serviceClient<hero_msgs::JudgeSysControl>("judgesys_control");
        static_map_srv_ = nh_.serviceClient<nav_msgs::GetMap>("/static_map");
        ros::service::waitForService("/static_map", -1);
        nav_msgs::GetMap::Request req;
        nav_msgs::GetMap::Response res;
        if(static_map_srv_.call(req,res)) {
        ROS_INFO( "Received Static Map");
        map_ = res.map;
        } else{

        ROS_ERROR ("Get static map failed");
        }


        return ErrorInfo(ErrorCode::OK);
    }

    void RobotPhysics::GetParam(ros::NodeHandle *nh)
    {
        nh->param<double>("RFID_F1_x", RFID_F_x[0], 7.63);
        nh->param<double>("RFID_F1_y", RFID_F_y[0], 1.8);
        nh->param<double>("RFID_F2_x", RFID_F_x[1], 6.23);
        nh->param<double>("RFID_F2_y", RFID_F_y[1], 3.225);
        nh->param<double>("RFID_F3_x", RFID_F_x[2], 4.03);
        nh->param<double>("RFID_F3_y", RFID_F_y[2], 0.49);
        nh->param<double>("RFID_F4_x", RFID_F_x[3], 0.45);
        nh->param<double>("RFID_F4_y", RFID_F_y[3], 3.34);
        nh->param<double>("RFID_F5_x", RFID_F_x[4], 1.85);
        nh->param<double>("RFID_F5_y", RFID_F_y[4], 1.915);
        nh->param<double>("RFID_F6_x", RFID_F_x[5], 4.05);
        nh->param<double>("RFID_F6_y", RFID_F_y[5], 4.9);
        nh->param<double>("RFID_height", RFID_height, 0.4);
        nh->param<double>("RFID_width", RFID_width, 0.46);
    }

    bool RobotPhysics::AddRobot(RobotTF *robot)
    {
        if (FindRobot(robot->GetName()))
        {
            ROS_ERROR("[robot physics]%s already exist!",robot->GetName().c_str());
             return false;
        }
        robots_.push_back(robot);
        return true;
    }

    RobotTF* RobotPhysics::FindRobot(std::string robot_name)
    {
        for (auto it = robots_.begin(); it != robots_.end(); ++it) {
            if((*it)->GetName() == robot_name)
            {
                return (*it);
            }
        }
        return nullptr;
    }

    void RobotPhysics::PoseCallback(const nav_msgs::Odometry::ConstPtr& msg)
    {
      if(msg->header.frame_id.length()>9){
            std::string robot_name = ((std::string)(msg->header.frame_id)).substr(1,7);
            int i = robot_name.c_str()[6] - '0';
            if(i > 3)
            {
                ROS_ERROR("robot_%d? What the hell?",i);
                return;
            }
            tf::Quaternion q(msg->pose.pose.orientation.x,msg->pose.pose.orientation.y,msg->pose.pose.orientation.z,msg->pose.pose.orientation.w);
            tf::TransformBroadcaster broadcaster;
            RobotTF *robotf = FindRobot(robot_name);
            if( robotf == nullptr)
            {
                ROS_ERROR("%s? What the hell?",robot_name.c_str());
                return;
            }
            robotf->robot_tf.setOrigin(tf::Vector3(msg->pose.pose.position.x,msg->pose.pose.position.y,0));
            robotf->robot_tf.setRotation(q);
            broadcaster.sendTransform(tf::StampedTransform(robotf->robot_tf,ros::Time::now(),"map",robot_name + "/base_pose_ground_truth"));

            robotf->PublishArmorTF();
        }
    }

    void RobotPhysics::PublishGimbalYaw()
    {
        int i;
        for(i=0;i<4;i++)
        {
            gimbalYaw_pub_[i].publish(robots_[i]->GetGimbalYaw());
        }

    }



    int RobotPhysics::ArmorHitDetect()
    {
        int i,j;
        //static int time = 0;
        std::string robot_name[4] = {"robot_0","robot_1","robot_2","robot_3"};
        std::string aromor_name[4] = {"armor_front","armor_right","armor_back","armor_left"};
        std::vector<Point2D> pointsTest;
        int hitResult = 0;
        for(i=0;i<4;i++)//4 robots
        {

            if(robot_tf_received_[i])
            {
                for(auto iter=bullets_.begin(); iter!=bullets_.end(); )
                {

                hitResult = robots_[i]->BulletHitDetect(**iter,&pointsTest);
               // ROS_INFO("hitResult = %d",hitResult);
                    if(hitResult)
                    {
                        if(hitResult > 0 && hitResult < 5)
                        {
                            ROS_INFO("%s hit %s %s",(*iter)->GetShooter().c_str(), robot_name[i].c_str(),aromor_name[hitResult - 1].c_str());
                            SendHitRobotInfo(robot_name[i],hitResult - 1);
                        }

                         iter = bullets_.erase(iter);
                    }
                    else
                         iter ++;
                    }
     /*           for (auto it = pointsTest.begin(); it != pointsTest.end(); ++it) {
                    bullets_.emplace_back(new Bullet("test",(*it).X(),(*it).Y(),0,0));
                }
*/
                }
            }

        //time++;
        //ROS_INFO("time:%d",time);

        return 0;
    }

    void RobotPhysics::BulletJudge()
    {


        for(auto iter=bullets_.begin(); iter!=bullets_.end(); )
        {
            //hero_common::Polygon2D

             if( (*iter)->ReachBoundary(8,8)||
                     hero_common::LineSegmentIsIntersectMapObstacle(&map_,(*iter)->GetPositionNow().X(),(*iter)->GetPositionNow().Y(),
                                                                    (*iter)->GetPositionLast().X(),(*iter)->GetPositionLast().Y()))
                  iter = bullets_.erase(iter);
              else
                 iter ++ ;
        }




    }


    void RobotPhysics::PublishBulletsInfo()
    {
        int i = 0;
        hero_msgs::BulletsInfo bulletInfo;
        bulletInfo.bullet_num = bullets_.size();
        for(i = 0; i< bullets_.size();i++)
        {
            bulletInfo.bullets.emplace_back(bullets_.at(i)->GetBulletMove());
        }
        bulletsInfo_pub_.publish(bulletInfo);

    }
    void RobotPhysics::RobotShoot(std::string robot_name)
    {
        RobotTF *robotf = FindRobot(robot_name);
        float yaw_distribute = ((rand()%2000)/1000.0f - 1) * DistributeYaw;
        if(robot_name=="robot_0")
        {
            if(roboStatus_[0].remain_ammo <= 0||roboStatus_[0].remain_hp<=0 || !roboStatus_[0].shooter_output)
                return;
        }
        else if(robot_name=="robot_1")
        {
            if(roboStatus_[1].remain_ammo <= 0 || roboStatus_[1].remain_hp<=0 || !roboStatus_[1].shooter_output)
                return;
        }
        else if(robot_name=="robot_2")
        {
            if(roboStatus_[2].remain_ammo <= 0||roboStatus_[2].remain_hp<=0 || !roboStatus_[1].shooter_output )
                return;
        }
        else if(robot_name=="robot_3")
        {
            if(roboStatus_[3].remain_ammo <= 0||roboStatus_[3].remain_hp<=0 || !roboStatus_[1].shooter_output)
                return;
        }
        else
            return;

        if(robotf)
        {

            SendShootRobotInfo(robot_name);
            bullets_.emplace_back(new Bullet(robot_name,robotf->robot_tf.getOrigin().getX(),robotf->robot_tf.getOrigin().getY(),robotf->GetGimbalAbsoluteYaw() + yaw_distribute,23));
        }
    }

    void RobotPhysics::LetBulletsFly(int fre)
    {
        int i;
        for(i = 0; i< bullets_.size();i++)
        {
            bullets_.at(i)->Move(fre);
        }
    }

    void RobotPhysics::SendHitRobotInfo(std::string robot_name, int armor_num)
    {
        SendJudgeSysRequest(robot_name,hero_common::JudgeSysCommand::ARMOR_HIT_FRONT + armor_num);
    }

    void RobotPhysics::SendShootRobotInfo(std::string robot_name)
    {
        SendJudgeSysRequest(robot_name,hero_common::JudgeSysCommand::SHOOT_BULLET);
    }

    void RobotPhysics::RobotStatusCallback0(const hero_msgs::RobotStatus::ConstPtr& msg)
    {
        SetRobotStatus(msg,0);

    }

    void RobotPhysics::RobotStatusCallback1(const hero_msgs::RobotStatus::ConstPtr& msg)
    {
        SetRobotStatus(msg,1);

    }
    void RobotPhysics::RobotStatusCallback2(const hero_msgs::RobotStatus::ConstPtr& msg)
    {
        SetRobotStatus(msg,2);

    }
    void RobotPhysics::RobotStatusCallback3(const hero_msgs::RobotStatus::ConstPtr& msg)
    {
        SetRobotStatus(msg,3);

    }
    void RobotPhysics::SetRobotStatus(const hero_msgs::RobotStatus::ConstPtr& msg, int index)
    {
        roboStatus_[index] = *msg;

    }
    void RobotPhysics::RFID_detect()
    {
        int i,j;
        static int infoDivider;

        for(i = 0;i<4;i++)//robot
        {
            for(j = 0;j<6;j++)//RFID
            {
                if(hero_common::PointInRect(robots_[i]->robot_tf.getOrigin().getX(),robots_[i]->robot_tf.getOrigin().getY(),RFID_F_x[j],RFID_F_y[j],
                                            RFID_F_x[j] + RFID_width ,RFID_F_y[j] + RFID_height))
                {
                    //ROS_INFO("robot: %f,%f",robots_[i]->robot_tf.getOrigin().getX(),robots_[i]->robot_tf.getOrigin().getY());
                    //ROS_INFO("rect %d: %f,%f, %f,%f",j+1,RFID_F_x[j],RFID_F_y[j],RFID_F_x[j] + RFID_width ,RFID_F_y[j] + RFID_height);
                    infoDivider ++;
                    if(infoDivider % 20 == 0)
                         ROS_INFO("%s just pass RFID %d.",robots_[i]->GetName().c_str(),j + 1);
                    SendJudgeSysRequest(robots_[i]->GetName(),hero_common::JudgeSysCommand::RFID_F1 + j);
                     //bullets_.emplace_back(new Bullet("robot",RFID_F_x[j],RFID_F_y[j],0,5));
                }
                else
                    infoDivider = 0;
               // ROS_INFO("robot: %f,%f",robots_[i]->robot_tf.getOrigin().getX(),robots_[i]->robot_tf.getOrigin().getY());
               // ROS_INFO("rect %d: %f,%f, %f,%f",j+1,RFID_F_x[j],RFID_F_y[j],RFID_F_x[j] + RFID_width ,RFID_F_y[j] + RFID_height);
            }
        }
    }

    void RobotPhysics::SendJudgeSysRequest(string robot_name, int command)
    {
        hero_msgs::JudgeSysControl srv;
        srv.request.command = command;
        srv.request.robot_name = robot_name;
        if (judgeSysClient_.call(srv))
            {
                if(srv.response.error_code!=0)
                {
                    ROS_ERROR("judgesys service error:%d\n",srv.response.error_code);
                }

            }
            else
            {
                ROS_ERROR("Failed to call judgesys service");
            }
    }
}



void ROS_Spin()
{
    ros::spin();
}


int main(int argc, char** argv){
    struct timeval tv;
     struct timezone tz;
    int ms = 0;
    int ms_last = 0;
    ros::init(argc, argv, "robot_physics_node");
    HeroMultistage::RobotPhysics robotPhysics;
    std::thread spin_thread(ROS_Spin);
    spin_thread.detach();
    ros::start();
    int divider = 0;
    while ( ros::ok() ) {
        gettimeofday(&tv,&tz);
        ms_last = tv.tv_sec*1000 + tv.tv_usec/1000;
        robotPhysics.PublishGimbalYaw();
        robotPhysics.LetBulletsFly(30);
        robotPhysics.PublishBulletsInfo();
        robotPhysics.BulletJudge();
        robotPhysics.ArmorHitDetect();
        robotPhysics.RFID_detect();
        divider++;
        if(divider%3==0)
        {
          //robotPhysics.RobotShoot("robot_0");
            //robotPhysics.RobotShoot("robot_3");
        }

        gettimeofday(&tv,&tz);
        ms = tv.tv_sec*1000 + tv.tv_usec/1000;
        //ROS_INFO("time used:%d",ms-ms_last);
        if(ms - ms_last <33)
          std::this_thread::sleep_for(std::chrono::milliseconds(33 -(ms - ms_last)));
    }
    return 0;
}


