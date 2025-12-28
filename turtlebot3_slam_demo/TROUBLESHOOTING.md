## ❓ Troubleshooting

During the project implementation, we addressed several critical engineering challenges related to resource constraints and sensor limitations.

### 1. Real-time Loop Closure Problem (High CPU Load)
* **🔴 Symptom**: The terminal frequently threw red warnings: `Processing time (2.39s) is over detection rate (1.00s)`, causing severe lag in RViz and delayed robot response.
* **🔍 Root Cause**: The lack of GPU acceleration in the 4-core VM environment caused resource contention between Gazebo physics rendering and SLAM backend optimization.
* **✅ Solution**: **Active Frequency Locking**.
  * We modified the launch parameter to lock the `Rtabmap/DetectionRate` at **1.0 Hz**.
  * **Result**: CPU load reduced by ~60%, ensuring system stability without crashing.

### 2. Visual Odometry Lost (Tracking Failure)
* **🔴 Symptom**: The robot's position jumped or drifted significantly when rotating quickly or stopping abruptly using the default keyboard teleop.
* **🔍 Root Cause**: Sudden acceleration caused **motion blur** in the RGB-D camera frames, leading to insufficient feature matching (SIFT/SURF) for the Visual Odometry frontend.
* **✅ Solution**: **Motion Smoothing Algorithm**.
  * Implemented a linear acceleration ramp in `auto_patrol.py` (limiting velocity increment to `0.01 m/s` per loop).
  * **Result**: Stable feature tracking and smooth camera movement.

### 3. Incomplete Costmap Updates
* **🔴 Symptom**: Distant walls in the corridor were not updating correctly in the global costmap, and dynamic obstacles left "ghost" trails.
* **🔍 Root Cause**: The default `raytrace_range` (2.5m) was too short for the corridor environment dimensions.
* **✅ Solution**: **Parameter Tuning**.
  * Adjusted `costmap_common_params.yaml`: Increased `raytrace_range` to **3.5m** and `obstacle_range` to **3.0m**.
  * **Result**: The grid map accurately reflects the geometric features of the simulation world.
