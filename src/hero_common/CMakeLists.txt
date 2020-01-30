project(hero_common)
cmake_minimum_required(VERSION 3.1)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake_module)
set(CMAKE_BUILD_TYPE Release)

find_package(Eigen3 REQUIRED)

include_directories(${EIGEN3_INCLUDE_DIR})
add_definitions(${EIGEN3_DEFINITIONS})


find_package(catkin REQUIRED COMPONENTS
  roscpp
  hero_msgs
  actionlib
  )

find_package(Boost REQUIRED)


catkin_package(
  INCLUDE_DIRS
  include
)
include_directories(
    include
    ${EIGEN3_INCLUDE_DIRS}
    )

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.h"
  PATTERN ".svn" EXCLUDE
  )

include_directories("/usr/include/eigen3")
include_directories("/usr/include/eigen3/Eigen")

add_subdirectory(include/hero_math)
add_subdirectory(include/io)
