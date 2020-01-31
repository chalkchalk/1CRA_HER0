#include "judgesys_control_node.h"
#include <string>
#include <thread>
#include <chrono>
#include <sys/time.h>
#include <cstdlib>// Header file needed to use rand

namespace hero_judgesys{
using hero_common::ErrorCode;
using hero_common::ErrorInfo;
using hero_common::JudgeSysCommand;
using namespace std;

JudgesysControl::JudgesysControl(){
   if (Init().IsOK()) {
    ROS_INFO("judgesys control initialization completed.");
  } else {
    ROS_ERROR("judgesys control Initialization failed.");
  }
}

JudgesysRobot* JudgesysControl::FindRobot(std::string robot_name)
{
    for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->GetName() == robot_name)
        {
            return (*it);
        }
    }
    return nullptr;
}

bool JudgesysControl::handle_function(hero_msgs::JudgeSysControl::Request &req,
                    hero_msgs::JudgeSysControl::Response &res)
{
        res.error_code = 0;
        std::string  robot_name = req.robot_name;
    switch (req.command) {
    case JudgeSysCommand::KILL_ROBOT:
        KillRobot(req.robot_name);
        break;
    case JudgeSysCommand::REVIVE_ROBOT:
        ReviveRobot(req.robot_name);
        break;
    case JudgeSysCommand::RELOAD_ROBOT:
        ReloadRobot(req.robot_name);
        break;
    case JudgeSysCommand::DISARM_ROBOT:
        DisarmRobot(req.robot_name);
        break;
    case JudgeSysCommand::ARMOR_HIT_FRONT:
        HitRobot(req.robot_name,JudgeSysCommand::ARMOR_HIT_FRONT);
        ROS_INFO("[Hero_judgesys] %s get hit on front armor", robot_name.c_str());
        break;
    case JudgeSysCommand::ARMOR_HIT_LEFT:
        HitRobot(req.robot_name,JudgeSysCommand::ARMOR_HIT_LEFT);
        ROS_INFO("[Hero_judgesys] %s get hit on left armor",robot_name.c_str());
        break;
    case JudgeSysCommand::ARMOR_HIT_BACK:
        HitRobot(req.robot_name,JudgeSysCommand::ARMOR_HIT_BACK);
        ROS_INFO("[Hero_judgesys] %s get hit on back armor, that's hurt!",robot_name.c_str());
        break;
    case JudgeSysCommand::ARMOR_HIT_RIGHT:
        HitRobot(req.robot_name,JudgeSysCommand::ARMOR_HIT_RIGHT);
        ROS_INFO("[Hero_judgesys] %s get hit on right armor",robot_name.c_str());
        break;
    case JudgeSysCommand::SHOOT_BULLET:
        RobotShoot(req.robot_name);
        break;
    case JudgeSysCommand::RFID_F1:
    case JudgeSysCommand::RFID_F2:
    case JudgeSysCommand::RFID_F3:
    case JudgeSysCommand::RFID_F4:
    case JudgeSysCommand::RFID_F5:
    case JudgeSysCommand::RFID_F6:
        RFID_Callback(req.robot_name,req.command - JudgeSysCommand::RFID_F1);
        break;

    default:   res.error_code = 1;
        break;
    }
//	ROS_INFO("Request from %s with age %d ", req.name.c_str(), req.age);
	
	// 返回一个反馈，将response设置为"..."

	return true;
}

void JudgesysControl::RFID_Callback(std::string robot_name, int num)
{
    if(RFID[num].isActivated)
        return;
    if(RFID[num].color == "red")
    {
        if(RFID[num].type == RFID_type::HEAL)
        {
            FindRobot("robot_2")->BuffHeal();
            FindRobot("robot_3")->BuffHeal();
        }
        else if(RFID[num].type == RFID_type::RELOAD)
        {
            FindRobot("robot_2")->BuffReload();
            FindRobot("robot_3")->BuffReload();
        }
    }
    else if(RFID[num].color == "blue")
    {
        if(RFID[num].type == RFID_type::HEAL)
        {
            FindRobot("robot_0")->BuffHeal();
            FindRobot("robot_1")->BuffHeal();
        }
        else if(RFID[num].type == RFID_type::RELOAD)
        {
            FindRobot("robot_0")->BuffReload();
            FindRobot("robot_1")->BuffReload();
        }
    }
    else {
        if(RFID[num].type == RFID_type::MOVE_DEFBUFF)
            FindRobot(robot_name)->DebuffMove();
        else if(RFID[num].type == RFID_type::SHOOT_DEBUFF)
            FindRobot(robot_name)->DebuffShoot();
    }
    RFID[num].isActivated = true;
}
void JudgesysControl::HitRobot(std::string robot_name, hero_common::JudgeSysCommand command)
{
    FindRobot(robot_name)->BeHit(command);
}

void JudgesysControl::RobotShoot(std::string robot_name)
{
    FindRobot(robot_name)->Shoot(1,22);
}
ErrorInfo JudgesysControl::Init() {
    AddRobot( new JudgesysRobot("robot_0","blue"));
    AddRobot( new JudgesysRobot("robot_1","blue"));
    AddRobot( new JudgesysRobot("robot_2","red"));
    AddRobot( new JudgesysRobot("robot_3","red"));

    service_ = nh_.advertiseService("judgesys_control", &JudgesysControl::handle_function,this);

    for(int i=0;i<6;i++)
        buffZone[i] = false;

	//KillRobot("robot_1");
	//KillRobot("robot_2");
	//KillRobot("robot_3");
    RFID_Refresh();
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
        if((*it)->GetName() == robot_num)
        {
            (*it)->Kill();
                        ROS_INFO("[Hero_judgesys]Kill %s\n",(*it)->GetName().c_str());
						val = true;
        }
    }
		return val;
}

