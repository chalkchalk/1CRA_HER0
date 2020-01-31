/**
 * @file /src/qnode.cpp
 *
 * @brief Ros communication central!
 *
 * @date February 2011
 **/

/*****************************************************************************
** Includes
*****************************************************************************/

#include <ros/ros.h>
#include <ros/network.h>
#include <string>
#include <std_msgs/String.h>
#include <sstream>
#include "../include/hero_interface/qnode.hpp"


/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace hero_interface {
using hero_common::JudgeSysCommand;
/*****************************************************************************
** Implementation
*****************************************************************************/

QNode::QNode(int argc, char** argv ,BattleView *parentBattleView) :
    init_argc(argc),
    init_argv(argv),
    parentBattleView_(parentBattleView)
    {
    int i;

    for(i=0;i<4;i++)
        gimbal_yaw_[i] = 0;
}

QNode::~QNode() {
    if(ros::isStarted()) {
      ros::shutdown(); // explicitly needed since we use ros::start();
      ros::waitForShutdown();
    }
    wait();
}

bool QNode::init() {
    ros::init(init_argc,init_argv,"hero_interface");
    if ( ! ros::master::check() ) {
        return false;
    }
    ros::start(); // explicitly needed since our nodehandle is going out of scope.
    ros::NodeHandle n;
    // Add your ros communications here.
    pose_sub_[0] = n.subscribe<nav_msgs::Odometry>("/robot_0/base_pose_ground_truth", 1000,&QNode::PoseCallback,this);
    pose_sub_[1] = n.subscribe<nav_msgs::Odometry>("/robot_1/base_pose_ground_truth", 1000,&QNode::PoseCallback,this);
    pose_sub_[2] = n.subscribe<nav_msgs::Odometry>("/robot_2/base_pose_ground_truth", 1000,&QNode::PoseCallback,this);
    pose_sub_[3] = n.subscribe<nav_msgs::Odometry>("/robot_3/base_pose_ground_truth", 1000,&QNode::PoseCallback,this);
    judgeStatus_sub_[0] = n.subscribe<hero_msgs::RobotStatus>("/judgeSysInfo/robot_0/status", 1000,&QNode::RobotStatusCallback0,this);
    judgeStatus_sub_[1] = n.subscribe<hero_msgs::RobotStatus>("/judgeSysInfo/robot_1/status", 1000,&QNode::RobotStatusCallback1,this);
    judgeStatus_sub_[2] = n.subscribe<hero_msgs::RobotStatus>("/judgeSysInfo/robot_2/status", 1000,&QNode::RobotStatusCallback2,this);
    judgeStatus_sub_[3] = n.subscribe<hero_msgs::RobotStatus>("/judgeSysInfo/robot_3/status", 1000,&QNode::RobotStatusCallback3,this);

    judgeHeat_sub_[0] = n.subscribe<hero_msgs::RobotHeat>("/judgeSysInfo/robot_0/heat_power", 1000,&QNode::RobotHeatCallback0,this);
    judgeHeat_sub_[1] = n.subscribe<hero_msgs::RobotHeat>("/judgeSysInfo/robot_1/heat_power", 1000,&QNode::RobotHeatCallback1,this);
    judgeHeat_sub_[2] = n.subscribe<hero_msgs::RobotHeat>("/judgeSysInfo/robot_2/heat_power", 1000,&QNode::RobotHeatCallback2,this);
    judgeHeat_sub_[3] = n.subscribe<hero_msgs::RobotHeat>("/judgeSysInfo/robot_3/heat_power", 1000,&QNode::RobotHeatCallback3,this);

    gimbal_yaw_sub_[0] = n.subscribe<std_msgs::Float32>("/robot_0/gimbal_yaw_relative", 1000,&QNode::GimbalYawCallback0,this);
    gimbal_yaw_sub_[1] = n.subscribe<std_msgs::Float32>("/robot_1/gimbal_yaw_relative", 1000,&QNode::GimbalYawCallback1,this);
    gimbal_yaw_sub_[2] = n.subscribe<std_msgs::Float32>("/robot_2/gimbal_yaw_relative", 1000,&QNode::GimbalYawCallback2,this);
    gimbal_yaw_sub_[3] = n.subscribe<std_msgs::Float32>("/robot_3/gimbal_yaw_relative", 1000,&QNode::GimbalYawCallback3,this);

    bulletInfo_sub_ =  n.subscribe<hero_msgs::BulletsInfo>("robot_physic/bullet_info", 1000,&QNode::BulletInfoCallback,this);
    gameStatus_sub_ = n.subscribe<hero_msgs::GameStatus>("judgeSysInfo/game_state", 1000,&QNode::GameStatusCallback,this);
    buffInfo_sub_ = n.subscribe<hero_msgs::Buffinfo>("judgeSysInfo/buff_info", 1000,&QNode::BuffInfoCallback,this);

    client_ = n.serviceClient<hero_msgs::JudgeSysControl>("judgesys_control");
    GetParam(&n);

    start();
    return true;
}

void QNode::GetParam(ros::NodeHandle *nh)
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
void QNode::GameStatusCallback(const hero_msgs::GameStatus::ConstPtr &msg)
{
    gameStatus_ = *msg;
}

void QNode::BuffInfoCallback(const hero_msgs::Buffinfo::ConstPtr &msg)
{
    buffInfo_ = *msg;
}

void QNode::PoseCallback(const nav_msgs::Odometry::ConstPtr& msg)
{
  if(msg->header.frame_id.length()>9){
        std::string robot_name = ((std::string)(msg->header.frame_id)).substr(1,7);
        double siny_cosp = 2 * (msg->pose.pose.orientation.w * msg->pose.pose.orientation.z);
        double cosy_cosp = 1 - 2 * (msg->pose.pose.orientation.z * msg->pose.pose.orientation.z);
        float yaw = - std::atan2(siny_cosp, cosy_cosp) * 180.0 / 3.14159;
        parentBattleView_->SetRobotPose(robot_name,msg->pose.pose.position.x,msg->pose.pose.position.y,yaw);
    }
}

void QNode::RobotStatusCallback0(const hero_msgs::RobotStatus::ConstPtr& msg)
{
    SetRobotStatus(msg,0);

}

void QNode::RobotStatusCallback1(const hero_msgs::RobotStatus::ConstPtr& msg)
{
    SetRobotStatus(msg,1);

}
void QNode::RobotStatusCallback2(const hero_msgs::RobotStatus::ConstPtr& msg)
{
    SetRobotStatus(msg,2);

}
void QNode::RobotStatusCallback3(const hero_msgs::RobotStatus::ConstPtr& msg)
{
    SetRobotStatus(msg,3);

}
void QNode::SetRobotStatus(const hero_msgs::RobotStatus::ConstPtr& msg, int index)
{
    roboStatus_[index] = *msg;

}

void QNode::RobotHeatCallback0(const hero_msgs::RobotHeat::ConstPtr& msg)
{
    SetRobotHeat(msg,0);
}

void QNode::RobotHeatCallback1(const hero_msgs::RobotHeat::ConstPtr& msg)
{
    SetRobotHeat(msg,1);
}
void QNode::RobotHeatCallback2(const hero_msgs::RobotHeat::ConstPtr& msg)
{
    SetRobotHeat(msg,2);
}
void QNode::RobotHeatCallback3(const hero_msgs::RobotHeat::ConstPtr& msg)
{
    SetRobotHeat(msg,3);
}

void QNode::SetRobotHeat(const hero_msgs::RobotHeat::ConstPtr& msg,int index)
{
    roboHeat_[index].shooter_heat = msg->shooter_heat;
}

void QNode::GimbalYawCallback0(const std_msgs::Float32::ConstPtr &msg)
{
    gimbal_yaw_[0] = msg->data;
}

void QNode::GimbalYawCallback1(const std_msgs::Float32::ConstPtr &msg)
{
    gimbal_yaw_[1] = msg->data;
}

void QNode::GimbalYawCallback2(const std_msgs::Float32::ConstPtr &msg)
{
    gimbal_yaw_[2] = msg->data;
}

void QNode::GimbalYawCallback3(const std_msgs::Float32::ConstPtr &msg)
{
    gimbal_yaw_[3] = msg->data;
}

bool QNode::init(const std::string &master_url, const std::string &host_url) {
    std::map<std::string,std::string> remappings;
    remappings["__master"] = master_url;
    remappings["__hostname"] = host_url;
    ros::init(remappings,"hero_interface");
    if ( ! ros::master::check() ) {
        return false;
    }
    ros::start(); // explicitly needed since our nodehandle is going out of scope.
    ros::NodeHandle n;
    // Add your ros communications here.
    start();
    return true;
}

void QNode::run() {
    ros::Rate loop_rate(50);
    int count = 0;
    while ( ros::ok() )
    {
        //chatter_publisher.publish(msg);
        ros::spinOnce();
        loop_rate.sleep();
        ++count;
    }
    std::cout << "Ros shutdown, proceeding to close the gui." << std::endl;
    Q_EMIT rosShutdown(); // used to signal the gui for a shutdown (useful to roslaunch)
}

bool QNode::KillRobot(std::string robot_name)
{
   return SendJudgeSysCall(JudgeSysCommand::KILL_ROBOT,robot_name);
}

bool QNode::ReviveRobot(std::string robot_name)
{
  return SendJudgeSysCall(JudgeSysCommand::REVIVE_ROBOT,robot_name);
}

bool QNode::ReloadRobot(std::string robot_name)
{
    return SendJudgeSysCall(JudgeSysCommand::RELOAD_ROBOT,robot_name);
}

bool QNode::DisarmRobot(std::string robot_name)
{
    return SendJudgeSysCall(JudgeSysCommand::DISARM_ROBOT,robot_name);
}
bool QNode::SendJudgeSysCall(int command, std::string robot_name)
{
    hero_msgs::JudgeSysControl srv;
    srv.request.command = command;
    srv.request.robot_name = robot_name;
    if (client_.call(srv))
        {
            if(srv.response.error_code==0)
                return  true;
            else {
                ROS_ERROR("judgesys service error:%d\n",srv.response.error_code);
                return false;
            }

        }
        else
        {
            ROS_ERROR("Failed to call judgesys service");
            return false;
        }
}

void QNode::BulletInfoCallback(const hero_msgs::BulletsInfo::ConstPtr &msg)
{
    bulletInfo_lock.lock();
    bulletInfo_.bullets.clear();
    bulletInfo_.bullet_num = msg->bullet_num;
    for(int i=0;i<msg->bullet_num;i++)
        bulletInfo_.bullets.emplace_back(msg->bullets[i]);

    bulletInfo_lock.unlock();
}



}  // namespace hero_interface
