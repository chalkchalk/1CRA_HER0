project(hero_judgesys)
cmake_minimum_required(VERSION 3.1)


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
)
find_package(PCL 1.7 REQUIRED)
find_package(Boost REQUIRED)

catkin_package(
  INCLUDE_DIRS
  include
)



include_directories(
  include ${catkin_INCLUDE_DIRS}
  include
)


add_executable(judgesys_control_node
  src/judgesys_control_node.cpp
  src/judgesys_robot.cpp
  include/judgesys_control_node.h
  include/judgesys_robot.h
)

target_link_libraries(judgesys_control_node
        PUBLIC
        ${EIGEN3_LIBRARIES}
        ${catkin_LIBRARIES}
        ${GLOG_LIBRARY}
        )

target_include_directories(judgesys_control_node PUBLIC
        ${catkin_INCLUDE_DIRS})





  
