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

        bulletsInfo_pub_ = nh_.advertise<hero_msgs::BulletsInfo>("robot_physic/bullet_info",5);


        return ErrorInfo(ErrorCode::OK);
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
            //broadcaster.sendTransform(tf::StampedTransform(robotf->robot_tf,ros::Time::now(),"map",robot_name + "/base_pose_ground_truth"));

            //robotf->PublishArmorTF();
        }
    }

    void RobotPhysics::PublishTF()
    {
        for (auto it = robots_.begin(); it != robots_.end(); ++it) {
            (*it)->PublishArmorTF();
        }
    }

    void ListenTF(tf::TransformListener *listener,std::string map, std::string name, ros::Time time,tf::StampedTransform *tf)
    {
        int i,j;
        for(j=0;j<4;j++)
        {
            try {
                 listener->lookupTransform(map,name, time, *tf);

                }
                catch (tf::TransformException ex) {
                 // ROS_ERROR("%s", ex.what());
                  j--;
                     ros::Duration(0.001).sleep();
                }
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
                        ROS_INFO("%s hit %s %s",(*iter)->GetShooter().c_str(), robot_name[i].c_str(),aromor_name[hitResult - 1].c_str());
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
        int i ,j ;

        tf::TransformListener listener;
        tf::StampedTransform transform;


        for(auto iter=bullets_.begin(); iter!=bullets_.end(); )
        {
            //hero_common::Polygon2D







             if( (*iter)->ReachBoundary(8,8))
                  iter = bullets_.erase(iter);
              else
                 iter ++ ;
        }




    }


    void RobotPhysics::PublishBulletsInfo()
    {
        if(bullets_.size()==0)
            return;
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
        if(robotf)
        {
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
   // int divider = 0;
    while ( ros::ok() ) {
        ms_last = ms;
        //robotPhysics.PublishTF();
        robotPhysics.LetBulletsFly(30);
        robotPhysics.PublishBulletsInfo();
        robotPhysics.BulletJudge();
        robotPhysics.ArmorHitDetect();
        //divider++;
       // if(divider%2==0)
        //{
          robotPhysics.RobotShoot("robot_0");
            //robotPhysics.RobotShoot("robot_3");
       // }

        gettimeofday(&tv,&tz);
        ms = tv.tv_sec*1000 + tv.tv_usec/1000;
       // ROS_INFO("time used:%d",ms-ms_last);
        if(ms - ms_last <33 && ms - ms_last >0)
          std::this_thread::sleep_for(std::chrono::milliseconds(33 -(ms - ms_last)));
    }
    return 0;
}


