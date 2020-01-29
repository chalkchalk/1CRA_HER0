cmake_minimum_required(VERSION 3.1)
project(hero_math)

#common::math
add_library(hero_math INTERFACE

)

target_sources(hero_math INTERFACE
  geometry.h
  math.h
)

target_include_directories(${PROJECT_NAME}
  PUBLIC
  ${EIGEN3_INCLUDE_DIR}
  )

target_link_libraries(${PROJECT_NAME}
  PUBLIC
  ${EIGEN3_LIBRARIES}
  ${catkin_LIBRARIES}
  ${GLOG_LIBRARY}
  )
