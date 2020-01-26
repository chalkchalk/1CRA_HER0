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

/*****************************************************************************
** Implementation
*****************************************************************************/

QNode::QNode(int argc, char** argv ,BattleView *parentBattleView) :
	init_argc(argc),
    init_argv(argv),
    parentBattleView_(parentBattleView)
	{}

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
    chatter_publisher = n.advertise<std_msgs::String>("chatter", 1000);
    pose_sub_[0] = n.subscribe<nav_msgs::Odometry>("/robot_0/base_pose_ground_truth", 1000,&QNode::PoseCallback,this);
    pose_sub_[1] = n.subscribe<nav_msgs::Odometry>("/robot_1/base_pose_ground_truth", 1000,&QNode::PoseCallback,this);
    pose_sub_[2] = n.subscribe<nav_msgs::Odometry>("/robot_2/base_pose_ground_truth", 1000,&QNode::PoseCallback,this);
    pose_sub_[3] = n.subscribe<nav_msgs::Odometry>("/robot_3/base_pose_ground_truth", 1000,&QNode::PoseCallback,this);
    start();
	return true;
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
	chatter_publisher = n.advertise<std_msgs::String>("chatter", 1000);
	start();
	return true;
}

void QNode::run() {
    ros::Rate loop_rate(50);
	int count = 0;
	while ( ros::ok() ) {

		std_msgs::String msg;
		std::stringstream ss;
		ss << "hello world " << count;
		msg.data = ss.str();
        //chatter_publisher.publish(msg);
		ros::spinOnce();
		loop_rate.sleep();
		++count;
	}
	std::cout << "Ros shutdown, proceeding to close the gui." << std::endl;
	Q_EMIT rosShutdown(); // used to signal the gui for a shutdown (useful to roslaunch)
}


}  // namespace hero_interface
