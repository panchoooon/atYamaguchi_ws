//--------------------------------------------------
//PCLマッチング学習用PCDファイル生成ノード
//
//author: Fumiaki Yamaguchi
//
//memo:
//
//--------------------------------------------------

#include <ros/ros.h>

#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud_conversion.h>

#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/visualization/cloud_viewer.h>

#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/passthrough.h>
#include <pcl/ModelCoefficients.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/kdtree/kdtree.h>
#include <pcl/segmentation/extract_clusters.h>
#include <pcl/io/pcd_io.h>

#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

#include <iostream>
#include <vector>

#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>


void savePCDandImage(const sensor_msgs::PointCloud2ConstPtr &in_cloud_const_ptr)
{
    std::cout << "Enter savePCDandImage" << std::endl;
   
    pcl::PointCloud<pcl::PointXYZRGB> in_cloud;
    pcl::fromROSMsg(*in_cloud_const_ptr, in_cloud);
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr in_cloud_ptr (new pcl::PointCloud<pcl::PointXYZRGB>(in_cloud));

    pcl::visualization::CloudViewer viewer ("viewer_original");
    viewer.showCloud (in_cloud_ptr);
    while (!viewer.wasStopped ())
    {
      boost::this_thread::sleep (boost::posix_time::microseconds (100));
    } 

    

} 



int main(int argc, char** argv){
    ros::init(argc, argv, "get_pcd_fromKinect");

    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("/camera/depth_registered/points", 1, savePCDandImage);

    ros::spin();
    
    return 0;
}

