project(hero_decision)
cmake_minimum_required(VERSION 3.1)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake_module)
set(CMAKE_BUILD_TYPE Release)

include_directories("/usr/behaviac/inc")
include_directories("behaviac_ws/behaviac_generated/types/internal/")
LINK_DIRECTORIES("/usr/behaviac/lib")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

find_package(catkin REQUIRED COMPONENTS
  roscpp
  roslib
  tf
  nav_msgs
  geometry_msgs
  actionlib
  hero_common
  hero_msgs
  hero_costmap
  hero_planning
  pcl_conversions
  pcl_ros
  )

find_package(Eigen3 REQUIRED)
find_package(ProtoBuf REQUIRED)
find_package(PCL 1.7 REQUIRED)

include_directories(
  include
  simulation
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




add_executable(point_navigation
  executor/point_navigation.cpp
)


add_dependencies(point_navigation
    ${${PROJECT_NAME}_EXPORTED_TARGETS}
    ${catkin_EXPORTED_TARGETS}
    )

target_link_libraries(
    point_navigation
  ${catkin_LIBRARIES}
)

add_executable(simu_basic_executor
  simulation/basic_executor.cpp
  simulation/basic_executor.h
)

target_link_libraries(
  simu_basic_executor
  ${EIGEN3_LIBRARIES}
  ${catkin_LIBRARIES}
)


add_executable(collective_decision
    simulation/collective_decision.cpp
    simulation/collective_decision.h
   # behaviac_ws/behaviac_generated/types/behaviac_types.h
   # behaviac_ws/behaviac_generated/types/internal/behaviac_agent_headers.h
   # behaviac_ws/behaviac_generated/types/internal/behaviac_agent_member_visitor.h
   # behaviac_ws/behaviac_generated/types/internal/behaviac_agent_meta.cpp
   # behaviac_ws/behaviac_generated/types/internal/behaviac_agent_meta.h
   # behaviac_ws/behaviac_generated/types/internal/behaviac_headers.h
   # behaviac_ws/behaviac_generated/types/internal/Robot.cpp
   # behaviac_ws/behaviac_generated/types/internal/Robot.h
  )

target_link_libraries(
  collective_decision
  ${EIGEN3_LIBRARIES}
  ${catkin_LIBRARIES}
  hero_costmap
  #"/usr/behaviac/lib/libbehaviac_gcc_release.a"
)

include_directories("/usr/include/eigen3")
include_directories("/usr/include/eigen3/Eigen")
