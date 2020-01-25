project(hero_decision)
cmake_minimum_required(VERSION 3.1)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake_module)
set(CMAKE_BUILD_TYPE Release)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  tf
  nav_msgs
  geometry_msgs
  actionlib
  hero_common
  hero_msgs
  hero_costmap
  )

find_package(Eigen3 REQUIRED)
find_package(ProtoBuf REQUIRED)

include_directories(
  include ${catkin_INCLUDE_DIRS}
  include
  ${catkin_INCLUDE_DIRS}
)

#generate proto files
file(GLOB ProtoFiles "${CMAKE_CURRENT_SOURCE_DIR}/proto/*.proto")
rrts_protobuf_generate_cpp(${CMAKE_CURRENT_SOURCE_DIR}/proto
  DecisionProtoSrc
  DecisionProtoHds
  ${ProtoFiles}
  )

catkin_package()

add_executable(behavior_test_node
  ${DecisionProtoHds}
  ${DecisionProtoSrc}
  example_behavior/escape_behavior.h
  example_behavior/back_boot_area_behavior.h
  example_behavior/chase_behavior.h
  example_behavior/patrol_behavior.h
  example_behavior/search_behavior.h
  behavior_test.cpp
  executor/chassis_executor.cpp
  )

target_link_libraries(behavior_test_node
  PRIVATE
  hero_costmap
  ${catkin_LIBRARIES}
  ${PROTOBUF_LIBRARIES}
  )
  
add_dependencies(behavior_test_node
  hero_msgs_generate_messages)


add_executable(point_navigation_pub
  src/point_navigation_pub.cpp
)
add_dependencies(point_navigation_pub ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(point_navigation_pub
  ${catkin_LIBRARIES}
)

add_executable(point_navigation
  executor/point_navigation.cpp
)
add_dependencies(point_navigation ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(point_navigation
  ${catkin_LIBRARIES}
)

add_executable(test_pub
  src/test_pub.cpp
)
add_dependencies(test_pub ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(test_pub
  ${catkin_LIBRARIES}
)

add_executable(test_sub
  src/test_sub.cpp
)
add_dependencies(test_sub ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(test_sub
  ${catkin_LIBRARIES}
)