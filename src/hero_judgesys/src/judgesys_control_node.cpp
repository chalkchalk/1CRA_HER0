#include "judgesys_control_node.h"
#include <string>
#include <thread>
#include <chrono>

namespace hero_judgesys{
using hero_common::ErrorCode;
using hero_common::ErrorInfo;

JudgesysControl::JudgesysControl(){
   if (Init().IsOK()) {
    ROS_INFO("judgesys control initialization completed.");
  } else {
    ROS_ERROR("judgesys control Initialization failed.");
  }
}


bool JudgesysControl::handle_function(hero_msgs::JudgeSysControl::Request &req,
                    hero_msgs::JudgeSysControl::Response &res)
{
        res.error_code = 0;
    switch (req.command) {
    case 1:
        KillRobot(req.robot_name);
        break;
    case 2:
        ReviveRobot(req.robot_name);
        break;
    case 3:
        ReloadRobot(req.robot_name);
        break;
    case 4:
        DisarmRobot(req.robot_name);
        break;
    default:   res.error_code = 1;
        break;
    }
//	ROS_INFO("Request from %s with age %d ", req.name.c_str(), req.age);
	
	// 返回一个反馈，将response设置为"..."

	return true;
}

ErrorInfo JudgesysControl::Init() {
    AddRobot( new JudgesysRobot("robot_0","blue"));
    AddRobot( new JudgesysRobot("robot_1","blue"));
    AddRobot( new JudgesysRobot("robot_2","red"));
    AddRobot( new JudgesysRobot("robot_3","red"));

    service_ = nh_.advertiseService("judgesys_control", &JudgesysControl::handle_function,this);
	//KillRobot("robot_1");
	//KillRobot("robot_2");
	//KillRobot("robot_3");
	return ErrorInfo(ErrorCode::OK);
}


void JudgesysControl::UpdateVel()
{
	for (auto it = robots_.begin(); it != robots_.end(); ++it) {
		(*it)->PublishVel();
	}
}

void JudgesysControl::UpdateInfo()
{
    for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        (*it)->PublishInfo();
    }
}

bool JudgesysControl::KillRobot(std::string robot_num)
{
	bool val = false;
	 for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->GetNum() == robot_num)
        {
            (*it)->Kill();
                        ROS_INFO("[Hero_judgesys]Kill %s\n",(*it)->GetNum().c_str());
						val = true;
        }
    }
		return val;
}

bool JudgesysControl::ReviveRobot(std::string robot_num)
{
    bool val = false;
     for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->GetNum() == robot_num)
        {
            (*it)->Revive();
                        ROS_INFO("[Hero_judgesys]Revive %s\n",(*it)->GetNum().c_str());
                        val = true;
        }
    }
    return val;
}

bool JudgesysControl::ReloadRobot(std::string robot_num)
{
    bool val = false;
     for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->GetNum() == robot_num)
        {
            (*it)->Reload();
                        ROS_INFO("[Hero_judgesys]Reload %s ammo = %d\n",(*it)->GetNum().c_str(),(*it)->GetAmmo());
                        val = true;
        }
    }
    return val;
}

bool JudgesysControl::DisarmRobot(std::string robot_num)
{
    bool val = false;
     for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->GetNum() == robot_num)
        {
            (*it)->Disarm();
                        ROS_INFO("[Hero_judgesys]Disarm %s\n!",(*it)->GetNum().c_str());
                        val = true;
        }
    }
    return val;
}

}



int main(int argc, char *argv[])
{
	ros::init(argc, argv, "judgesys_control_node");
    hero_judgesys::JudgesysControl jydgesys_control;

	 while	(ros::ok()) {
    std::this_thread::sleep_for(std::chrono::milliseconds(5));
    ros::spinOnce();
    jydgesys_control.UpdateVel();
    jydgesys_control.UpdateInfo();
  }

	return 0;
}
