cmake_minimum_required(VERSION 3.1)

project(hero_multistage)



set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake_module)
set(CMAKE_BUILD_TYPE Release)



find_package(Eigen3 REQUIRED)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  nav_msgs
  geometry_msgs
  actionlib
  hero_common
  hero_msgs
  tf
)
find_package(PCL 1.7 REQUIRED)
find_package(Boost REQUIRED)

catkin_package(
  INCLUDE_DIRS
  include
)


include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(robot_physics_node
  src/robot_physics.cpp
  src/robot_tf.cpp
  src/bullet.cpp
  include/robot_physics.h
  include/robot_tf.h
  include/bullet.h
)


target_link_libraries(robot_physics_node
        PUBLIC
        ${EIGEN3_LIBRARIES}
        ${catkin_LIBRARIES}
        ${GLOG_LIBRARY}
        )

target_include_directories(robot_physics_node PUBLIC
        ${catkin_INCLUDE_DIRS})

include_directories("/usr/include/eigen3")
include_directories("/usr/include/eigen3/Eigen")
