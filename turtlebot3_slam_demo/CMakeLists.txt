cmake_minimum_required(VERSION 3.0.2)
project(turtlebot3_slam_demo)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rtabmap_ros
  dynamic_reconfigure
)

# 生成动态参数配置
generate_dynamic_reconfigure_options(
  cfg/SlamParams.cfg
)

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)