project(hero_msgs)
cmake_minimum_required(VERSION 3.1)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR})
find_package(catkin REQUIRED COMPONENTS
  actionlib_msgs
    std_msgs
    nav_msgs
    geometry_msgs
    actionlib
    message_generation
    )

add_action_files(
    DIRECTORY action
    FILES
    LocalPlanner.action
    GlobalPlanner.action
    ArmorDetection.action
)

add_message_files(
    DIRECTORY msg
    FILES
    TwistAccel.msg
    GimbalAngle.msg
    GimbalRate.msg
    ObstacleMsg.msg
    ShootInfo.msg
    ShootState.msg
    BulletMove.msg
    BulletsInfo.msg
    Position.msg
    RobotPosition.msg
    BattlePosition.msg
)

add_message_files(
    DIRECTORY msg/referee_system
    FILES
    BonusStatus.msg
    GameResult.msg
    GameStatus.msg
    GameSurvivor.msg
    ProjectileSupply.msg
    RobotBonus.msg
    RobotDamage.msg
    RobotHeat.msg
    RobotShoot.msg
    RobotStatus.msg
    SupplierStatus.msg
    Buffinfo.msg

)

add_service_files(
    DIRECTORY srv
    FILES
    GimbalMode.srv
    FricWhl.srv
    ShootCmd.srv
    JudgeSysControl.srv
    GimbalAim.srv
    BasicExecutor.srv
)

generate_messages(
    DEPENDENCIES
  actionlib_msgs
    std_msgs
    geometry_msgs
    nav_msgs
)

catkin_package(
  CATKIN_DEPENDS
  message_runtime)
# add_action_files(
#   FILES
# )

