# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hero_msgs: 41 messages, 4 services")

set(MSG_I_FLAGS "-Ihero_msgs:/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg;-Ihero_msgs:/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg;-Ihero_msgs:/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hero_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg" "hero_msgs/LocalPlannerActionFeedback:geometry_msgs/PoseStamped:std_msgs/Header:hero_msgs/LocalPlannerFeedback:geometry_msgs/Quaternion:hero_msgs/LocalPlannerActionGoal:geometry_msgs/Point:geometry_msgs/Pose:hero_msgs/LocalPlannerGoal:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:nav_msgs/Path:hero_msgs/LocalPlannerResult:hero_msgs/LocalPlannerActionResult"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg" "hero_msgs/ArmorDetectionFeedback:geometry_msgs/PoseStamped:std_msgs/Header:hero_msgs/ArmorDetectionGoal:geometry_msgs/Quaternion:hero_msgs/ArmorDetectionActionFeedback:geometry_msgs/Point:hero_msgs/ArmorDetectionResult:hero_msgs/ArmorDetectionActionGoal:geometry_msgs/Pose:actionlib_msgs/GoalID:hero_msgs/ArmorDetectionActionResult:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg" "actionlib_msgs/GoalID:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:hero_msgs/LocalPlannerGoal:geometry_msgs/Pose:nav_msgs/Path"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg" "actionlib_msgs/GoalID:std_msgs/Header:hero_msgs/ArmorDetectionFeedback:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:geometry_msgs/Pose:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg" "geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg" "actionlib_msgs/GoalID:std_msgs/Header:hero_msgs/LocalPlannerResult:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg" "hero_msgs/GlobalPlannerFeedback:geometry_msgs/PoseStamped:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose:actionlib_msgs/GoalID:nav_msgs/Path:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg" "geometry_msgs/PoseStamped:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose:nav_msgs/Path"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg" "std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point32:geometry_msgs/Vector3:geometry_msgs/PolygonStamped:geometry_msgs/Polygon:geometry_msgs/QuaternionStamped:geometry_msgs/Twist:geometry_msgs/TwistWithCovariance"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg" "actionlib_msgs/GoalID:std_msgs/Header:hero_msgs/LocalPlannerFeedback:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg" "hero_msgs/GlobalPlannerActionGoal:hero_msgs/GlobalPlannerFeedback:geometry_msgs/Pose:std_msgs/Header:hero_msgs/GlobalPlannerActionFeedback:hero_msgs/GlobalPlannerGoal:geometry_msgs/Quaternion:geometry_msgs/Point:hero_msgs/GlobalPlannerActionResult:geometry_msgs/PoseStamped:hero_msgs/GlobalPlannerResult:actionlib_msgs/GoalID:nav_msgs/Path:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg" "hero_msgs/BulletMove"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg" "geometry_msgs/Accel:geometry_msgs/Twist:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg" "geometry_msgs/PoseStamped:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose:nav_msgs/Path"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg" "hero_msgs/ArmorDetectionResult:actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg" "hero_msgs/ArmorDetectionGoal:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg" "geometry_msgs/Pose:std_msgs/Header:hero_msgs/GlobalPlannerGoal:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg" "geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg" ""
)

get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg" NAME_WE)
add_custom_target(_hero_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hero_msgs" "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg" "hero_msgs/GlobalPlannerResult:actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PolygonStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/QuaternionStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_msg_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)

### Generating Services
_generate_srv_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_srv_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_srv_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)
_generate_srv_cpp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
)

### Generating Module File
_generate_module_cpp(hero_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hero_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hero_msgs_generate_messages hero_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_cpp _hero_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hero_msgs_gencpp)
add_dependencies(hero_msgs_gencpp hero_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hero_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PolygonStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/QuaternionStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_msg_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)

### Generating Services
_generate_srv_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_srv_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_srv_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)
_generate_srv_eus(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
)

### Generating Module File
_generate_module_eus(hero_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hero_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hero_msgs_generate_messages hero_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_eus _hero_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hero_msgs_geneus)
add_dependencies(hero_msgs_geneus hero_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hero_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PolygonStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/QuaternionStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_msg_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)

### Generating Services
_generate_srv_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_srv_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_srv_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)
_generate_srv_lisp(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
)

### Generating Module File
_generate_module_lisp(hero_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hero_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hero_msgs_generate_messages hero_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_lisp _hero_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hero_msgs_genlisp)
add_dependencies(hero_msgs_genlisp hero_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hero_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PolygonStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/QuaternionStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_msg_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)

### Generating Services
_generate_srv_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_srv_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_srv_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)
_generate_srv_nodejs(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
)

### Generating Module File
_generate_module_nodejs(hero_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hero_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hero_msgs_generate_messages hero_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_nodejs _hero_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hero_msgs_gennodejs)
add_dependencies(hero_msgs_gennodejs hero_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hero_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PolygonStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/QuaternionStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/nav_msgs/cmake/../msg/Path.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_msg_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)

### Generating Services
_generate_srv_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_srv_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_srv_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)
_generate_srv_py(hero_msgs
  "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
)

### Generating Module File
_generate_module_py(hero_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hero_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hero_msgs_generate_messages hero_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/FricWhl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/ShootCmd.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/JudgeSysControl.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalRate.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameSurvivor.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotDamage.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletMove.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/BonusStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/Buffinfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/GameStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotHeat.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotShoot.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotBonus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ObstacleMsg.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerActionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/srv/GimbalMode.srv" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/GimbalAngle.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerAction.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/RobotStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/BulletsInfo.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/TwistAccel.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/LocalPlannerFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/ProjectileSupply.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/ShootState.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionGoal.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/ArmorDetectionFeedback.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system/SupplierStatus.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg/GlobalPlannerActionResult.msg" NAME_WE)
add_dependencies(hero_msgs_generate_messages_py _hero_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hero_msgs_genpy)
add_dependencies(hero_msgs_genpy hero_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hero_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hero_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(hero_msgs_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(hero_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(hero_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(hero_msgs_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hero_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(hero_msgs_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(hero_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(hero_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(hero_msgs_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hero_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(hero_msgs_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(hero_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(hero_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(hero_msgs_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hero_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(hero_msgs_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(hero_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(hero_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(hero_msgs_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hero_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(hero_msgs_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(hero_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(hero_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(hero_msgs_generate_messages_py nav_msgs_generate_messages_py)
endif()
