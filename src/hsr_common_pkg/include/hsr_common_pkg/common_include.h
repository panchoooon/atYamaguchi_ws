//--------------------------------------------------
//C++共通ヘッダ
//
//author: Yutaro ISHIDA
//--------------------------------------------------


#define COMMON_PKG_NAME "hsr_common_pkg"


//C++
#include <stdio.h>
#include <iostream>
#include <string.h>
#include <sstream>
#include <vector>
#include <time.h>
#include <locale.h>
#include <sys/stat.h>


//ROS
#include <ros/ros.h>
#include <ros/package.h>

#include <sensor_msgs/image_encodings.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>

#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud_conversion.h>

#include <std_msgs/String.h>
#include <std_msgs/Float64.h>

#include <geometry_msgs/Twist.h>
#include <trajectory_msgs/JointTrajectory.h>

#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

#include <actionlib/client/simple_action_client.h>


//ROS(自作)
#include <hsr_common_pkg/ObjRecAction.h>


//PCL(基本)
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>

//PCL(ダウンサンプリング)
#include <pcl/filters/voxel_grid.h>

//PCL(パススルーフィルタ)
#include <pcl/filters/passthrough.h>

//PCL(平面検出)
#include <pcl/ModelCoefficients.h>
#include <pcl/segmentation/sac_segmentation.h>

//PCL(平面除去)
#include <pcl/filters/extract_indices.h>

//PCL(クラスタリング)
#include <pcl/kdtree/kdtree.h>
#include <pcl/segmentation/extract_clusters.h>


//OpenCV
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>


using namespace std;
