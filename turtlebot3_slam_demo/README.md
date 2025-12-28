# TurtleBot3 Visual SLAM with RTAB-Map & Smooth Control

This project demonstrates a robust Visual SLAM system using **ROS Noetic**, **Gazebo**, and **RTAB-Map** on a TurtleBot3 Waffle model. It features a custom smooth control algorithm and optimized configuration for resource-constrained environments (e.g., Virtual Machines with 4-core CPUs).

## 🚀 Key Features

* **One-Click Launch Integration**: A custom `my_mapping.launch` file to start Gazebo simulation and RTAB-Map algorithms simultaneously with correct parameter initialization.
* **Smooth Motion Control**: Replaced the jerky keyboard teleoperation with `auto_patrol.py`, implementing **linear acceleration smoothing** to prevent visual odometry drift and motion blur.
* **Performance Optimization**: Tuned RTAB-Map detection rates (locked at **1.0 Hz**) to solve "Real-time loop closure detection failed" warnings on CPU-only environments.

---

## 🛠️ Prerequisites

* **OS**: Ubuntu 20.04 (Focal)
* **ROS Distro**: Noetic
* **Packages**:
    * `turtlebot3`
    * `turtlebot3_simulations`
    * `rtabmap_ros`

---

## 🏃 Usage

### 1. Launch Simulation & SLAM
Start the customized environment and the mapping algorithm in **Mapping Mode** (Localization disabled):

```bash
roslaunch turtlebot3_slam_demo my_mapping.launch