bool JudgesysControl::ReviveRobot(std::string robot_num)
{
    bool val = false;
     for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->GetName() == robot_num)
        {
            (*it)->Revive();
                        ROS_INFO("[Hero_judgesys]Revive %s\n",(*it)->GetName().c_str());
                        val = true;
        }
    }
    return val;
}

bool JudgesysControl::ReloadRobot(std::string robot_num)
{
    bool val = false;
     for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->GetName() == robot_num)
        {
            (*it)->Reload();
                        ROS_INFO("[Hero_judgesys]Reload %s ammo = %d\n",(*it)->GetName().c_str(),(*it)->GetAmmo());
                        val = true;
        }
    }
    return val;
}

bool JudgesysControl::DisarmRobot(std::string robot_num)
{
    bool val = false;
     for (auto it = robots_.begin(); it != robots_.end(); ++it) {
        if((*it)->GetName() == robot_num)
        {
            (*it)->Disarm();
                        ROS_INFO("[Hero_judgesys]Disarm %s\n!",(*it)->GetName().c_str());
                        val = true;
        }
    }
    return val;
}

void JudgesysControl::RobotsCooling(int fre)
{
    for (auto it = robots_.begin(); it != robots_.end(); ++it) {
     (*it)->Cool(fre);
   }

}

void JudgesysControl::RFID_Refresh()
{
    vector<RFID_type> rfid_vector;
    rfid_vector.emplace_back(RFID_type::HEAL);
    rfid_vector.emplace_back(RFID_type::RELOAD);
    if(rand()%2)
     rfid_vector.emplace_back(RFID_type::MOVE_DEFBUFF);
    else {
        rfid_vector.emplace_back(RFID_type::SHOOT_DEBUFF);
    }
    srand(time(NULL));
    random_shuffle(rfid_vector.begin(),rfid_vector.end());
    std::string color[2] = {"red","blue"};
    std::string type[4] = {"heal","reload","move_debuff","shoot_debuff"};
    for(int i =0;i<3;i++)
    {
        if(rfid_vector[i] != RFID_type::MOVE_DEFBUFF && rfid_vector[i] != RFID_type::SHOOT_DEBUFF)
        {
            RFID[i].color = color[rand()%2];
            RFID[i].type = rfid_vector[i];
            RFID[i + 3].color = color[1 - rand()%2];
            RFID[i + 3].type = rfid_vector[i];
        }
        else {
            if(rand()%2){
                RFID[i].type = RFID_type::MOVE_DEFBUFF;
                RFID[i + 3].type = RFID_type::SHOOT_DEBUFF;
                RFID[i].color = "both";
                RFID[i + 3].color = "both";
            }
            else {
                RFID[i].type = RFID_type::SHOOT_DEBUFF;
                RFID[i + 3].type = RFID_type::MOVE_DEFBUFF;
                RFID[i].color = "both";
                RFID[i + 3].color = "both";
            }
        }
    }

    ROS_INFO("[Hero_judgesys]RFID refresh!");
    for(int i =0;i<6;i++)
    {
        RFID[i].isActivated = false;
        ROS_INFO("[Hero_judgesys]RFID F%d:%s %s",i+1, RFID[i].color.c_str(),type[RFID[i].type - RFID_type::HEAL].c_str());
    }
}

void JudgesysControl::LogOutput()
{
    static int robot_health[4] = {2000,2000,2000,2000};
    for(int i = 0;i < 4;i++)
    {
        if(robot_health[i] > 0 && robots_[i]->GetHealth() <=0)
            ROS_INFO("[Hero_judgesys]%s is dead!",robots_[i]->GetName().c_str());
        robot_health[i] = robots_[i]->GetHealth();

    }
}

void JudgesysControl::BuffHandle(int fre)
{
    for(int i = 0;i < 4;i++)
    {
        robots_[i]->BuffAndDebuff(fre);

    }
}

}


int main(int argc, char *argv[])
{
	ros::init(argc, argv, "judgesys_control_node");
    hero_judgesys::JudgesysControl judgesys_control;
    int ms = 0;
    int ms_last = 0;
    struct timeval tv;
    struct timezone tz;
    while	(ros::ok()) {
    gettimeofday(&tv,&tz);
    ms_last = tv.tv_sec*1000 + tv.tv_usec/1000;
    ros::spinOnce();
    judgesys_control.UpdateVel();
    judgesys_control.UpdateInfo();
    judgesys_control.RobotsCooling(40);
    judgesys_control.BuffHandle(40);
    judgesys_control.LogOutput();

    gettimeofday(&tv,&tz);
    ms = tv.tv_sec*1000 + tv.tv_usec/1000;
    //ROS_INFO("time used:%d",ms-ms_last);
    if(ms - ms_last <25)
    {
       // ROS_INFO("sleep for :%d",25 -(ms - ms_last));
        std::this_thread::sleep_for(std::chrono::milliseconds(25 -(ms - ms_last)));
    }
  }

	return 0;
}
