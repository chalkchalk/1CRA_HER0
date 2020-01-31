cmake_minimum_required(VERSION 3.1)
project(hero_map)

find_package(Eigen3 REQUIRED)

include_directories(${EIGEN3_INCLUDE_DIR})
add_definitions(${EIGEN3_DEFINITIONS})

include_directories("/usr/include/eigen3")
include_directories("/usr/include/eigen3/Eigen")
#common::math
add_library(hero_map INTERFACE

)

target_sources(hero_map INTERFACE
  hero_map.h
)

