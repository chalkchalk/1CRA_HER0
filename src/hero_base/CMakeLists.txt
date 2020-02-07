project(hero_base)
cmake_minimum_required(VERSION 3.1)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake_module)
set(CMAKE_BUILD_TYPE Release)
find_package(Threads REQUIRED)
find_package(Glog REQUIRED)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  tf
  hero_msgs
  )

catkin_package()

add_executable(hero_base_node
  hero_base_node.cpp
  chassis/chassis.cpp
  gimbal/gimbal.cpp
  referee_system/referee_system.cpp
  hero_sdk/dispatch/execution.cpp
  hero_sdk/dispatch/handle.cpp
  hero_sdk/protocol/protocol.cpp
  hero_sdk/hardware/serial_device.cpp
  )
target_link_libraries(hero_base_node PUBLIC
  Threads::Threads
  ${GLOG_LIBRARY}
  ${catkin_LIBRARIES})
target_include_directories(hero_base_node PUBLIC
  ${catkin_INCLUDE_DIRS})
add_dependencies(hero_base_node hero_msgs_generate_messages)

