/****************************************************************************
 *  Copyright (C) 2019 RoboMaster.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see <http://www.gnu.org/licenses/>.
 ***************************************************************************/

#ifndef HERO_SDK_PROTOCOL_DEFINE_ROS_H
#define HERO_SDK_PROTOCOL_DEFINE_ROS_H
#include <ros/ros.h>
#include <tf/transform_broadcaster.h>

#include <nav_msgs/Odometry.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Twist.h>

//Chassis
#include "hero_msgs/TwistAccel.h"

//Gimbal
#include "hero_msgs/GimbalAngle.h"
#include "hero_msgs/GimbalRate.h"
#include "hero_msgs/GimbalMode.h"
#include "hero_msgs/ShootCmd.h"
#include "hero_msgs/FricWhl.h"

//Referee System
#include "hero_msgs/BonusStatus.h"
#include "hero_msgs/GameResult.h"
#include "hero_msgs/GameStatus.h"
#include "hero_msgs/GameSurvivor.h"
#include "hero_msgs/ProjectileSupply.h"
#include "hero_msgs/RobotBonus.h"
#include "hero_msgs/RobotDamage.h"
#include "hero_msgs/RobotHeat.h"
#include "hero_msgs/RobotShoot.h"
#include "hero_msgs/RobotStatus.h"
#include "hero_msgs/SupplierStatus.h"

#endif //HERO_SDK_PROTOCOL_DEFINE_ROS_H
