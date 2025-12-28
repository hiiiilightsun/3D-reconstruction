#!/bin/bash
# 一键启动三维重建仿真系统

export TURTLEBOT3_MODEL=waffle

echo "正在初始化系统..."

# 1. 启动 Gazebo (新窗口)
gnome-terminal --window --title="Gazebo Sim" -- bash -c \
"export TURTLEBOT3_MODEL=waffle; roslaunch turtlebot3_gazebo turtlebot3_house.launch; exec bash"

sleep 5 

# 2. 启动 SLAM (新标签页)
gnome-terminal --tab --title="RTAB-Map" -- bash -c \
"export TURTLEBOT3_MODEL=waffle; roslaunch rtabmap_demos demo_turtlebot3_navigation.launch localization:=false; exec bash"

sleep 3

# 3. 启动键盘控制 (新标签页)
gnome-terminal --tab --title="Teleop" -- bash -c \
"export TURTLEBOT3_MODEL=waffle; roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch; exec bash"

echo "系统启动完毕！请在 Teleop 窗口控制移动。"
