#include "judgesys_robot.h"
#include <string>


namespace hero_judgesys{
using hero_common::ErrorCode;
using hero_common::ErrorInfo;
using hero_common::JudgeSysCommand;

JudgesysRobot::JudgesysRobot(std::string robot_num, std::string color):
new_cmd_acc_(false), 
begin_(false),
is_forbidden_to_move_(false),
is_alive_(true),
raw_cmd_selector_count(50){
   if (Init(robot_num,color).IsOK()) {
    ROS_INFO("%s robot:%s initialization completed.",color.c_str(),robot_num.c_str());
  } else {
    ROS_ERROR("%s robot:%s Initialization failed.",color.c_str(),robot_num.c_str());
  }
}

ErrorInfo JudgesysRobot::Init(std::string robot_num, std::string color){
	if(color != "red" && color != "blue")
	{
		ROS_ERROR("robot color can only be red or blue.");
		return ErrorInfo(ErrorCode::GP_INITILIZATION_ERROR,
						"robot color can only be red or blue.");
	}
	color_ = color;
	robot_num_ = robot_num;
    Reset();
	ros::NodeHandle nh_;
    judgeVel_pub_ = nh_.advertise<geometry_msgs::Twist>(robot_num + "/" + "cmd_vel", 5);
    judgeStatus_pub_ = nh_.advertise<hero_msgs::RobotStatus>("judgeSysInfo/" + robot_num + "/status",5);
    judgeHeat_pub_ = nh_.advertise<hero_msgs::RobotHeat>("judgeSysInfo/" + robot_num + "/heat_power",5);
    judge_sub_[0] = nh_.subscribe<geometry_msgs::Twist>	(robot_num + "/" + "cmd_vel_raw", 100, &JudgesysRobot::RawVelCallback,this);
    judge_sub_[1] = nh_.subscribe<geometry_msgs::Twist>	(robot_num + "/" + "cmd_vel_raw_act", 100, &JudgesysRobot::RawVelCallback_act,this);
	return ErrorInfo(ErrorCode::OK);
}

void JudgesysRobot::RawVelCallback(const geometry_msgs::Twist::ConstPtr& msg)
{
  raw_cmd_selector_count ++;
  if(raw_cmd_selector_count<50)
    return;
	if (!begin_) {
    begin_ = true;
        ROS_INFO("[Hero_judgesys]%s robot:%s raw cmd vel received!",color_.c_str(),robot_num_.c_str());
  }
	new_cmd_acc_ = true;
	raw_cmd_vel_ = *msg;
}

void JudgesysRobot::RawVelCallback_act(const geometry_msgs::Twist::ConstPtr& msg)
{
  if (!begin_) {
    begin_ = true;
        ROS_INFO("[Hero_judgesys]%s robot:%s raw cmd vel(act) received!",color_.c_str(),robot_num_.c_str());
  }
  new_cmd_acc_ = true;
  raw_cmd_vel_ = *msg;
  raw_cmd_selector_count = 0;
}

void JudgesysRobot::BuffReload()
{
    ammo_ += JudgesysControl::ReloadAmmo;
    ROS_INFO("[Hero_judgesys]%s %s Buff Reload! ammo + 200.",color_.c_str(),robot_num_.c_str());
}

void JudgesysRobot::BuffHeal()
{
    health_ += JudgesysControl::RecoveredHealth;
    if(health_ > JudgesysControl::MaxHealth )
        health_ = JudgesysControl::MaxHealth;
    ROS_INFO("[Hero_judgesys]%s %s Buff Heal! Hp + 200.",color_.c_str(),robot_num_.c_str());
}

void JudgesysRobot::Revive()
{
    health_ = JudgesysControl::MaxHealth;
}
void JudgesysRobot::PublishVel()
{
	if(!begin_)
		return;
	if(health_<0)
	{
		health_ = 0;
	}
	is_alive_ = health_ > 0;
	if(is_forbidden_to_move_||!is_alive_)
	{
		output_cmd_vel_.linear.x = 0;
		output_cmd_vel_.linear.y = 0;
		output_cmd_vel_.angular.z = 0;
	}
	else
	{
		output_cmd_vel_.linear.x = raw_cmd_vel_.linear.x;
		output_cmd_vel_.linear.y = raw_cmd_vel_.linear.y;
		output_cmd_vel_.angular.z = raw_cmd_vel_.angular.z;
        judgeVel_pub_.publish(output_cmd_vel_);
	}

}

void JudgesysRobot::PublishInfo()
{
    roboStatus_.max_hp = JudgesysControl::MaxHealth;
    roboStatus_.remain_hp = health_;
    roboStatus_.heat_cooling_limit = heat_cooling_limit_;
    roboStatus_.remain_ammo = ammo_;
    roboStatus_.chassis_output = !is_forbidden_to_move_;
    roboStatus_.shooter_output = !is_forbidden_to_shoot_;

    roboHeat_.shooter_heat = heat_;

    judgeStatus_pub_.publish(roboStatus_);
    judgeHeat_pub_.publish(roboHeat_);
}

void JudgesysRobot::Cool(int fre)
{
    if(health_ < 400)
        cooling_rate_ = JudgesysControl::CoolingRateDying;
    else {
        cooling_rate_ = JudgesysControl::CoolingRateNormal;
    }


    if(heat_ > JudgesysControl::HeatLimit)
    {
        if(heat_<360)
            health_ -= (heat_- JudgesysControl::HeatLimit)*40 / fre;
        else {
            health_ -= (heat_- 360)*400 / fre;
            heat_ = 360;
        }
        if(health_<0)
            health_ = 0;
    }

    heat_ -= cooling_rate_ / fre;
    if(heat_ < 0)
        heat_ = 0;

}

void JudgesysRobot::Shoot(int num, float speed)
{
    heat_ += num * speed;
    if(ammo_ > 0)
       ammo_ -- ;
    if(ammo_ <= 0)
        ROS_ERROR("[Hero_judgesys] ammo is less than zero!");
}


void JudgesysRobot::DebuffMove()
{
    move_debuff_time_ = 10;
    ROS_INFO("[Hero_judgesys]%s %s Debuff: Can't move!",color_.c_str(),robot_num_.c_str());
}

void JudgesysRobot::DebuffShoot()
{
    shoot_debuff_time_ = 10;
    ROS_INFO("[Hero_judgesys]%s %s Debuff: Can't shoot!",color_.c_str(),robot_num_.c_str());
}

void JudgesysRobot::BuffAndDebuff(int fre)
{
    if(move_debuff_time_ > 0)
    {
        move_debuff_time_ -= 1.0f/fre;
        if(move_debuff_time_ < 0)
            move_debuff_time_ = 0;
        is_forbidden_to_move_ = true;
        //ROS_INFO("move_debuff_time_ = %f",move_debuff_time_);
    }
    else {
        is_forbidden_to_move_ = false;
    }


    if(shoot_debuff_time_ > 0)
    {
        shoot_debuff_time_ -= 1.0f/fre;
        if(shoot_debuff_time_ < 0)
            shoot_debuff_time_ = 0;
        is_forbidden_to_shoot_ = true;
    }
    else {
        is_forbidden_to_shoot_ = false;
    }
}

void JudgesysRobot::BeHit(hero_common::JudgeSysCommand command)
{
    switch (command) {
    case JudgeSysCommand::ARMOR_HIT_FRONT:
        health_ -= 20;
        break;
    case JudgeSysCommand::ARMOR_HIT_LEFT:
        health_ -= 40;
        break;
    case JudgeSysCommand::ARMOR_HIT_BACK:
        health_ -=60;
        break;
    case JudgeSysCommand::ARMOR_HIT_RIGHT:
        health_ -=40;
        break;
    default:
        ROS_ERROR("[Hero_judgesys]Wrong armor hit command!");
        break;
    }
    if(health_<0)
        health_ = 0;
}

void JudgesysRobot::Reset()
{
    health_ = hero_judgesys::JudgesysControl::MaxHealth;
    heat_cooling_limit_ = hero_judgesys::JudgesysControl::HeatLimit;
    heat_ = 0;
    if(robot_num_ == "robot_0"|| robot_num_ == "robot_2")
        ammo_ = 50;
    else {
        ammo_ = 0;
    }
    move_debuff_time_ = 0;
    shoot_debuff_time_ = 0;
}

}


