#include "judgesys_control_node.h"
#include <string>
#include <thread>
#include <chrono>

namespace hero_judgesys{
using hero_common::ErrorCode;
using hero_common::ErrorInfo;

JydgesysControl::JydgesysControl(){
   if (Init().IsOK()) {
    ROS_INFO("judgesys control initialization completed.");
  } else {
    ROS_ERROR("judgesys control Initialization failed.");
  }
}

ErrorInfo JydgesysControl::Init() {
	AddRobot( new JydgesysRobot("robot_0","blue"));
	AddRobot( new JydgesysRobot("robot_1","blue"));
	AddRobot( new JydgesysRobot("robot_2","red"));
	AddRobot( new JydgesysRobot("robot_3","red"));
	return ErrorInfo(ErrorCode::OK);
}


void JydgesysControl::UpdateVel()
{
	for (auto it = robots_.begin(); it != robots_.end(); ++it) {
		(*it)->PublishVel();
	}
}



}


int main(int argc, char *argv[])
{
	ros::init(argc, argv, "judgesys_control_node");
	hero_judgesys::JydgesysControl jydgesys_control;

	 while	(ros::ok()) {
    std::this_thread::sleep_for(std::chrono::milliseconds(5));
    ros::spinOnce();
    jydgesys_control.UpdateVel();
  }

	return 0;
}